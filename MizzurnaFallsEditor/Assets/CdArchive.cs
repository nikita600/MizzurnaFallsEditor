using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Assets
{
	public sealed class CdArchive : IEnumerable<Asset>
	{
		#region Constants

		private const int SectorSize = 0x800;

		// Смещение на таблицу файлов в SLPS017.83
		private const int RootExeOffset = 0x0008411C;

		private const int InternalExeAssetIndex = 170;
		
		// Смещение на таблицу файлов в CD.BIN/170.BIN
		private const int InternalExeOffset = 0x00023648;
		
		#endregion
		
		#region Fields

		private byte[] _exeBytes;
		private readonly List<Asset> _assets = new List<Asset>();

		private readonly Dictionary<Type, List<Asset>> _assetsByTypes = new Dictionary<Type, List<Asset>>();

		#endregion

		#region Public
		
		public List<T> GetAllAssets<T>() where T : Asset
		{
			var assetsType = typeof(T);
			var resultAssets = new List<T>();
			if (_assetsByTypes.TryGetValue(assetsType, out var assets))
			{
				foreach (var asset in assets)
				{
					resultAssets.Add(asset as T);
				}
			}

			return resultAssets;
		}

		public void Load(byte[] exeBytes, byte[] archiveBytes)
		{
			_exeBytes = exeBytes;
			
			var fileEntries = LoadFileEntries(exeBytes);
			LoadAssets(fileEntries, archiveBytes);
		}

		public void Save(out byte[] exeBytes, out byte[] archiveBytes)
		{
			var fileEntries = GetAssetEntries();
			exeBytes = SaveFileEntries(_exeBytes, RootExeOffset, fileEntries);
			archiveBytes = SaveArchive(fileEntries);
			
			var maxRamAssetSize = 0;
			for (var i = 213; i <= 290; ++i)
			{
				var size = fileEntries[i].SizeActual;
				if (maxRamAssetSize < size)
				{
					maxRamAssetSize = size;
				}
			}

			exeBytes = PatchRootExe(exeBytes, maxRamAssetSize);
		}

		#endregion

		#region Private

		private static IEnumerable<AssetEntry> LoadFileEntries(byte[] exeBytes)
		{
			var fileEntries = new List<AssetEntry>();
			
			using (var exeStream = new MemoryStream(exeBytes))
			{
				exeStream.Position = RootExeOffset;
				
				using (var exeReader = new BinaryReader(exeStream))
				{
					for (var assetIndex = 0; ; ++assetIndex)
					{
						var sectorPosition = exeReader.ReadInt32();
						var sizeInBytes = exeReader.ReadInt32();

						if (sectorPosition == 0 && sizeInBytes == 0)
						{
							break;
						}
						
						fileEntries.Add(new AssetEntry(assetIndex, sectorPosition, sizeInBytes));
					}
				}
			}

			//var stringBuilder = new StringBuilder();
			//foreach (var fileEntry in fileEntries)
			//{
			//	stringBuilder.AppendLine(fileEntry.ToString());
			//}
			//
			//File.WriteAllText("FileEntries.txt", stringBuilder.ToString());
			
			return fileEntries;
		}

		private void LoadAssets(IEnumerable<AssetEntry> fileEntries, byte[] archiveBytes)
		{
			_assets.Clear();
			_assetsByTypes.Clear();
			
			using (var archiveStream = new MemoryStream(archiveBytes))
			{
				using (var archiveReader = new BinaryReader(archiveStream))
				{
					foreach (var fileEntry in fileEntries)
					{
						archiveStream.Position = fileEntry.Position;

						var signature = archiveReader.ReadInt32();
						archiveStream.Position = fileEntry.Position;

						var assetBytes = signature != 0x4E494231
							? archiveReader.ReadBytes(fileEntry.SizeActual)
							: archiveReader.ReadBytes(fileEntry.SizeInSectors);

						var asset = AssetUtility.DeserializeAsset(assetBytes, fileEntry.Name);

						_assets.Add(asset);

						RegisterAsset(asset);
					}
				}
			}
		}

		private void RegisterAsset(Asset asset)
		{
			var assetType = asset.GetType();
			if (!_assetsByTypes.TryGetValue(assetType, out var assetTypes))
			{
				assetTypes = new List<Asset>();
				_assetsByTypes.Add(assetType, assetTypes);
			}

			assetTypes.Add(asset);

			foreach (var childAsset in asset.ChildAssets)
			{
				RegisterAsset(childAsset);
			}
		}

		private List<AssetEntry> GetAssetEntries()
		{
			var index = 0;
			var currentPosition = 0;

			var fileEntries = new List<AssetEntry>();
			foreach (var asset in _assets)
			{
				var assetBytes = asset.Serialize();

				var size = assetBytes.Length;
				var position = currentPosition / SectorSize;
				var fileEntry = new AssetEntry(index, position, size);

				fileEntries.Add(fileEntry);

				index++;
				currentPosition += fileEntry.SizeInSectors;
			}

			return fileEntries;
		}
		
		private byte[] SaveArchive(List<AssetEntry> fileEntries)
		{
			var assetIndex = 0;
			var emptyBuffer = new byte[SectorSize];
			
			using (var archiveStream = new MemoryStream())
			{
				using (var archiveWriter = new BinaryWriter(archiveStream))
				{
					foreach (var asset in _assets)
					{
						var assetBytes = asset.Serialize();

						if (assetIndex == InternalExeAssetIndex)
						{
							assetBytes = SaveFileEntries(assetBytes, InternalExeOffset, fileEntries);
						}
						
						archiveWriter.Write(assetBytes);
						
						var padding = (int)archiveStream.Position % SectorSize;
						if (padding > 0)
						{
							archiveWriter.Write(emptyBuffer, 0, SectorSize - padding);
						}
						
						assetIndex++;
					}
				}
				
				return archiveStream.ToArray();
			}
		}

		private static byte[] SaveFileEntries(byte[] exeBytes, int offset, IEnumerable<AssetEntry> fileEntries)
		{
			using (var exeStream = new MemoryStream(exeBytes))
			{
				exeStream.Position = offset;
				
				using (var exeWriter = new BinaryWriter(exeStream))
				{
					foreach (var fileEntry in fileEntries)
					{
						exeWriter.Write(fileEntry.PositionInSectors);
						exeWriter.Write(fileEntry.SizeActual);
					}

					return exeStream.ToArray();
				}
			}
		}
		
		private static byte[] PatchRootExe(byte[] exeBytes, int maxRamAssetSize)
		{
			//const int FONT_WIDTH = 0x0C;

			var rootExeStream = new MemoryStream(exeBytes);
			var rootWriter = new BinaryWriter(rootExeStream);

			maxRamAssetSize += 1;
			
			// Patch RamAssetSize
			rootExeStream.Position = 0x00038E3C;
			//rootWriter.Write(0xB4144228); // original command
			rootWriter.Write(0x28420000 | maxRamAssetSize);

			// Patch FontWidth
			//rootExeStream.Position = 0x0002416C;
			//rootWriter.Write(0x2405000F); // original command
			//rootWriter.Write(0x24050000 | FONT_WIDTH);

			var result = rootExeStream.ToArray();

			rootWriter.Close();
			rootExeStream.Close();

			return result;
		}
		
		#endregion
		
		#region IEnumerable Impl

		public IEnumerator<Asset> GetEnumerator()
		{
			return _assets.GetEnumerator();
		}

		IEnumerator IEnumerable.GetEnumerator()
		{
			return GetEnumerator();
		}

		#endregion
		
		#region Nested

		private sealed class AssetEntry
		{
			#region Fields
			
			public readonly int PositionInSectors;
			public readonly int SizeInSectors;
			public readonly int SizeActual;

			private readonly int _assetIndex;
			
			#endregion
			#region Properties

			public string Name => _assetIndex.ToString("D4");

			public int Position => PositionInSectors * SectorSize;

			#endregion
			#region Constructor

			public AssetEntry(int assetIndex, int positionInSectors, int sizeActual)
			{
				_assetIndex = assetIndex;
				PositionInSectors = positionInSectors;
				SizeActual = sizeActual;
				
				SizeInSectors = (sizeActual / SectorSize) * SectorSize;
				SizeInSectors += (sizeActual % SectorSize > 0) ? SectorSize : 0;
			}

			#endregion
			#region Methods
		
			public override string ToString()
			{
				return $"Asset {Name}: Position: 0x{Position:X8}, Size: 0x{SizeActual:X8}";
			}

			#endregion
		}
		
		#endregion
	}
}

using System;
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Utilities
{
	public static class AssetUtility
	{
		#region Constants
		
		private static readonly HashSet<string> LevelAssetArchiveNames = new HashSet<string>();

		#endregion

		#region Fields

		private static readonly Dictionary<uint, Type> AssetTypes = new Dictionary<uint, Type>();

		#endregion

		#region Public

		static AssetUtility()
		{
			for (int i = 3; i <= 168; i += 5)
			{
				var name = i.ToString("D4");
				LevelAssetArchiveNames.Add(name);

				if (i == 138)
				{
					continue;
				}

				LevelAssetArchiveNames.Add(name + "_00");
			}

			for (int i = 4; i <= 169; i += 5)
			{
				var name = i.ToString("D4");

				LevelAssetArchiveNames.Add(name + "_01");
				LevelAssetArchiveNames.Add(name + "_02");
				LevelAssetArchiveNames.Add(name + "_03");
			}

			LevelAssetArchiveNames.Add("0169_05");

			var entries = ReflectionUtility.GetTypesWithAttribute<AssetDataAttribute>();
			foreach (var entry in entries)
			{
				var assetData = entry.Key;
				var assetType = entry.Value;
				
				foreach (var signature in assetData.Signatures)
				{
					if (!AssetTypes.ContainsKey(signature))
					{
						AssetTypes.Add(signature, assetType);
					}
					else
					{
						throw new Exception("Asset type already registered: " + assetType);
					}
				}
			}
		}

		public static Asset DeserializeAsset(byte[] assetBytes, string name)
		{
			Asset asset;

			if (TimAtlasAsset.IsTimAtlas(name))
			{
				asset = new TimAtlasAsset();
				asset.Name = name;
				asset.Deserialize(assetBytes);

				return asset;
			}

			if (TryGetSignature(assetBytes, out var signature))
			{
				if (AssetTypes.TryGetValue(signature, out var assetType))
				{
					asset = (Asset)Activator.CreateInstance(assetType);
					asset.Name = name;
					asset.Deserialize(assetBytes);

					return asset;
				}

				if ((signature & 0x0000FFFF) == 0x000088FA)
				{
					asset = new MeshAsset();
					asset.Name = name;
					asset.Deserialize(assetBytes);

					return asset;
				}
			}

			if (LevelAssetArchiveNames.Contains(name) && assetBytes.Length > sizeof(int))
			{
				asset = new LevelAssetArchive();
			}
			else
			{
				asset = new BinaryAsset();
			}

			asset.Name = name;
			asset.Deserialize(assetBytes);

			return asset;
		}

		public static bool IsLevelAssetArchive(string name)
		{
			return LevelAssetArchiveNames.Contains(name);
		}

		private static bool TryGetSignature(byte[] assetBytes, out uint signature)
		{
			using (var assetStream = new MemoryStream(assetBytes))
			{
				if (assetStream.Length > sizeof(int))
				{
					using (var binaryReader = new BinaryReader(assetStream))
					{
						signature = binaryReader.ReadUInt32();
						return true;
					}
				}
			}

			signature = 0;
			return false;
		}

		#endregion
	}
}

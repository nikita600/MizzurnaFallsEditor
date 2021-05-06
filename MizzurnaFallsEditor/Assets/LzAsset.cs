using System.IO;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Assets
{
	[AssetData(0x4E494231)] // 1BIN
	public sealed class LzAsset : Asset
	{
		#region Constants

		private const int Signature = 0x4E494231;

		#endregion
		
		#region Public

		public override void Deserialize(byte[] bytes)
		{
			_bytes = bytes;

			using (var compressedReader = new BinaryReader(new MemoryStream(bytes)))
			{
				compressedReader.ReadUInt32(); // Signature
				var decompressedBytesSize = Swap(compressedReader.ReadInt32());
					
				var decompressedBytes = LzssUtility.Decompress(compressedReader, decompressedBytesSize);

				var childAsset = AssetUtility.DeserializeAsset(decompressedBytes, Name);

				_childAssets.Add(childAsset);
			}
		}

		public override byte[] Serialize()
		{
			var childAssetBytes = _childAssets[0].Serialize();

			var compressedBytes = LzssUtility.Compress(childAssetBytes);
			var decompressedSize = Swap(childAssetBytes.Length);
			
			using (var packedStream = new MemoryStream())
			{
				using (var packedWriter = new BinaryWriter(packedStream))
				{
					packedWriter.Write(Signature);
					packedWriter.Write(decompressedSize);
					packedWriter.Write(compressedBytes);
				}

				_bytes = packedStream.ToArray();
			}

			return _bytes;
		}

		#endregion
	}
}

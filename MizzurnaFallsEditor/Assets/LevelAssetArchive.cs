using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(0x0000000B)]
    public sealed class LevelAssetArchive : Asset
    { 
        #region Public

        public override void Deserialize(byte[] bytes)
        {
	        _bytes = bytes;
	        _childAssets.Clear();

	        var assetStream = new MemoryStream(bytes);
	        var assetReader = new BinaryReader(assetStream);

	        var assetIndex = 0;
	        var assetEntries = ReadAssetEntries(assetReader);
	        foreach (var assetEntry in assetEntries)
	        {
		        assetStream.Position = assetEntry.Offset;
		        var assetBytes = assetReader.ReadBytes(assetEntry.Size);
		        var assetName = string.Concat(Name, "_", assetIndex.ToString("D2"));
				
				Asset asset;
				if (AssetUtility.IsLevelAssetArchive(assetName) && assetBytes.Length > sizeof(uint))
				{
					asset = new LevelAssetArchive() { Name = assetName };
					asset.Deserialize(assetBytes);
				}
				else
				{
					asset = AssetUtility.DeserializeAsset(assetBytes, assetName);
				}

				_childAssets.Add(asset);

		        assetIndex++;
	        }

	        assetReader.Close();
	        assetStream.Close();
        }

        public override byte[] Serialize()
        {
	        var containerStream = new MemoryStream();
	        var containerWriter = new BinaryWriter(containerStream);

	        containerWriter.Write(_childAssets.Count);
	        containerWriter.Write(default(int));

	        var assetEntries = new List<AssetEntry>();
	        var offset = (int)containerStream.Position + (_childAssets.Count * 8);
			
	        foreach (var asset in _childAssets)
	        {
		        var assetBytes = asset.Serialize();
		        var assetSize = assetBytes.Length;

		        var assetEntry = new AssetEntry(offset, assetSize);

		        var tempsize = (assetSize / 4) * 4;
		        tempsize += (assetSize % 4 > 0) ? 4 : 0;

		        offset += tempsize;

		        assetEntries.Add(assetEntry);

		        if (assetEntry.Offset % 4 > 0)
		        {
			        System.Console.WriteLine("STAPH");
		        }

		        containerWriter.Write(assetEntry.Offset);
		        containerWriter.Write(assetEntry.Size);
	        }

	        for (var i = 0; i < assetEntries.Count; ++i)
	        {
		        var asset = _childAssets[i];
		        var assetEntry = assetEntries[i];

		        containerStream.Position = assetEntry.Offset;
		        containerWriter.Write(asset.Serialize());
	        }

	        var containerBytes = containerStream.ToArray();

	        containerWriter.Close();
	        containerStream.Close();

	        return containerBytes;
        }

        #endregion

        #region Private

        private static IEnumerable<AssetEntry> ReadAssetEntries(BinaryReader assetReader)
        {
	        var assetEntries = new List<AssetEntry>();

	        var assetEntriesCount = assetReader.ReadInt32();
	        assetReader.ReadInt32(); // skip 4 empty bytes

	        for (var i = 0; i < assetEntriesCount; ++i)
	        {
		        var offset = assetReader.ReadInt32();
		        var size = assetReader.ReadInt32();

		        var assetEntry = new AssetEntry(offset, size);
		        assetEntries.Add(assetEntry);
	        }

	        return assetEntries;
        }

        #endregion
        
        #region Nested
        
        private struct AssetEntry
        {
	        private const int Padding = 4;
        
        	public readonly int Offset;
        	public readonly int Size;
        
        	public AssetEntry(int offset, int size)
        	{
        		Offset = (offset / Padding) * Padding;
        		Offset += (offset % 4) > 0 ? Padding : 0;
        		
        		if (Offset % 4 > 0)
        			System.Console.WriteLine("FAIL TO PADDING");
        
        		Size = size;
        	}
        }
        
        #endregion
    }
}
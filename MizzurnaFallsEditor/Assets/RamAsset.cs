using System;
using System.IO;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(0x80010000)]
    public sealed class RamAsset : Asset
    {
		#region Constants

		private const int MaxSize = 0x14B4;

		#endregion

		#region Fields

		private byte[] _headerData;

        #endregion
        
        #region Public

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

			if (_bytes.Length > MaxSize)
			{
				Console.WriteLine("Fail could be at: " + Name + ", Size: " + _bytes.Length + ", Expected: " + MaxSize);
			}

            using (var assetStream = new MemoryStream(bytes))
            {
                using (var assetReader = new BinaryReader(assetStream))
                {
                    var offset = assetReader.ReadInt32();
                    var mdtOffset = assetReader.ReadInt32();

                    var headerDataSize = mdtOffset - offset;
                    assetStream.Position = 0;

                    _headerData = assetReader.ReadBytes(headerDataSize);
			
                    var assetSize = (int)(assetStream.Length - assetStream.Position);
                    var mdtAssetBytes = assetReader.ReadBytes(assetSize);

                    var mdtAsset = AssetUtility.DeserializeAsset(mdtAssetBytes, Name);
                    _childAssets.Add(mdtAsset);
                }
            }
        }

        public override byte[] Serialize()
        {
            using (var assetStream = new MemoryStream())
            {
                using (var assetWriter = new BinaryWriter(assetStream))
                {
                    assetWriter.Write(_headerData);
                    assetWriter.Write(_childAssets[0].Serialize());
					
                    _bytes = assetStream.ToArray();

					GetPaddedBytes(ref _bytes, 4);

                    if (_bytes.Length % 4 > 0)
                    {
                        throw new Exception("Fail to serialize RAM asset.");
                    }
                    
                    return _bytes;
                }
            }
        }

        #endregion
    }
}
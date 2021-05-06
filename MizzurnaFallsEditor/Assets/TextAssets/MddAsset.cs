using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(Signature)]
    public sealed class MddAsset : BaseTextAsset
    {
        #region Constants

        private const int Signature = 0x0044444D;

        #endregion
        
        #region Public
        
        public override byte[] Serialize()
        {
            _bytes = Serialize(_rawStrings);
            return _bytes;
        }

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

            using (var memoryStream = new MemoryStream(bytes))
            {
                using (var binaryReader = new BinaryReader(memoryStream))
                {
                    binaryReader.ReadInt32(); // Signature
                    var data = binaryReader.ReadBytes((int)(memoryStream.Length - memoryStream.Position));
                    
                    _rawStrings.Clear();
                    _rawStrings.AddRange(HuffmanUtility.Decompress(data));
                }
            }
        }

        public static byte[] Serialize(List<List<short>> rawStrings)
        {
            using (var memoryStream = new MemoryStream())
            {
                using (var binaryWriter = new BinaryWriter(memoryStream))
                {
                    binaryWriter.Write(Signature);
                    
                    var data = HuffmanUtility.Compress(rawStrings);
                    binaryWriter.Write(data);
                }
                
                var result = memoryStream.ToArray();

                GetPaddedBytes(ref result, 4);
                
                return result;
            }
        }
        
        #endregion
    }
}
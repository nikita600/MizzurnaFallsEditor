using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Utilities
{
    public partial class HuffmanUtility
    {
        #region Public
        
        public static List<List<short>> Decompress(byte[] compressedData)
        {
            var strings = new List<List<short>>();

            using (var memoryStream = new MemoryStream(compressedData))
            {
                using (var binaryReader = new BinaryReader(memoryStream))
                {
                    var stringsCount = binaryReader.ReadInt32();
                    var stringPointersOffset = binaryReader.ReadInt32();
                    var bitIndexesOffset = binaryReader.ReadInt32();
                    var stringsOffset = binaryReader.ReadInt32();
                    
                    ReadNodes(binaryReader, out var leftNodes, out var rightNodes, out var characters);
                    ReadStringsData(binaryReader, stringsCount, stringPointersOffset, bitIndexesOffset,
                        out var stringPointers, out var stringSizes, out var bitIndexes);
                    
                    for (var i = 0; i < stringsCount; ++i)
                    {
                        memoryStream.Position = stringsOffset + stringPointers[i];
                        
                        var str = ReadString(binaryReader, 
                            leftNodes, rightNodes, characters, stringSizes[i], bitIndexes[i]);
                        
                        strings.Add(str);
                    }
                }
            }
            
            return strings;
        }
        
        #endregion

        #region Private

        private static void ReadNodes(BinaryReader binaryReader, out List<ushort> leftNodes, out List<ushort> rightNodes, out List<short> characters)
        {
            var memoryStream = binaryReader.BaseStream;
            
            var leftNodesOffset = binaryReader.ReadInt32();
            var leftNodesCount = binaryReader.ReadInt32();

            var rightNodesOffset = binaryReader.ReadInt32();
            var rightNodesCount = binaryReader.ReadInt32();

            var charactersOffset = binaryReader.ReadInt32();
            var charactersCount = binaryReader.ReadInt32();
            
            leftNodes = new List<ushort>();
            memoryStream.Position = leftNodesOffset;
            for (var i = 0; i < leftNodesCount; ++i)
            {
                leftNodes.Add(binaryReader.ReadUInt16());
            }
                    
            rightNodes = new List<ushort>();
            memoryStream.Position = rightNodesOffset;
            for (var i = 0; i < rightNodesCount; ++i)
            {
                rightNodes.Add(binaryReader.ReadUInt16());
            }

            characters = new List<short>();
            memoryStream.Position = charactersOffset;
            for (var i = 0; i < charactersCount; ++i)
            {
                characters.Add(binaryReader.ReadInt16());
            }
        }

        private static void ReadStringsData(BinaryReader binaryReader, int stringsCount, int stringPointersOffset,
            int bitIndexesOffset, out List<ushort> stringPointers, out List<int> stringSizes, out List<byte> bitIndexes)
        {
            var memoryStream = binaryReader.BaseStream;
            
            bitIndexes = new List<byte>();
            stringSizes = new List<int>();
            stringPointers = new List<ushort>();
            
            memoryStream.Position = stringPointersOffset;
            for (var i = 0; i < stringsCount; ++i)
            {
                stringPointers.Add(binaryReader.ReadUInt16());
                stringSizes.Add(binaryReader.ReadUInt16());
            }

            
            memoryStream.Position = bitIndexesOffset;
            for (var i = 0; i < stringsCount; ++i)
            {
                bitIndexes.Add(binaryReader.ReadByte());
            }
        }

        private static List<short> ReadString(BinaryReader binaryReader, 
            List<ushort> leftNodes, List<ushort> rightNodes, List<short> characters, int stringSize, int bitIndex)
        {
            ushort offset = 0;
            var firstByte = false;
            var str = new List<short>();
            while (str.Count < stringSize)
            {
                var data = binaryReader.ReadByte();

                var bitCount = 0;
                if (!firstByte)
                {
                    bitCount = bitIndex;
                    data <<= bitIndex;
                    firstByte = true;
                }

                for (var j = bitCount; j < 8; ++j)
                {
                    var leaf = data & 0x80;
                    data <<= 1;
                                
                    offset = leaf == 0x80 ? rightNodes[offset] : leftNodes[offset];

                    if (offset < 0x8000)
                    {
                        continue;
                    }
                                
                    var character = characters[offset - 0x8000];
                    str.Add(character);
                    offset = 0;

                    if (str.Count < stringSize)
                    {
                        continue;
                    }
                                
                    break;
                }

                if (str.Count >= stringSize)
                {
                    break;
                }
            }

            return str;
        }
        
        #endregion
    }
}
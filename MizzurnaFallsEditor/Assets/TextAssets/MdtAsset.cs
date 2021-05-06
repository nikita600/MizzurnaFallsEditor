using System;
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(Signature)]
    public sealed class MdtAsset : BaseTextAsset
    {
        #region Constants

        private const int Signature = 0x0054444D;

        private const int CharTableSize = sbyte.MaxValue + 1;
        
        private readonly HashSet<string> MdtPreserveNames = new HashSet<string>{ /*"0169_04",*/ "0169_06", "0173", "0317", "0318" };
        
        #endregion

        #region Fields

        private static bool _mddSerializationMode = false;
        private static EncodingTable _pixelFontsEncodingTable = null;

        #endregion
        
        #region Public

        public static void SetActiveMddSerializeMode(bool active)
        {
            _mddSerializationMode = active;
        }

        public static void SetPixelFontsTable(EncodingTable pixelFontsTable)
        {
            _pixelFontsEncodingTable = pixelFontsTable;
        }
        
        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;
            
            using (var assetStream = new MemoryStream(bytes))
            {
                using (var assetReader = new BinaryReader(assetStream))
                {
                    assetReader.ReadInt32(); // signature

                    var stringCount = assetReader.ReadInt32();

                    var characterTable = new short[CharTableSize];
                    for (var i = 0; i < characterTable.Length; ++i)
                    {
                        characterTable[i] = assetReader.ReadInt16();
                    }
                    
                    var stringEntries = new List<StringEntry>(stringCount);
                    for (var i = 0; i < stringCount; ++i)
                    {
                        var offset = assetReader.ReadInt16();
                        var characterCount = assetReader.ReadInt16();
                        
                        stringEntries.Add(new StringEntry(offset, characterCount));
                    }
                    
                    _rawStrings.Clear();
                    var stringDataOffset = (int)assetStream.Position;
                    foreach (var entry in stringEntries)
                    {
                        assetStream.Position = stringDataOffset + entry.Offset;
                        
                        var rawString = new List<short>();
                        for (int i = 0, l = entry.CharacterCount; i < l; ++i)
                        {
                            short character;
                            var control = assetReader.ReadSByte();
                            if (control >= 0)
                            {
                                character = characterTable[control];
                            }
                            else
                            {
                                assetStream.Seek(-1, SeekOrigin.Current);
                                character = assetReader.ReadInt16();
                            }
                            
                            rawString.Add(Swap(character));
                        }
                        
                        _rawStrings.Add(rawString);
                    }
                }
            }
        }

        public override byte[] Serialize()
        {
            // HACK
            if (_mddSerializationMode && !MdtPreserveNames.Contains(Name))
            {
                Console.WriteLine("Convert to MDD: " + Name);
                return MddAsset.Serialize(_rawStrings);
            }
            
            var mdtStream = new MemoryStream();
            var mdtWriter = new BinaryWriter(mdtStream);

            mdtWriter.Write(Signature);
            mdtWriter.Write(_rawStrings.Count);
            
            var characterTable = BuildCharacterTable(_rawStrings);
            foreach (var character in characterTable)
            {
                mdtWriter.Write(Swap(character));
            }
            
            var characterLookupTable = new Dictionary<short, int>();
            for (var i = 0; i < characterTable.Length; ++i)
            {
                var character = characterTable[i];
                if (!characterLookupTable.ContainsKey(character))
                {
                    characterLookupTable.Add(character, i);
                }
                else
                {
                    //Console.WriteLine("Character already exists: " + character.ToString("X4"));
                }
            }
            
            var offset = 0;
            var stringEntries = new List<StringEntry>();
            var packedStrings = new List<byte[]>(_rawStrings.Count);
            foreach (var entry in _rawStrings)
            {
                var packedString = PackMdtString(characterLookupTable, entry);
                
                packedStrings.Add(packedString);
                stringEntries.Add(new StringEntry(offset, entry.Count));

                offset += packedString.Length;
            }
            
            foreach (var entry in stringEntries)
            {
                mdtWriter.Write((short)entry.Offset);
                mdtWriter.Write((short)entry.CharacterCount);
            }

            foreach (var packedString in packedStrings)
            {
                mdtWriter.Write(packedString);
            }
			
            _bytes = mdtStream.ToArray();

            if (_bytes.Length % 4 > 0)
            {
                var newSize = (_bytes.Length / 4) * 4;
                newSize += (_bytes.Length % 4 > 0) ? 4 : 0;

                Array.Resize(ref _bytes, newSize);
            }

            mdtWriter.Close();
            mdtStream.Close();

            return _bytes;
        }
        
        #endregion

        #region Private
        
        private static short[] BuildCharacterTable(IEnumerable<List<short>> stringEntries)
        {
            //return BuildAsciiTable();
            
            var characterFrequencies = new Dictionary<short, int>();
            foreach (var stringEntry in stringEntries)
            {
                foreach (var keyCode in stringEntry)
                {
                    if (!characterFrequencies.ContainsKey(keyCode))
                    {
                        characterFrequencies.Add(keyCode, 0);
                    }

                    characterFrequencies[keyCode] += 1;
                }
            }

            var charEntries = new List<KeyValuePair<short, int>>(characterFrequencies);
            charEntries.Sort((lhs, rhs) => -lhs.Value.CompareTo(rhs.Value));
            
            var characterTable = new short[CharTableSize];
            for (var i = 0; i < CharTableSize; ++i)
            {
                characterTable[i] = i < charEntries.Count ? charEntries[i].Key : default(short);
            }

            return characterTable;
        }
        
        private static byte[] PackMdtString(IReadOnlyDictionary<short, int> characterTable, IEnumerable<short> rawString)
        {
            using (var packedStream = new MemoryStream())
            {
                using (var packedWriter = new BinaryWriter(packedStream))
                {
                    foreach (var character in rawString)
                    {
                        if (characterTable.TryGetValue(character, out var index))
                        {
                            packedWriter.Write((byte) index);
                        }
                        else
                        {
                            packedWriter.Write(Swap(character));
                            //Console.WriteLine("Fail to pack char: " + character.ToString("X4"));
                        }
                    }
                }

                return packedStream.ToArray();
            }
        }
        
        private static short[] BuildAsciiTable()
        {
            var characterTable = new short[CharTableSize];
            for (var i = 0; i < CharTableSize; ++i)
            {
                characterTable[i] = (short)DefaultAsciiMdtTable[i].Key;
            }

            return characterTable;
        }
        
        #endregion

        #region Nested

        private struct StringEntry
        {
            public readonly int Offset;
            public readonly int CharacterCount;

            public StringEntry(int offset, int characterCount)
            {
                Offset = offset;
                CharacterCount = characterCount;
            }
        }

        private static readonly List<KeyValuePair<ushort, char>> DefaultAsciiMdtTable = new List<KeyValuePair<ushort, char>>()
        {
            new KeyValuePair<ushort, char>(0xFFFF, (char)0x00),  // 00 
            new KeyValuePair<ushort, char>(0x0001, (char)0x01),  // 01 
            new KeyValuePair<ushort, char>(0x0002, (char)0x02),  // 02 
            new KeyValuePair<ushort, char>(0x0003, (char)0x03),  // 03 
            new KeyValuePair<ushort, char>(0x0004, (char)0x04),  // 04 
            new KeyValuePair<ushort, char>(0x0005, (char)0x05),  // 05 
            new KeyValuePair<ushort, char>(0x0006, (char)0x06),  // 06 
            new KeyValuePair<ushort, char>(0x0007, (char)0x07),  // 07 
            new KeyValuePair<ushort, char>(0x0008, (char)0x08),  // 08 
            new KeyValuePair<ushort, char>(0x0009, (char)0x09),  // 09 
            new KeyValuePair<ushort, char>(0xFF6E, '\n'), // 0A 
            new KeyValuePair<ushort, char>(0x000B, (char)0x0B),  // 0B 
            new KeyValuePair<ushort, char>(0x000C, (char)0x0C),  // 0C 
            new KeyValuePair<ushort, char>(0x000D, (char)0x0D),  // 0D 
            new KeyValuePair<ushort, char>(0x000E, (char)0x0E),  // 0E 
            new KeyValuePair<ushort, char>(0x000F, (char)0x0F),  // 0F 

            new KeyValuePair<ushort, char>(0x0010, (char)0x10),  // 10 
            new KeyValuePair<ushort, char>(0x81A2, '△'),  // 11 Triangle
            new KeyValuePair<ushort, char>(0x819B, '○'),  // 12 Circle
            new KeyValuePair<ushort, char>(0x817E, '×'),  // 13 Cross
            new KeyValuePair<ushort, char>(0x81A0, '□'),  // 14 Square
            new KeyValuePair<ushort, char>(0x0015, (char)0x15),  // 15 
            new KeyValuePair<ushort, char>(0x0016, (char)0x16),  // 16 
            new KeyValuePair<ushort, char>(0x0017, (char)0x17),  // 17 
            new KeyValuePair<ushort, char>(0x0018, (char)0x18),  // 18 
            new KeyValuePair<ushort, char>(0x0019, (char)0x19),  // 19 
            new KeyValuePair<ushort, char>(0x001A, (char)0x1A),  // 1A 
            new KeyValuePair<ushort, char>(0x001B, (char)0x1B),  // 1B 
            new KeyValuePair<ushort, char>(0x001C, (char)0x1C),  // 1C 
            new KeyValuePair<ushort, char>(0x001D, (char)0x1D),  // 1D 
            new KeyValuePair<ushort, char>(0x001E, (char)0x1E),  // 1E 
            new KeyValuePair<ushort, char>(0x001F, (char)0x1F),  // 1F 
            
            new KeyValuePair<ushort, char>(0xA000, ' '),  // 20 Space
            new KeyValuePair<ushort, char>(0x8149, '!'),  // 21 
            new KeyValuePair<ushort, char>(0x818D, '"'),  // 22 
            new KeyValuePair<ushort, char>(0x8194, '#'),  // 23 
            new KeyValuePair<ushort, char>(0x8190, '$'),  // 24 
            new KeyValuePair<ushort, char>(0x8193, '%'),  // 25 
            new KeyValuePair<ushort, char>(0x8195, '&'),  // 26 
            new KeyValuePair<ushort, char>(0x818C, '\''), // 27 
            new KeyValuePair<ushort, char>(0x8169, '('),  // 28 
            new KeyValuePair<ushort, char>(0x816A, ')'),  // 29 
            new KeyValuePair<ushort, char>(0x817E, '*'),  // 2A 
            new KeyValuePair<ushort, char>(0x817B, '+'),  // 2B 
            new KeyValuePair<ushort, char>(0x8143, ','),  // 2C 
            new KeyValuePair<ushort, char>(0x817C, '-'),  // 2D 
            new KeyValuePair<ushort, char>(0x8144, '.'),  // 2E 
            new KeyValuePair<ushort, char>(0x815E, '/'),  // 2F 
            
            new KeyValuePair<ushort, char>(0x824F, '0'), // 30 
            new KeyValuePair<ushort, char>(0x8250, '1'), // 31 
            new KeyValuePair<ushort, char>(0x8251, '2'), // 32 
            new KeyValuePair<ushort, char>(0x8252, '3'), // 33 
            new KeyValuePair<ushort, char>(0x8253, '4'), // 34 
            new KeyValuePair<ushort, char>(0x8254, '5'), // 35 
            new KeyValuePair<ushort, char>(0x8255, '6'), // 36 
            new KeyValuePair<ushort, char>(0x8256, '7'), // 37 
            new KeyValuePair<ushort, char>(0x8257, '8'), // 38 
            new KeyValuePair<ushort, char>(0x8258, '9'), // 39 
            new KeyValuePair<ushort, char>(0x8146, ':'), // 3A 
            new KeyValuePair<ushort, char>(0x8147, ';'), // 3B 
            new KeyValuePair<ushort, char>(0x8183, '<'), // 3C 
            new KeyValuePair<ushort, char>(0x8181, '='), // 3D 
            new KeyValuePair<ushort, char>(0x8184, '>'), // 3E 
            new KeyValuePair<ushort, char>(0x8148, '?'), // 3F 
            
            new KeyValuePair<ushort, char>(0x8197, '@'), // 40
            new KeyValuePair<ushort, char>(0x8260, 'A'), // 41
            new KeyValuePair<ushort, char>(0x8261, 'B'), // 42
            new KeyValuePair<ushort, char>(0x8262, 'C'), // 43
            new KeyValuePair<ushort, char>(0x8263, 'D'), // 44
            new KeyValuePair<ushort, char>(0x8264, 'E'), // 45
            new KeyValuePair<ushort, char>(0x8265, 'F'), // 46
            new KeyValuePair<ushort, char>(0x8266, 'G'), // 47
            new KeyValuePair<ushort, char>(0x8267, 'H'), // 48
            new KeyValuePair<ushort, char>(0x8268, 'I'), // 49
            new KeyValuePair<ushort, char>(0x8269, 'J'), // 4A
            new KeyValuePair<ushort, char>(0x826A, 'K'), // 4B
            new KeyValuePair<ushort, char>(0x826B, 'L'), // 4C
            new KeyValuePair<ushort, char>(0x826C, 'M'), // 4D
            new KeyValuePair<ushort, char>(0x826D, 'N'), // 4E
            new KeyValuePair<ushort, char>(0x826E, 'O'), // 4F
            
            new KeyValuePair<ushort, char>(0x826F, 'P'), // 50
            new KeyValuePair<ushort, char>(0x8270, 'Q'), // 51
            new KeyValuePair<ushort, char>(0x8271, 'R'), // 52
            new KeyValuePair<ushort, char>(0x8272, 'S'), // 53
            new KeyValuePair<ushort, char>(0x8273, 'T'), // 54
            new KeyValuePair<ushort, char>(0x8274, 'U'), // 55
            new KeyValuePair<ushort, char>(0x8275, 'V'), // 56
            new KeyValuePair<ushort, char>(0x8276, 'W'), // 57
            new KeyValuePair<ushort, char>(0x8277, 'X'), // 58
            new KeyValuePair<ushort, char>(0x8278, 'Y'), // 59
            new KeyValuePair<ushort, char>(0x8279, 'Z'), // 5A
            new KeyValuePair<ushort, char>(0x816D, '['), // 5B
            new KeyValuePair<ushort, char>(0x815F, '\\'),// 5C
            new KeyValuePair<ushort, char>(0x816E, ']'), // 5D
            new KeyValuePair<ushort, char>(0x814F, '^'), // 5E
            new KeyValuePair<ushort, char>(0x8151, '_'), // 5F
            
            new KeyValuePair<ushort, char>(0x814D, '`'), // 60
            new KeyValuePair<ushort, char>(0x8281, 'a'), // 61
            new KeyValuePair<ushort, char>(0x8282, 'b'), // 62
            new KeyValuePair<ushort, char>(0x8283, 'c'), // 63
            new KeyValuePair<ushort, char>(0x8284, 'd'), // 64
            new KeyValuePair<ushort, char>(0x8285, 'e'), // 65
            new KeyValuePair<ushort, char>(0x8286, 'f'), // 66
            new KeyValuePair<ushort, char>(0x8287, 'g'), // 67
            new KeyValuePair<ushort, char>(0x8288, 'h'), // 68
            new KeyValuePair<ushort, char>(0x8289, 'i'), // 69
            new KeyValuePair<ushort, char>(0x828A, 'j'), // 6A
            new KeyValuePair<ushort, char>(0x828B, 'k'), // 6B
            new KeyValuePair<ushort, char>(0x828C, 'l'), // 6C
            new KeyValuePair<ushort, char>(0x828D, 'm'), // 6D
            new KeyValuePair<ushort, char>(0x828E, 'n'), // 6E
            new KeyValuePair<ushort, char>(0x828F, 'o'), // 6F
            
            new KeyValuePair<ushort, char>(0x8290, 'p'), // 70
            new KeyValuePair<ushort, char>(0x8291, 'q'), // 71
            new KeyValuePair<ushort, char>(0x8292, 'r'), // 72
            new KeyValuePair<ushort, char>(0x8293, 's'), // 73
            new KeyValuePair<ushort, char>(0x8294, 't'), // 74
            new KeyValuePair<ushort, char>(0x8295, 'u'), // 75
            new KeyValuePair<ushort, char>(0x8296, 'v'), // 76
            new KeyValuePair<ushort, char>(0x8297, 'w'), // 77
            new KeyValuePair<ushort, char>(0x8298, 'x'), // 78
            new KeyValuePair<ushort, char>(0x8299, 'y'), // 79
            new KeyValuePair<ushort, char>(0x829A, 'z'), // 7A
            new KeyValuePair<ushort, char>(0x816F, '{'), // 7B
            new KeyValuePair<ushort, char>(0x8162, '|'), // 7C
            new KeyValuePair<ushort, char>(0x8170, '}'), // 7D
            new KeyValuePair<ushort, char>(0x8160, '~'), // 7E
            new KeyValuePair<ushort, char>(0x007F, (char)0x7F), // 7F DEL
        };

        #endregion
    }
}
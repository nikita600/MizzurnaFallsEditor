using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text;

namespace MizzurnaFallsEditor
{
    public sealed class EncodingTable
    {
        #region Fields

        private readonly string _name;
        
        private readonly Dictionary<short, char> _codeToCharTable = new Dictionary<short, char>();
        private readonly Dictionary<char, short> _charToCodeTable = new Dictionary<char, short>();
		
        private readonly Dictionary<short, char> _dupCodeToCharTable = new Dictionary<short, char>();
        private readonly Dictionary<char, short> _dupCharToCodeTable = new Dictionary<char, short>();

        #endregion
        
        #region Public

        public EncodingTable(string name, byte[] tableBytes)
        {
            _name = name;

            var encoding = GetEncoding(tableBytes);
            var entries = GetCharEntries(tableBytes, encoding);
            var charsList = GetCharsList(entries);
            foreach (var entry in charsList)
            {
                var code = entry.Key;
                var character = entry.Value;

                if (_codeToCharTable.TryGetValue(code, out var foundChar))
                {
                    _dupCodeToCharTable.Add(code, character);
                }
                else
                {
                    _codeToCharTable.Add(code, character);
                }

                if (_charToCodeTable.TryGetValue(character, out var foundCode))
                {
                    _dupCharToCodeTable.Add(character, code);
                }
                else
                {
                    _charToCodeTable.Add(character, code);
                }
            }
        }
        
        public string Decode(short rawCharacter)
        {
            return $"[{rawCharacter:X4}]";
        }

        public short Encode(string character)
        {
            return 0;
        }
        
        public bool TryGetChar(short code, out char character)
        {
            return _codeToCharTable.TryGetValue(code, out character) || _dupCodeToCharTable.TryGetValue(code, out character);
        }

        public bool TryGetCode(char character, out short code)
        {
            return _charToCodeTable.TryGetValue(character, out code) || _dupCharToCodeTable.TryGetValue(character, out code);
        }
        
        #endregion

        #region Private

        private static Encoding GetEncoding(byte[] data)
        {
            Encoding encoding = null;
            
            using (var memoryStream = new MemoryStream(data))
            {
                using (var streamReader = new StreamReader(memoryStream))
                {
                    var encodingName = streamReader.ReadLine();
                    if (!string.IsNullOrEmpty(encodingName))
                    {
                        try
                        {
                            encoding = Encoding.GetEncoding(encodingName);
                        }
                        catch (Exception e)
                        {
                            // Don't care
                        }
                    }
                }
            }

            return encoding ?? Encoding.GetEncoding("shift-jis");
        }
        
        private static List<string> GetCharEntries(byte[] data, Encoding encoding)
        {
            var entries = new List<string>();
            
            using (var memoryStream = new MemoryStream(data))
            {
                using (var streamReader = new StreamReader(memoryStream, encoding))
                {
                    while (!streamReader.EndOfStream)
                    {
                        entries.Add(streamReader.ReadLine());
                    }
                }
            }

            return entries;
        }

        private static List<KeyValuePair<short, char>> GetCharsList(List<string> charEntries)
        {
            var stringBuilder = new StringBuilder();
			
            var charList = new List<KeyValuePair<short, char>>();
            foreach (var charEntry in charEntries)
            {
                var codeParsed = false;
                var codeValue = default(short);
                stringBuilder.Remove(0, stringBuilder.Length);
				
                foreach (var value in charEntry)
                {
                    if (!codeParsed)
                    {
                        if (value == '=')
                        {
                            codeParsed = true;
                            codeValue = short.Parse(stringBuilder.ToString(), NumberStyles.HexNumber);
							
                            stringBuilder.Remove(0, stringBuilder.Length);
                        }
                        else
                        {
                            stringBuilder.Append(value);
                        }
                    }
                    else
                    {
                        stringBuilder.Append(value);
                    }
                }

                var text = stringBuilder.ToString();
                var textArray = text.ToCharArray();

				var character = textArray[0];

				switch (text)
				{
					case "\\n":
						character = '\n';
						break;

					case "\\f":
						character = '\f';
						break;
				}
				
                charList.Add(new KeyValuePair<short, char>(codeValue, character));
            }

            return charList;
        }

        #endregion
    }
}
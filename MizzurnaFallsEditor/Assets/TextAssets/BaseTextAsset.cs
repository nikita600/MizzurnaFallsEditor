using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace MizzurnaFallsEditor.Assets
{
    public abstract class BaseTextAsset : Asset
    {
		#region Constants

		public static string NewPageKeyword => "\\xPAGE" + Environment.NewLine;

		#endregion

		#region Fields

		protected readonly List<List<short>> _rawStrings = new List<List<short>>();

        #endregion
        
        #region Properties

        public int StringsCount => _rawStrings.Count;

        public List<short> this[int stringIndex]
        {
	        get => _rawStrings[stringIndex];
	        set => _rawStrings[stringIndex] = value;
        }

        public List<List<short>> RawStrings => _rawStrings;

        #endregion

        #region Public

        public static string GetString(List<short> rawString, EncodingTable encodingTable, int stringIndex)
        {
            var stringBuilder = new StringBuilder();

            for (int i = 0, l = rawString.Count; i < l; ++i)
            {
                var charCode = rawString[i];
		        
                if (encodingTable.TryGetChar(charCode, out var character))
                {
					switch (character)
					{
						case '\n':
							stringBuilder.Append(Environment.NewLine);
							break;

						case '\f':
							stringBuilder.Append(NewPageKeyword);
							break;

						default:
							stringBuilder.Append(character);
							break;
					}
                }
                else
                {
                    stringBuilder.Append("\\x").Append(charCode.ToString("X4"));
                    Console.WriteLine("Fail to decode char: " + charCode.ToString("X4") + ", at string: " + stringIndex);
                }
            }

            return stringBuilder.ToString();
        }

        public static List<short> GetRawString(string text, EncodingTable encodingTable)
        {
			text = text.Replace(NewPageKeyword, "\f");
            text = text.Replace(Environment.NewLine, "\n");

			var rawString = new List<short>();
			var formatProvider = CultureInfo.CurrentCulture;
			for (int i = 0, size = text.Length; i < size; ++i)
            {
                if (TryGetHexCodeValue(text, i, out var codeValue))
                {
					rawString.Add(codeValue);

					i += 5;
					continue;
				}
				else
				{
					var character = text[i];
					if (encodingTable.TryGetCode(character, out var charCode))
					{
						rawString.Add(charCode);
					}
					else
					{
						Console.WriteLine("Fail to encode char: " + character);
					}
				}
            }
	        
            return rawString;
        }

		public static bool TryGetHexCodeValue(string text, int i, out short codeValue)
		{
			if (text[i] == '\\' && (i + 5) < text.Length && text[i + 1] == 'x')
			{
				var codeString = string.Concat(text[i + 2], text[i + 3], text[i + 4], text[i + 5]);
				if (short.TryParse(codeString, NumberStyles.HexNumber, CultureInfo.CurrentCulture, out codeValue))
				{
					return true;
				}
			}

			codeValue = -1;
			return false;
		}

        #endregion
    }
}
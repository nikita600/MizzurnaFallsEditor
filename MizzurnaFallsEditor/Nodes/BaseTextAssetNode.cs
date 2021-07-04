using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;

namespace MizzurnaFallsEditor.Nodes
{
    public class BaseTextAssetNode<T, U> : AssetNode<T, U> where T : BaseTextAsset where U : BaseTextAsset
    {
        #region Fields

        private const string CafeMdtNodeName = "0169_06.MDT";
        private const string CafeMddNodeName = "0169_06.MDD";
	    
        private EncodingTable _cafeTable = null;
        private EncodingTable _defaultTable = null;

        public event Action Changed;
        
        #endregion

        protected BaseTextAssetNode(T asset, U sourceAsset, string extension) : base(asset, sourceAsset, extension)
        {
            AddContextAction("Import from TXT", OnImportFromTxt);
            AddContextAction("Export to TXT", OnExportToTxt);
            AddContextAction("Import (Gemini Text Format)", OnImportGeminiTextFormatClick);
        }

        #region Private
        
        private void OnImportGeminiTextFormatClick()
        {
	        LoadTables("..\\Resources\\ShiftJis.tbl", "..\\Resources\\Cafe.tbl");
	        
	        var encodingTable = Text.Equals(CafeMdtNodeName) || Text.Equals(CafeMddNodeName) ? _cafeTable : _defaultTable;
	        
	        using (var openFileDialog = new OpenFileDialog())
	        {
		        openFileDialog.InitialDirectory = Application.StartupPath;
		        openFileDialog.Filter = "txt files (*.txt)|*.txt";
		        openFileDialog.RestoreDirectory = true;
		        openFileDialog.FileName = Asset.Name;

		        if (openFileDialog.ShowDialog() != DialogResult.OK)
		        {
			        return;
		        }
		        
		        var fileText = File.ReadAllText(openFileDialog.FileName);
		        var stringEntries = TextParser.Parse(fileText);

		        for (var i = 0; i < Asset.StringsCount && i < stringEntries.Count; ++i)
		        {
			        var stringEntry = stringEntries[i];
					var rawString = BaseTextAsset.GetRawString(stringEntry, encodingTable);

					Asset.SetRawString(i, rawString);
		        }
	        }
	        
	        Changed?.Invoke();
        }

        private void OnImportFromTxt()
        {
	        using (var openFileDialog = new OpenFileDialog())
	        {
		        openFileDialog.InitialDirectory = Application.StartupPath;
		        openFileDialog.Filter = "txt files (*.txt)|*.txt";
		        openFileDialog.RestoreDirectory = true;

		        if (openFileDialog.ShowDialog() != DialogResult.OK)
		        {
			        return;
		        }
		        
		        var tokenBuilder = new StringBuilder();
		        var stringBuilder = new StringBuilder();
		        
		        var textData = File.ReadAllText(openFileDialog.FileName);
		        var textEntries = new List<string>();

		        var charIndex = 0;
		        var readString = false;
		        
		        while (charIndex < textData.Length)
		        {
			        var character = textData[charIndex];
			        charIndex++;
			        
			        if (character == '[')
			        {
				        // Read Token
				        while (charIndex < textData.Length)
				        {
					        character = textData[charIndex];
					        charIndex++;

					        if (character == ']')
					        {
						        charIndex += Environment.NewLine.Length;
						        break;
					        }
					        
					        tokenBuilder.Append(character);
				        }

				        var token = tokenBuilder.ToString();
				        tokenBuilder.Remove(0, tokenBuilder.Length);

				        if (token.StartsWith("START_ENTRY"))
				        {
					        readString = true;
				        }

				        if (token.StartsWith("END_ENTRY"))
				        {
					        var size = stringBuilder.Length;
					        if (size > 2)
					        {
						        stringBuilder.Remove(stringBuilder.Length - 2, 2);
					        }

					        var text = stringBuilder.ToString();
					        textEntries.Add(text);

					        stringBuilder.Remove(0, stringBuilder.Length);
					        
					        readString = false;
					        
					        charIndex += Environment.NewLine.Length;
				        }
			        }
			        else if (readString)
			        {
				        stringBuilder.Append(character);
			        }
		        }

		        LoadTables("..\\Resources\\ShiftJis.tbl", "..\\Resources\\Cafe.tbl");

		        if (textEntries.Count != Asset.StringsCount)
		        {
			        throw new Exception("Text files contains " + textEntries.Count + " entries, expected: " + Asset.StringsCount);
		        }
		        
		        var encodingTable = Text.Equals(CafeMdtNodeName) || Text.Equals(CafeMddNodeName) ? _cafeTable : _defaultTable;
		        for (var i = 0; i < Asset.StringsCount; ++i)
		        {
			        var stringEntry = textEntries[i];
		            var rawString = BaseTextAsset.GetRawString(stringEntry, encodingTable);

					Asset.SetRawString(i, rawString);
		        }
	        }
	        
	        Changed?.Invoke();
        }

		private bool _isInited = false;

        private void OnExportToTxt()
        {
	        using (var saveFileDialog = new SaveFileDialog())
	        {
				if (!_isInited)
				{
					saveFileDialog.InitialDirectory = Application.StartupPath;
					_isInited = true;
				}

				saveFileDialog.FileName = Asset.Name;
		        saveFileDialog.Filter = "txt files (*.txt)|*.txt";
		        saveFileDialog.RestoreDirectory = true;

		        if (saveFileDialog.ShowDialog() != DialogResult.OK)
		        {
			        return;
		        }
		        
		        LoadTables("..\\Resources\\ShiftJis.tbl", "..\\Resources\\Cafe.tbl");
	        
		        var encodingTable = Text.Equals(CafeMdtNodeName) || Text.Equals(CafeMddNodeName) ? _cafeTable : _defaultTable;

		        var stringBuilder = new StringBuilder();

	        
		        for (var i = 0; i < Asset.StringsCount; ++i)
		        {
			        var text = Asset.GetString(i, encodingTable);

			        var entryIndex = i.ToString("D4");
			        
			        stringBuilder.AppendLine("[START_ENTRY: " + entryIndex + "]");
			        stringBuilder.AppendLine(text);
			        stringBuilder.AppendLine("[END_ENTRY: " + entryIndex + "]").AppendLine();
		        }
	        
		        File.WriteAllText(saveFileDialog.FileName, stringBuilder.ToString());
	        }
        }
        
        private void LoadTables(string defaultTablePath, string cafeTablePath)
        {
	        if (!File.Exists(defaultTablePath) || !File.Exists(cafeTablePath))
	        {
		        throw new Exception("Character tables ShiftJis.tbl or Cafe.tbl not found");
	        }
	        
	        _cafeTable = new EncodingTable(File.ReadAllBytes(cafeTablePath));
	        _defaultTable = new EncodingTable(File.ReadAllBytes(defaultTablePath));
        }
        
        #endregion

        #region Nested

        private static class TextParser
        {
	        private static readonly Dictionary<string, string> ReplacementStrings = new Dictionary<string, string>()
	        {
		        { "<New>", "\\xFF70" },
		        { "<Unk70>", "\\xFF70" }
	        };
	        
	        public static List<string> Parse(string text)
	        {
		        var expectedStringsCount = 0;
		        var strings = new List<string>();

		        using (var stringReader = new StringReader(text))
		        {
			        expectedStringsCount = ParseTextEntriesCount(stringReader.ReadLine());
			        
			        var textEntries = ParseTextEntries(stringReader.ReadToEnd());
			        foreach (var textString in textEntries)
			        {
				        var modifiedString = textString;
				        foreach (var replacementString in ReplacementStrings)
				        {
					        modifiedString = modifiedString.Replace(replacementString.Key, replacementString.Value);
				        }
				        
				        if (modifiedString.Contains("<") || modifiedString.Contains(">"))
				        {
					        Console.WriteLine(textString);
				        }

				        modifiedString = FormatString(modifiedString, 20);
				        
				        strings.Add(modifiedString);
			        }
		        }

		        if (expectedStringsCount != strings.Count)
		        {
			        Console.WriteLine("Expected string entries: " + expectedStringsCount + "\n" + "Actual string count: " + strings.Count);
		        }
		        
		        return strings;
	        }

	        private static int ParseTextEntriesCount(string headerText)
	        {
		        if (!string.IsNullOrEmpty(headerText))
		        {
			        return int.Parse(headerText.
				        Replace("<", string.Empty).
				        Replace(" text entries>", string.Empty));
		        }

		        return 0;
	        }

	        private static List<string> ParseTextEntries(string text)
	        {
		        var textEntries = new List<string>(text.Split(new[]{"<End>\r\n"}, StringSplitOptions.None));
		        if (textEntries.Count > 0 && string.IsNullOrEmpty(textEntries[textEntries.Count - 1]))
		        {
			        textEntries.RemoveAt(textEntries.Count - 1);
		        }

		        return textEntries;
	        }
	        
	        private static string FormatString(string textString, int maxCharsPerLine)
	        {
		        var words = textString.
			        Replace("\r\n", " ").
			        Replace("  ", " ").
			        Split(' ');
			        
		        var formattedString = new StringBuilder();

		        var charsCount = 0;
		        for (var i = 0; i < words.Length; ++i)
		        {
			        var word = words[i];
			        if (word.Length > maxCharsPerLine && !word.Contains("\\x"))
			        {
				        var j = 0;
				        var wordBuilder = new StringBuilder();
				        foreach (var w in word)
				        {
					        if (j > maxCharsPerLine)
					        {
						        wordBuilder.AppendLine();
					        }

					        wordBuilder.Append(w);
					        j++;
				        }

				        word = wordBuilder.ToString();
			        }
			        
			        if (charsCount + word.Length > maxCharsPerLine)
			        {
				        charsCount = 0;
				        formattedString.AppendLine();
			        }
			        else if (i != 0)
			        {
				        formattedString.Append(" ");
				        charsCount += 1;
			        }
			        
			        formattedString.Append(word);
			        if (word.StartsWith("\\x"))
			        {
				        charsCount += 1;
			        }
			        else
			        {
				        charsCount += word.Length;
			        }
		        }

		        return formattedString.ToString();
	        }
        }

        private static class GeminiTextFormatParser
		{
			private const char Start = '<';
			private const char End = '>';
			private const char CarriageReturn = '\r'; // Carriage Return
			public static readonly char LineFeed = '\n'; // Line Feed

			public static List<string> Parse(string text)
			{
				var result = new List<string>();

				var index = 0;
				var textString = new StringBuilder();

				while (index < text.Length)
				{
					var currentChar = PeekChar(text, index);

					if (currentChar != Start)
					{
						if (currentChar != CarriageReturn)
						{
							textString.Append(currentChar);
						}

						index++;
					}
					else
					{
						var token = FindToken(text, ref index);
						if (token.Contains("<End>"))
						{
							token = token.Replace("<End>", string.Empty);
							token = token.Replace("<Unk70>", "\\xFF70");

							if (!string.IsNullOrEmpty(token))
							{
								Console.WriteLine(token);
							}

							textString.Append(token);

							var entry = textString.ToString();
							result.Add(entry);

							textString.Remove(0, textString.Length);

							index += 2;
						}
						else if (token.Equals("<New>"))
						{
							textString.Append("\\xFF70");
						}
						else if (!string.IsNullOrEmpty(token))
						{
							Console.WriteLine("Unknown token: " + token);
						}
					}
				}

				return result;
			}

			private static string FindToken(string text, ref int currentIndex)
			{
				var tokenBuffer = new StringBuilder();
				for (var i = currentIndex; i < text.Length; ++i)
				{
					var nextChar = PeekChar(text, i);

					tokenBuffer.Append(nextChar);

					if (nextChar != End)
					{
						continue;
					}
					
					currentIndex += (i - currentIndex) + 1;
					return tokenBuffer.ToString();
				}

				return string.Empty;
			}

			private static char PeekChar(string text, int index)
			{
				return index < text.Length ? text[index] : char.MinValue;
			}
		}

        #endregion
    }
}
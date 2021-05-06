﻿using System;
using System.Collections.Generic;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.OutlineAssets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.ViewControls
{
    public partial class MdtTextEditor : UserControl
    {
		#region Constants

		const short SpaceCode = unchecked((short)0xA000);
		const short NewLine = unchecked((short)0xFF6E);
		const short NewPage = unchecked((short)0xFF70);

		#endregion

		#region Fields

		private int _selectedIndex = -1;
		
		private BaseTextAsset _mdtAsset = null;
		private BaseTextAsset _srcMdtAsset = null;
		private EncodingTable _encodingTable = null;
		private EncodingTable _pixelFontTable = null;
		private EncodingTable _sourceEncodingTable = null;
		
		#endregion

		#region Public

		public MdtTextEditor()
		{
			InitializeComponent();
		}
		
		public void Setup(CdArchive cdArchive)
		{
			_textViewer.Setup(cdArchive);
		}

        public void SetTextAsset(BaseTextAsset mdtAsset, BaseTextAsset srcMdtAsset, EncodingTable encodingTable, EncodingTable pixelFontTable, EncodingTable sourceEncodingTable)
        {
	        _mdtAsset = mdtAsset;
	        _srcMdtAsset = srcMdtAsset;

	        _encodingTable = encodingTable;
	        _pixelFontTable = pixelFontTable;
	        _sourceEncodingTable = sourceEncodingTable;

			UpdateTextEditor(-1);
        }

        #endregion

        #region Private

		private void UpdateTextEditor(int selectedIndex)
		{
			_selectedIndex = selectedIndex;
			_stringsListView.Items.Clear();
			_stringTextBox.Text = string.Empty;
			_textInfoLabel.Text = string.Empty;

			if (_mdtAsset == null)
			{
				return;
			}

			var stringsCount = _mdtAsset.StringsCount;
			for (var i = 0; i < stringsCount; ++i)
			{
				var previewString = GetPreviewString(i, _mdtAsset[i]);
				_stringsListView.Items.Add(previewString);
			}
			_stringsListView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);

			var fileSize = _mdtAsset.Serialize().Length;
			var sourceFileSize = _srcMdtAsset.Serialize().Length;

			_textInfoLabel.Text =
				$@"Asset: {_mdtAsset.Name}, " +
				$@"Strings Count: {stringsCount}, " +
				$@"Current Size: {fileSize}, Source Size: {sourceFileSize}";
		}

        private string GetPreviewString(int index, List<short> rawString)
        {
	        var textString = BaseTextAsset.GetString(rawString, _encodingTable, index);
	        textString = textString.Replace("\n", "\\n ");

	        return string.Concat(index.ToString("D3"), " | ", textString);
        }
        
		private void UpdateCurrentPreviewString()
		{
			var rawText = _mdtAsset[_selectedIndex];

			_stringsListView.Items[_selectedIndex].Text = GetPreviewString(_selectedIndex, rawText);
			_stringsListView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);

			var text = BaseTextAsset.GetString(rawText, _encodingTable, _selectedIndex);
			_textViewer.SetText(text, _encodingTable);
		}

        private bool IsValid()
        {
	        return _mdtAsset != null && _selectedIndex >= 0 && _selectedIndex < _mdtAsset.StringsCount;
        }

        #endregion
        
		#region Events

		private void OnStringsListView_ItemSelectionChanged(object sender, ListViewItemSelectionChangedEventArgs e)
		{
			_selectedIndex = e.ItemIndex;
			
			if (IsValid())
			{
				var rawString = _mdtAsset[_selectedIndex];
				var textString = BaseTextAsset.GetString(rawString, _encodingTable, _selectedIndex);

				Console.WriteLine("Width: " + _textViewer.FontAsset.GetWidth(rawString));

				var srcString = _srcMdtAsset[_selectedIndex];
				var srcTextString = BaseTextAsset.GetString(srcString, _sourceEncodingTable, _selectedIndex);
				
				_stringTextBox.Text = textString;
				_sourceTextBox.Text = srcTextString;
				
				_textViewer.SetText(textString, _encodingTable);
			}
			else
			{
				_stringTextBox.Text = string.Empty;
			}
		}

		private void OnStringTextBox_TextChanged(object sender, EventArgs e)
		{
			if (!IsValid())
			{
				return;
			}

			var rawText = _mdtAsset[_selectedIndex];
			var rawString = BaseTextAsset.GetRawString(_stringTextBox.Text, _encodingTable);
			rawText.Clear();
			rawText.AddRange(rawString);

			UpdateCurrentPreviewString();
		}
		
		private void ConvertToPixelFont_Click(object sender, EventArgs e)
		{
			if (_pixelFontTable == null)
			{
				return;
			}

			for (int i = 0, stringsCount = _mdtAsset.StringsCount; i < stringsCount; ++i)
			{
				var rawString = new List<short>();
				var textString = BaseTextAsset.GetString(_mdtAsset[i], _encodingTable, i);

				for (var j = 0; j < textString.Length; ++j)
				{
					if (BaseTextAsset.TryGetHexCodeValue(textString, j, out var codeValue))
					{
						rawString.Add(codeValue);

						j += 5;
						continue;
					}

					var character = textString[j];
					if (_pixelFontTable.TryGetCode(character, out var code))
					{
						rawString.Add(code);
					}
					else
					{
						throw new Exception("Fail to convert pixelFont table data");
					}
				}

				_mdtAsset[i].Clear();
				_mdtAsset[i].AddRange(rawString);
			}
		}

		private void _formatAllTextButton_Click(object sender, EventArgs e)
		{
			var maxWidth = 240;
			var fontAsset = _textViewer.FontAsset;
			var spaceEntry = fontAsset.GetCharacterEntry(SpaceCode);

			var stringsCount = _mdtAsset.StringsCount;
			for (var i = 0; i < stringsCount; ++i)
			{
				FormatTextEntry(_mdtAsset[i], maxWidth, fontAsset, spaceEntry);
			}

			UpdateTextEditor(_selectedIndex);
		}

		private void FormatTextEntry(List<short> rawString, int maxWidth, MfoAsset fontAsset, MfoCharacterEntry spaceEntry)
		{
			var currentWidth = 0;
			var formattedString = new List<short>();
			var words = SplitStringToWords(rawString);
			for (var w = 0; w < words.Count; ++w)
			{
				var word = words[w];
				var wordWidth = fontAsset.GetWidth(word);

				if (currentWidth + wordWidth < maxWidth)
				{
					formattedString.AddRange(word);
					currentWidth += wordWidth;

					formattedString.Add(SpaceCode);
					currentWidth += spaceEntry.Width;
				}
				else
				{
					if (formattedString.Count > 1 &&
						formattedString[formattedString.Count - 1] == SpaceCode)
					{
						formattedString.RemoveAt(formattedString.Count - 1);
					}

					formattedString.Add(NewLine);

					currentWidth = 0;
					formattedString.AddRange(word);
					currentWidth += wordWidth;

					formattedString.Add(SpaceCode);
					currentWidth += spaceEntry.Width;
				}
			}

			if (formattedString.Count > 1 && formattedString[formattedString.Count - 1] == SpaceCode)
			{
				formattedString.RemoveAt(formattedString.Count - 1);
			}

			rawString.Clear();
			rawString.AddRange(formattedString);
		}

		private List<List<short>> SplitStringToWords(List<short> rawString)
		{
			var words = new List<List<short>>();

			var word = new List<short>();
			words.Add(word);

			foreach (var character in rawString)
			{
				if (character == SpaceCode ||
					character == NewLine ||
					character == NewPage)
				{
					word = new List<short>();
					words.Add(word);
					continue;
				}

				word.Add(character);
			}
			
			for (var i = 0; i < words.Count; ++i)
			{
				if (words[i].Count == 0)
				{
					words.RemoveAt(i);
					--i;
				}
			}

			return words;
		}

		private void _formatCurrentEntryButton_Click(object sender, EventArgs e)
		{
			var maxWidth = 240;
			var fontAsset = _textViewer.FontAsset;
			var spaceEntry = fontAsset.GetCharacterEntry(SpaceCode);
			var rawString = _mdtAsset[_selectedIndex];

			FormatTextEntry(rawString, maxWidth, fontAsset, spaceEntry);

			UpdateCurrentPreviewString();
		}

		#endregion

		#region Debug

		private static void HuffmanTest(List<List<short>> srcStrings, byte[] compressedData)
		{
			var dstStrings = HuffmanUtility.Decompress(compressedData);

			if (srcStrings.Count != dstStrings.Count)
			{
				Console.WriteLine("Fail to decompress");
				return;
			}

			for (var i = 0; i < srcStrings.Count; ++i)
			{
				var srcStr = srcStrings[i];
				var dstStr = dstStrings[i];

				if (srcStr.Count != dstStr.Count)
				{
					Console.WriteLine("Fail to decompress strings");
					return;
				}

				for (var j = 0; j < srcStr.Count; ++j)
				{
					var srcChar = srcStr[j];
					var dstChar = dstStr[j];

					if (srcChar != dstChar)
					{
						Console.WriteLine("Fail to check");
						return;
					}
				}
			}
			
			Console.WriteLine("Decompress success");
		}

		#endregion
	}
}

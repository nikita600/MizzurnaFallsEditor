using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.OutlineAssets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.ViewControls
{
	public partial class TextViewer : UserControl
	{
		#region Fields

		private readonly List<MfoAsset> _fontAssets = new List<MfoAsset>();
		private readonly List<ViewPresetData> _viewPresets = new List<ViewPresetData>()
		{
			new ViewPresetData("Dialogue", 0xF0, 0x30),
			new ViewPresetData("Notebook", 0x100, 0x50, true, 0xF0, 0x50),
			new ViewPresetData("Phone Number", 0x100, 0x10, true, 0xF0, 0x10),
			new ViewPresetData("Inventory", 0x140, 0x50),
		};

		private string _text = string.Empty;
		private EncodingTable _encodingTable = null;

		#endregion

		#region Properties

		public MfoAsset FontAsset => _fontAssets[_fontComboBox.SelectedIndex];

		private MfoPaletteEntry PaletteEntry => FontAsset.PaletteEntries[(int)_paletteIndexBox.Value];

		private ViewPresetData ViewPreset => _viewPresets[_viewPresetComboBox.SelectedIndex];

		#endregion

		#region Public

		public TextViewer()
		{
			InitializeComponent();

			_viewPresetComboBox.Items.Clear();
			foreach (var viewPreset in _viewPresets)
			{
				_viewPresetComboBox.Items.Add(viewPreset.Name);
			}
			_viewPresetComboBox.SelectedIndex = 0;
		}

		public void Setup(CdArchive cdArchive)
		{
			_fontAssets.Clear();
			_fontComboBox.Items.Clear();

			if (cdArchive == null)
			{
				return;
			}

			var fontAssets = cdArchive.GetAllAssets<MfoAsset>();
			_fontAssets.AddRange(fontAssets);

			foreach (var fontAsset in _fontAssets)
			{
				_fontComboBox.Items.Add(fontAsset.Name);
			}

			_fontComboBox.SelectedIndex = _fontAssets.Count > 0 ? 0 : -1;

			_paletteIndexBox.Value = 0;
			_paletteIndexBox.Minimum = 0;
			_paletteIndexBox.Maximum = FontAsset.PaletteEntries.Count - 1;
		}

		public void SetText(string text, EncodingTable encodingTable)
		{
			_text = text;
			_encodingTable = encodingTable;

			UpdatePreview();
		}

		#endregion

		#region Private

		private void UpdatePreview()
		{
			var previewSize = new Size(0, 0);
			Image previewImage = null;

			if (!string.IsNullOrEmpty(_text))
			{
				var charCodes = BaseTextAsset.GetRawString(_text, _encodingTable);
				var characters = FontAsset.GetCharacterEntries(charCodes);

				var viewPreset = ViewPreset;
				previewImage = PngUtility.CreateTextPreview(characters, PaletteEntry, viewPreset.Width, viewPreset.Height);
			}

			if (previewImage != null)
			{
				previewSize.Width = previewImage.Width;
				previewSize.Height = previewImage.Height;
			}

			_textPreviewPixtureBox.Size = previewSize;
			_textPreviewPixtureBox.Image = previewImage;
		}

		#endregion

		#region Handlers

		private void _viewPresetComboBox_SelectedIndexChanged(object sender, EventArgs e)
		{
			UpdatePreview();
		}

		private void _fontComboBox_SelectedIndexChanged(object sender, EventArgs e)
		{
			UpdatePreview();
		}

		private void _paletteIndexBox_ValueChanged(object sender, EventArgs e)
		{
			UpdatePreview();
		}

		#endregion

		#region Nested

		private class ViewPresetData
		{
			public readonly string Name;
			public readonly int Width;
			public readonly int Height;

			public readonly bool DrawBounds;
			public readonly int BoundsWidth;
			public readonly int BoundsHeight;

			public ViewPresetData(string name, int width, int height, bool drawBounds = false, int boundsWidth = 0, int boundsHeight = 0)
			{
				Name = name;
				Width = width;
				Height = height;

				DrawBounds = drawBounds;
				BoundsWidth = boundsWidth;
				BoundsHeight = boundsHeight;
			}
		}

		#endregion

		private void _textPreviewPixtureBox_Paint(object sender, PaintEventArgs e)
		{
			var viewPreset = ViewPreset;
			if (!viewPreset.DrawBounds)
			{
				return;
			}

			var pen = new Pen(Color.Green, 1);

			e.Graphics.DrawRectangle(pen, new Rectangle(0, 0, viewPreset.BoundsWidth, viewPreset.BoundsHeight));
		}
	}
}

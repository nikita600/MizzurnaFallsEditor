using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.ImageAssets;
using MizzurnaFallsEditor.Assets.OutlineAssets;
using MizzurnaFallsEditor.Nodes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.ViewControls
{
    public partial class MfoEditor : UserControl
    {
		#region Fields

		private MfoAsset _mfoAsset = null;
		private MfoCharacterEntry _mfoCharacterEntry = null;

		private EncodingTable _encodingTable = null;

		#endregion

		#region Properties

		private MfoPaletteEntry CurrentPalette => _mfoAsset.PaletteEntries[(int)_paletteIndexValueBox.Value];
		private MfoCharacterEntry CurrentCharacter => _mfoAsset.CharacterEntries[_characterEntryBox.SelectedIndex];

		#endregion

		#region Public

		public MfoEditor()
        {
            InitializeComponent();

			_zoomValueBox.Value = 4;
			_characterImageBox.BackColor = System.Drawing.Color.Magenta;
        }

		public void Show(MfoAssetNode mfoAssetNode, EncodingTable mainEncoding, EncodingTable cafeEncoding)
		{
			Show();
			UpdateAsset(mfoAssetNode.Asset);
		}

		#endregion

		#region Private
		
		private void UpdateAsset(MfoAsset mfoAsset)
		{
			Clear();

			if (mfoAsset == null)
			{
				return;
			}

			_mfoAsset = mfoAsset;

			_defaultWidthBox.Value = _mfoAsset.DefaultCharacterWidth;
			_defaultHeightBox.Value = _mfoAsset.DefaultCharacterHeight;
			_defaultWidthOffsetBox.Value = _mfoAsset.XOffsetPerCharacter;
			_defaultHeightOffsetBox.Value = _mfoAsset.YOffsetPerCharacter;

			var characterEntries = _mfoAsset.CharacterEntries;
			foreach (var entry in characterEntries)
			{
				_characterEntryBox.Items.Add(entry.Code.ToString("X4"));
			}

			_characterEntryBox.SelectedIndex = 0;


			var paletteEntries = _mfoAsset.PaletteEntries;
			_paletteIndexValueBox.Value = 0;
			_paletteIndexValueBox.Minimum = 0;
			_paletteIndexValueBox.Maximum = paletteEntries.Count - 1;
		}

		private void Clear()
		{
			_mfoAsset = null;

			_defaultWidthBox.Value = 0;
			_defaultHeightBox.Value = 0;
			_defaultWidthOffsetBox.Value = 0;
			_defaultHeightOffsetBox.Value = 0;

			_characterEntryBox.Items.Clear();
		}

		private void UpdateImageBoxSize()
		{
			var size = new Size(0, 0);
			if (_mfoCharacterEntry != null)
			{
				var zoom = _zoomValueBox.Value;
			
				size.Width = _mfoCharacterEntry.Width * (int)zoom;
				size.Height = _mfoCharacterEntry.Height * (int)zoom;
			}

			_characterImageBox.Size = size;
			_characterImageBox.Refresh();
		}

		private void UpdatePreview()
		{
			_characterImageBox.Image = null;
			UpdateImageBoxSize();
			
			_mfoCharacterEntry = CurrentCharacter;

			UpdateCharacterSettings();

			_characterImageBox.Image = PngUtility.CreateCharacterPreview(_mfoCharacterEntry, CurrentPalette);
			UpdateImageBoxSize();
		}

		private void UpdateCharacterSettings()
		{
			if (_mfoCharacterEntry != null)
			{
				_characterWidthBox.Value = _mfoCharacterEntry.Width;
				_characterHeightBox.Value = _mfoCharacterEntry.Height;
				_characterXOffsetBox.Value = _mfoCharacterEntry.ClutOffsetY;
				_characterBppModeBox.Value = _mfoCharacterEntry.BitsPerPixelMode;
			}
			else
			{
				_characterWidthBox.Value = 0;
				_characterHeightBox.Value = 0;
				_characterXOffsetBox.Value = 0;
				_characterBppModeBox.Value = 0;
			}
		}

		#endregion

		#region Handlers

		private void _zoomValueBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateImageBoxSize();
		}

		private void _paletteIndexValueBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdatePreview();
		}

		private void _characterEntryBox_SelectedIndexChanged(object sender, EventArgs e)
		{
			UpdatePreview();
		}

		private void _loadButton_Click(object sender, EventArgs e)
		{
			if (_loadTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var timBytes = File.ReadAllBytes(_loadTextureDialog.FileName);
				var timAsset = new TimAsset();
				timAsset.Deserialize(timBytes);

				if (timAsset.PixelWidth > 255 || timAsset.PixelHeight > 255 || timAsset.FlagData.BppMode != TimBppMode.Bpp4)
				{
					throw new ArgumentException("Wrong TIM file. TIM file should be 4BPP, Max Width: 255, Max Height 255");
				}
				
				CurrentCharacter.SetTimPixelData(timAsset);

				UpdatePreview();
			}
		}

		private void _saveButton_Click(object sender, EventArgs e)
		{
			if (_mfoCharacterEntry == null)
			{
				return;
			}

			_saveTextureDialog.FileName = _mfoCharacterEntry.Code.ToString("X4");
			if (_saveTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var palette = CurrentPalette;
				var character = CurrentCharacter;
				var pixels = character.GetTimPixelData();
				
				var timAsset = TimAsset.Create(TimBppMode.Bpp4, palette.PaletteEntries, character.Width, character.Height, pixels);
				var bytes = timAsset.Serialize();
				File.WriteAllBytes(_saveTextureDialog.FileName, bytes);
			}
		}

		private void _addEntryButton_Click(object sender, EventArgs e)
		{
			if (_loadTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var timBytes = File.ReadAllBytes(_loadTextureDialog.FileName);
				var timAsset = new TimAsset();
				timAsset.Deserialize(timBytes);

				if (timAsset.PixelWidth > 255 || timAsset.PixelHeight > 255 || timAsset.FlagData.BppMode != TimBppMode.Bpp4)
				{
					throw new ArgumentException("Wrong TIM file. TIM file should be 4BPP, Max Width: 255, Max Height 255");
				}

				_mfoAsset.AddCharacterEntry(timAsset);
				UpdateAsset(_mfoAsset);
			}
		}

		private void _deleteButton_Click(object sender, EventArgs e)
		{
			_mfoAsset.DeleteCharacterEntry(_characterEntryBox.SelectedIndex);
			UpdateAsset(_mfoAsset);
		}

		private void _loadPaletteFromTimFileButton_Click(object sender, EventArgs e)
		{
			if (_loadTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var timBytes = File.ReadAllBytes(_loadTextureDialog.FileName);
				var timAsset = new TimAsset();
				timAsset.Deserialize(timBytes);

				var palette = new ushort[16];
				var clutData = timAsset.ClutData;
				for (int i = 0; i < 16; ++i)
				{
					palette[i] = clutData.ClutEntries[i];
				}
				CurrentPalette.SetData(palette);
				
				UpdatePreview();
			}
		}

		private void _defaultWidthBox_ValueChanged(object sender, EventArgs e)
		{
			if (_mfoAsset != null)
			{
				_mfoAsset.DefaultCharacterWidth = (byte)_defaultWidthBox.Value;
			}
		}

		private void _defaultHeightBox_ValueChanged(object sender, EventArgs e)
		{
			if (_mfoAsset != null)
			{
				_mfoAsset.DefaultCharacterHeight = (byte)_defaultHeightBox.Value;
			}
		}

		private void _defaultWidthOffsetBox_ValueChanged(object sender, EventArgs e)
		{
			if (_mfoAsset != null)
			{
				_mfoAsset.XOffsetPerCharacter = (byte)_defaultWidthOffsetBox.Value;
			}
		}

		private void _defaultHeightOffsetBox_ValueChanged(object sender, EventArgs e)
		{
			if (_mfoAsset != null)
			{
				_mfoAsset.YOffsetPerCharacter = (byte)_defaultHeightOffsetBox.Value;
			}
		}
		
		#endregion
	}
}
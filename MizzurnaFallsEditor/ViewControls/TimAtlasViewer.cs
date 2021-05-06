using System.Drawing;
using System.IO;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.ImageAssets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.ViewControls
{
	public partial class TimAtlasViewer : UserControl
	{
		#region Fields

		private TimAtlasAsset _timAtlasAsset;

		#endregion

		#region Methods

		public TimAtlasViewer()
		{
			InitializeComponent();
		}

		public void SetTimAtlas(TimAtlasAsset timAtlasAsset)
		{
			_timAtlasAsset = null;
			_imageBox.Image = null;
			Show();

			if (timAtlasAsset == null)
			{
				return;
			}

			_timAtlasAsset = timAtlasAsset;

			var entries = TimAtlasEntries.GetEntries(timAtlasAsset.Name);
			var timEntriesItems = _timEntriesComboBox.Items;
			timEntriesItems.Clear();
			for (int i = 0, size = entries.Length; i < size; ++i)
			{
				timEntriesItems.Add(entries[i].Name);
			}
			
			_timEntriesComboBox.SelectedIndex = 0;

			UpdateImage();
		}

		private void UpdateImage()
		{
			var timAsset = _timAtlasAsset.GetSubTimAsset(_timEntriesComboBox.SelectedIndex);

			_imageBox.Image = timAsset != null ? PngUtility.CreateImage(timAsset, 0, 0, _transparentCheckbox.Checked) : null;
			UpdateImageBoxSize(timAsset);
		}

		private void UpdateImageBoxSize(TimAsset timAsset)
		{
			var size = new Size();

			if (timAsset != null)
			{
				var width = timAsset.PixelWidth;
				var height = timAsset.PixelHeight;
				
				var scale = (int)_zoomNumericBox.Value;
				size.Width = width * scale;
				size.Height = height * scale;
			}

			_imageBox.Size = size;
		}

		private string GetTimFileName(int index)
		{
			return string.Concat(_timAtlasAsset.Name, "_", index.ToString("D4"));
		}

		#endregion

		#region Event Handlers

		private void _timEntriesComboBox_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _transparentCheckbox_CheckedChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _zoomNumericBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _loadButton_Click(object sender, System.EventArgs e)
		{
			var index = _timEntriesComboBox.SelectedIndex;

			_loadTextureDialog.FileName = GetTimFileName(index);
			if (_loadTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var timBytes = File.ReadAllBytes(_loadTextureDialog.FileName);
				var timAsset = new TimAsset();
				timAsset.Deserialize(timBytes);

				_timAtlasAsset.SetSubTimAsset(index, timAsset);

				UpdateImage();
			}
		}

		private void _saveButton_Click(object sender, System.EventArgs e)
		{
			var index = _timEntriesComboBox.SelectedIndex;

			_saveTextureDialog.FileName = GetTimFileName(index);
			if (_saveTextureDialog.ShowDialog() == DialogResult.OK)
			{
				var timAsset = _timAtlasAsset.GetSubTimAsset(index);
				var timBytes = timAsset.Serialize();

				File.WriteAllBytes(_saveTextureDialog.FileName, timBytes);
			}
		}

		private void _loadAllFromFolderButton_Click(object sender, System.EventArgs e)
		{
			if (_loadAllFromFolderDialog.ShowDialog() != DialogResult.OK)
			{
				return;
			}

			var entries = TimAtlasEntries.GetEntries(_timAtlasAsset.Name);
			for (var i = 0; i < entries.Length; ++i)
			{
				var fileName = GetTimFileName(i);
				var path = Path.Combine(_loadAllFromFolderDialog.SelectedPath, fileName) + ".TIM";
				if (!File.Exists(path))
				{
					continue;
				}

				var timBytes = File.ReadAllBytes(path);
				var timAsset = new TimAsset();
				timAsset.Deserialize(timBytes);

				_timAtlasAsset.SetSubTimAsset(i, timAsset);
			}

			UpdateImage();
		}

		private void _saveAllToFolderButton_Click(object sender, System.EventArgs e)
		{
			if (_saveAllToFolderDialog.ShowDialog() != DialogResult.OK)
			{
				return;
			}

			var entries = TimAtlasEntries.GetEntries(_timAtlasAsset.Name);
			for (var i = 0; i < entries.Length; ++i)
			{
				var fileName = GetTimFileName(i);
				var path = Path.Combine(_saveAllToFolderDialog.SelectedPath, fileName) + ".TIM";

				var timAsset = _timAtlasAsset.GetSubTimAsset(i);
				var timBytes = timAsset.Serialize();

				File.WriteAllBytes(path, timBytes);
			}
		}

		#endregion
	}
}

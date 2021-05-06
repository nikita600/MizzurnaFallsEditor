using System.Drawing;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.ImageAssets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.ViewControls
{
	public partial class TimViewer : UserControl
	{
		#region Fields

		private TimAsset _timAsset = null;

		#endregion

		#region Public

		public TimViewer()
		{
			InitializeComponent();
		}

		public void SetTimAsset(TimAsset timAsset)
		{
			_imageBox.Image = null;

			Show();

			if (timAsset == null)
			{
				return;
			}

			_timAsset = timAsset;

			var clutDataVram = timAsset.ClutData.VramData;

			_clutOffsetXNumericBox.ValueChanged -= _clutOffsetXNumericBox_ValueChanged;
			_clutOffsetYNumericBox.ValueChanged -= _clutOffsetYNumericBox_ValueChanged;

			_clutOffsetXNumericBox.Minimum = clutDataVram.DX;
			_clutOffsetXNumericBox.Maximum = clutDataVram.DX + clutDataVram.Width;
			_clutOffsetXNumericBox.Value = clutDataVram.DX;
			
			_clutOffsetYNumericBox.Minimum = clutDataVram.DY;
			_clutOffsetYNumericBox.Maximum = clutDataVram.DY + clutDataVram.Height;
			_clutOffsetYNumericBox.Value = clutDataVram.DY;

			_clutOffsetXNumericBox.ValueChanged += _clutOffsetXNumericBox_ValueChanged;
			_clutOffsetYNumericBox.ValueChanged += _clutOffsetYNumericBox_ValueChanged;

			UpdateImage();
		}

		#endregion

		#region Private

		private void UpdateImage()
		{
			if (_timAsset == null)
			{
				return;
			}

			var clutX = (int)_clutOffsetXNumericBox.Value;
			var clutY = (int)_clutOffsetYNumericBox.Value;
			var transparent = _transparentCheckbox.Checked;
			var force4Bpp = _force4BppModeBox.Checked;

			_imageBox.Image = _timAsset != null ? PngUtility.CreateImage(_timAsset, clutX, clutY, transparent, force4Bpp) : null;
			_paletteBox.Image = _timAsset != null ? PngUtility.CreatePalette(_timAsset) : null;

			UpdateImageBoxSize();
		}

		private void UpdateImageBoxSize()
		{
			var size = new Size();
			var paletteSize = new Size();

			if (_timAsset != null)
			{
				var width = _timAsset.PixelWidth;
				var height = _timAsset.PixelHeight;

				if (_force4BppModeBox.Checked)
				{
					width *= 2;
				}

				var scale = (int)_zoomNumericBox.Value;
				size.Width = width * scale;
				size.Height = height * scale;

				width = _timAsset.ClutData.VramData.Width;
				height = _timAsset.ClutData.VramData.Height;
				paletteSize.Width = width * scale;
				paletteSize.Height = height * scale;
			}

			_imageBox.Size = size;
			_paletteBox.Size = paletteSize;
		}

		private int GetColorCount()
		{
			var colorCount = 0;
			switch (_timAsset.FlagData.BppMode)
			{
				case TimBppMode.Bpp4:
					colorCount = 16;
					break;

				case TimBppMode.Bpp8:
					colorCount = _force4BppModeBox.Checked ? 16 : 256;
					break;
			}

			return colorCount;
		}

		private void _zoomNumericBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateImageBoxSize();
		}

		private void _clutOffsetXNumericBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _clutOffsetYNumericBox_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _transparentCheckbox_CheckedChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _force4BppModeBox_CheckedChanged(object sender, System.EventArgs e)
		{
			UpdateImage();
		}

		private void _nextPaletteButton_Click(object sender, System.EventArgs e)
		{
			if (_timAsset == null)
			{
				return;
			}
			
			var colorCount = GetColorCount();
			var value = _clutOffsetXNumericBox.Value + colorCount;
			if (_clutOffsetXNumericBox.Minimum <= value && value <= _clutOffsetXNumericBox.Maximum)
			{
				_clutOffsetXNumericBox.Value = value;
				UpdateImage();
			}
		}

		private void _prevPaletteButton_Click(object sender, System.EventArgs e)
		{
			if (_timAsset == null)
			{
				return;
			}

			var colorCount = GetColorCount();
			var value = _clutOffsetXNumericBox.Value - colorCount;
			if (_clutOffsetXNumericBox.Minimum <= value && value <= _clutOffsetXNumericBox.Maximum)
			{
				_clutOffsetXNumericBox.Value = value;
				UpdateImage();
			}
		}

		private void _paletteBox_Paint(object sender, PaintEventArgs e)
		{
			if (_timAsset == null)
			{
				return;
			}

			var xOffset = _clutOffsetXNumericBox.Value;
			var yOffset = _clutOffsetYNumericBox.Value;
			var vramData = _timAsset.ClutData.VramData;

			var x = xOffset - vramData.DX;
			var y = yOffset - vramData.DY;

			var scale = (int)_zoomNumericBox.Value;
			var colorCount = GetColorCount();

			x *= scale;
			y *= scale;
			colorCount *= scale;

			using (var linePen = new Pen(System.Drawing.Color.Lime))
			{
				e.Graphics.DrawLine(linePen, (float)x, (float)y, (float)x + colorCount, (float)y);
			}
		}

		#endregion
	}
}

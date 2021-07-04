using System.Collections.Generic;
using System.Drawing;
using System.IO;
using BigGustave;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.ImageAssets;
using MizzurnaFallsEditor.Assets.OutlineAssets;
using TimColor = MizzurnaFallsEditor.Assets.ImageAssets.TimColor;

namespace MizzurnaFallsEditor.Utilities
{
	public static class PngUtility
	{
		#region Fields

		private static readonly TimColor[] _colorBuffer = new TimColor[2];

		#endregion

		#region Public

		public static Image CreateImage(TimAsset timAsset, int clutX = 0, int clutY = 0, bool transparent = true, bool force4Bpp = false)
		{
			var width = timAsset.PixelWidth;
			var height = timAsset.PixelHeight;

			if (force4Bpp)
			{
				width *= 2;
			}

			var pngBuilder = PngBuilder.Create(width, height, transparent);

			for (var x = 0; x < width; ++x)
			{
				for (var y = 0; y < height; ++y)
				{
					var color = force4Bpp 
						? timAsset.GetColor(x, y, TimBppMode.Bpp4, clutX, clutY) 
						: timAsset.GetColor(x, y, clutX, clutY);

					var pixel = new Pixel(color.R, color.G, color.B, color.A, false);

					pngBuilder.SetPixel(pixel, x, y);
				}
			}

			using (var memoryStream = new MemoryStream())
			{
				pngBuilder.Save(memoryStream);
				return Image.FromStream(memoryStream);
			}
		}

		public static Image CreatePalette(TimAsset timAsset)
		{
			var clutData = timAsset.ClutData;
			var vramData = clutData.VramData;

			var dx = vramData.DX;
			var dy = vramData.DY;
			var width = vramData.Width;
			var height = vramData.Height;

			var pngBuilder = PngBuilder.Create(width, height, true);

			for (var x = 0; x < width; ++x)
			{
				for (var y = 0; y < height; ++y)
				{
					var color = clutData.GetColor(0, dx + x, dy + y);

					var pixel = new Pixel(color.R, color.G, color.B, color.A, false);

					pngBuilder.SetPixel(pixel, x, y);
				}
			}

			using (var memoryStream = new MemoryStream())
			{
				pngBuilder.Save(memoryStream);
				return Image.FromStream(memoryStream);
			}
		}

		public static Image CreateCharacterPreview(MfoCharacterEntry charEntry, MfoPaletteEntry paletteEntry)
		{
			var x = 0;
			var y = 0;
			var pngBuilder = PngBuilder.Create(charEntry.Width, charEntry.Height, true);
			foreach (var data in charEntry.PixelData)
			{
				var color = paletteEntry.GetColor(data & 0x0F, 0, 0);
				pngBuilder.SetPixel(color, ref x, ref y, 0, charEntry.Width);

				color = paletteEntry.GetColor((data & 0xF0) >> 4, 0, 0);
				pngBuilder.SetPixel(color, ref x, ref y, 0, charEntry.Width);
			}

			using (var memoryStream = new MemoryStream())
			{
				pngBuilder.Save(memoryStream);
				return Image.FromStream(memoryStream);
			}
		}

		public static Image CreateTextPreview(List<MfoCharacterEntry> characterEntries, MfoPaletteEntry paletteEntry, int width = 256, int height = 256)
		{
			var separator = new TimColor[width, 1];
			for (var i = 0; i < width; ++i)
			{
				separator[i, 0] = new TimColor(0, 0, 0, 255);
			}

			var textPage = new TimColor[width, height];
			var textPages = new List<TimColor[,]>();
			textPages.Add(textPage);

			var x = 0;
			var y = 0;
			foreach (var characterEntry in characterEntries)
			{
				var startX = x;
				var startY = y;
				
				if (characterEntry.NewPage || y >= height)
				{
					x = 0;
					y = 0;

					startX = x;
					startY = y;

					textPages.Add(separator);
					textPage = new TimColor[width, height];
					textPages.Add(textPage);

					if (characterEntry.NewPage)
					{
						continue;
					}
				}

				if (characterEntry.NewLine || startX + characterEntry.Width >= width)
				{
					x = 0;
					y += 16;

					startX = x;
					startY = y;

					if (characterEntry.NewLine)
					{
						continue;
					}
				}


				var endX = startX + characterEntry.Width;

				if (characterEntry.PixelData != null)
				{
					foreach (var data in characterEntry.PixelData)
					{
						_colorBuffer[0] = paletteEntry.GetColor(data & 0x0F, 0, 0);
						_colorBuffer[1] = paletteEntry.GetColor((data & 0xF0) >> 4, 0, 0);

						for (int i = 0; i < 2; ++i)
						{
							if (x < width && y < height)
							{
								textPage[x, y] = _colorBuffer[i];
							}

							x++;

							if (x == endX)
							{
								x = startX;
								y++;
							}
						}
					}
				}

				x = endX;
				y = startY;
			}

			return CreateTextPreviewImage(textPages);
		}

		#endregion

		#region Private

		private static Image CreateTextPreviewImage(List<TimColor[,]> textPages)
		{
			var baseWidth = 0;
			var finalHeight = 0;
			foreach (var textPage in textPages)
			{
				var width = textPage.GetLength(0);
				if (width > baseWidth)
				{
					baseWidth = width;
				}

				finalHeight += textPage.GetLength(1);
			}
			
			var yOffset = 0;
			var pngBuilder = PngBuilder.Create(baseWidth, finalHeight, true);
			foreach (var page in textPages)
			{
				var height = page.GetLength(1);
				for (int x = 0, width = page.GetLength(0); x < width; x++)
				{
					for (var y = 0; y < height; y++)
					{
						var trgY = y + yOffset;
						if (trgY < finalHeight)
						{
							var color = page[x, y];
							if (color != null)
							{
								pngBuilder.SetPixel(color.ToPixel(), x, trgY);
							}
						}
					}
				}

				yOffset += height;
			}

			using (var memoryStream = new MemoryStream())
			{
				pngBuilder.Save(memoryStream);
				return Image.FromStream(memoryStream);
			}
		}

		private static void SetPixel(this PngBuilder pngBuilder, TimColor color, ref int x, ref int y, int startX, int endX)
		{
			pngBuilder.SetPixel(color.ToPixel(), x, y);

			x++;
			if (x == endX)
			{
				x = startX;
				y++;
			}
		}

		private static Pixel ToPixel(this TimColor color)
		{
			return new Pixel(color.R, color.G, color.B, color.A, false);
		}

		#endregion
	}
}

using System;
using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.ImageAssets
{
	public sealed class TimPixelData
	{
		#region Fields

		public readonly TimVramData VramData = new TimVramData();
		public readonly List<ushort> Pixels = new List<ushort>();

		#endregion

		#region Public

		public void Deserialize(byte[] data)
		{
			Pixels.Clear();

			using (var memoryStream = new MemoryStream(data))
			{
				using (var binaryReader = new BinaryReader(memoryStream))
				{
					VramData.Deserialize(binaryReader);

					var pixelDataSize = VramData.Width * VramData.Height;
					for (var i = 0; i < pixelDataSize; ++i)
					{
						var pixelData = binaryReader.ReadUInt16();

						Pixels.Add(pixelData);
					}
				}
			}
		}

		public byte[] Serialize()
		{
			using (var memoryStream = new MemoryStream())
			{
				using (var binaryWriter = new BinaryWriter(memoryStream))
				{
					VramData.Serialize(binaryWriter);

					for (int i = 0, l = Pixels.Count; i < l; ++i)
					{
						var pixel = Pixels[i];
						binaryWriter.Write(pixel);
					}
				}

				return memoryStream.ToArray();
			}
		}

		public void SetData(ushort width, ushort height, IReadOnlyList<ushort> pixelData, ushort dx = 0, ushort dy = 0)
		{
			VramData.DX = dx;
			VramData.DY = dy;
			VramData.Width = width;
			VramData.Height = height;

			Pixels.Clear();
			Pixels.AddRange(pixelData);
		}

		#endregion

		#region Pixel Methods

		public List<ushort> GetPixelRegion(TimBppMode bppMode, int xOffset, int yOffset, int width, int height)
		{
			GetPixelSettings(bppMode, out var mask, out var bitSize, out var pixelCountPerEntry);

			var pixels = new List<ushort>();

			for (var y = yOffset; y < yOffset + height; ++y)
			{
				for (var x = xOffset; x < xOffset + width; x += pixelCountPerEntry)
				{
					var pixel = 0;
					for (var i = 0; i < pixelCountPerEntry; ++i)
					{
						var colorIndex = GetColorIndex(bppMode, x + i, y);
						pixel |= colorIndex << (i * bitSize);
					}

					pixels.Add((ushort)pixel);
				}
			}

			return pixels;
		}

		public void SetPixelRegion(TimBppMode bppMode, int xOffset, int yOffset, int width, int height, int vramWidth, List<ushort> pixels)
		{
			for (var y = 0; y < height; ++y)
			{
				for (var x = 0; x < width; ++x)
				{
					var colorIndex = GetColorIndex(bppMode, x, y, vramWidth, pixels);

					SetColorIndex(bppMode, x + xOffset, y + yOffset, colorIndex);
				}
			}
		}

		public ushort GetColorIndex(TimBppMode bppMode, int x, int y)
		{
			return GetColorIndex(bppMode, x, y, VramData.Width, Pixels);
		}

		private static ushort GetColorIndex(TimBppMode bppMode, int x, int y, int vramWidth, List<ushort> pixels)
		{
			GetPixelSettings(bppMode, out var mask, out var bitSize, out var pixelCountPerEntry);

			var pixel = 0;
			var bitOffset = (x % pixelCountPerEntry) * bitSize;

			var pixelOffset = (y * vramWidth) + (x / pixelCountPerEntry);
			if (pixelOffset < pixels.Count)
			{
				pixel = pixels[pixelOffset];
			}

			return (ushort)((pixel & (mask << bitOffset)) >> bitOffset);
		}

		public void SetColorIndex(TimBppMode bppMode, int x, int y, ushort color)
		{
			GetPixelSettings(bppMode, out var mask, out var bitSize, out var pixelCountPerEntry);

			var pixelOffset = (y * VramData.Width) + (x / pixelCountPerEntry);
			if (pixelOffset < Pixels.Count)
			{
				var pixel = 0;
				var bitOffset = (x % pixelCountPerEntry) * bitSize;

				pixel = Pixels[pixelOffset];
				pixel = (pixel & ~(mask << bitOffset)) | (color << bitOffset);
				Pixels[pixelOffset] = (ushort)pixel;
			}
			else
			{
				throw new Exception("Fail to set pixel.");
			}
		}

		private static void GetPixelSettings(TimBppMode bppMode, out ushort mask, out byte bitSize, out byte pixelCountPerEntry)
		{
			switch (bppMode)
			{
				case TimBppMode.Bpp4:
					mask = 0x000F;
					bitSize = 4;
					pixelCountPerEntry = 4;
					break;

				case TimBppMode.Bpp8:
					mask = 0x00FF;
					bitSize = 8;
					pixelCountPerEntry = 2;
					break;

				case TimBppMode.Bpp15:
					mask = 0xFFFF;
					bitSize = 16;
					pixelCountPerEntry = 1;
					break;

				default:
					throw new ArgumentException("BPP mode not supported.");
			}
		}

		#endregion
	}
}

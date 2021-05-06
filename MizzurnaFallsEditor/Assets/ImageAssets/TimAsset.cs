using System;
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Assets.ImageAssets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets
{
	[AssetData(Signature)]
	public class TimAsset : Asset
	{
		#region Constants

		public const int Signature = 0x00000010;

		#endregion

		#region Fields

		public readonly TimFlagData FlagData = new TimFlagData();
		public readonly TimClutData ClutData = new TimClutData();
		public readonly TimPixelData PixelData = new TimPixelData();

		#endregion

		#region Properties
		
		public ushort PixelWidth
		{
			get
			{
				var width = PixelData.VramData.Width;
				switch (FlagData.BppMode)
				{
					case TimBppMode.Bpp4:
						return (ushort)(width * 4);

					case TimBppMode.Bpp8:
						return (ushort)(width * 2);
				}

				return width;
			}
		}

		public ushort PixelHeight => PixelData.VramData.Height;

		#endregion

		#region Public

		public override void Deserialize(byte[] bytes)
		{
			_bytes = bytes;

			using (var memoryStream = new MemoryStream(bytes))
			{
				using (var binaryReader = new BinaryReader(memoryStream))
				{
					var signature = binaryReader.ReadInt32(); // ID
					if (signature != Signature)
					{
						throw new Exception("This is not a TIM asset.");
					}
					
					FlagData.Deserialize(binaryReader);

					if (FlagData.HasClutData)
					{
						ClutData.Deserialize(ReadBlock(binaryReader));
					}
					
					PixelData.Deserialize(ReadBlock(binaryReader));
				}
			}

			byte[] ReadBlock(BinaryReader binaryReader)
			{
				var size = binaryReader.ReadInt32();
				return binaryReader.ReadBytes(size - 4);
			}
		}

		public override byte[] Serialize()
		{
			using (var memoryStream = new MemoryStream())
			{
				using (var binaryWriter = new BinaryWriter(memoryStream))
				{
					binaryWriter.Write(Signature);

					FlagData.Serialize(binaryWriter);

					if (FlagData.HasClutData)
					{
						WriteBlock(binaryWriter, ClutData.Serialize());
					}

					WriteBlock(binaryWriter, PixelData.Serialize());
				}

				_bytes = memoryStream.ToArray();
			}

			return _bytes;

			void WriteBlock(BinaryWriter binaryWriter, byte[] data)
			{
				binaryWriter.Write(data.Length + 4);
				binaryWriter.Write(data);
			}
		}

		public TimColor GetColor(int x, int y, int clutX, int clutY)
		{
			return GetColor(x, y, FlagData.BppMode, clutX, clutY);
		}

		public TimColor GetColor(int x, int y, TimBppMode bppMode, int clutX, int clutY)
		{
			var color = PixelData.GetColorIndex(bppMode, x, y);

			if (FlagData.HasClutData)
			{
				return ClutData.GetColor(color, clutX, clutY);
			}

			return TimColor.Create(color);
		}

		public static TimAsset Create(TimBppMode bppMode, IReadOnlyList<ushort> clutEntries, ushort pixelWidth, ushort pixelHeight, IReadOnlyList<ushort> pixelData)
		{
			var timAsset = new TimAsset();
			var flagData = timAsset.FlagData;

			flagData.BppMode = bppMode;
			flagData.HasClutData = bppMode == TimBppMode.Bpp4 || bppMode == TimBppMode.Bpp8;

			var width = pixelWidth;
			switch (flagData.BppMode)
			{
				case TimBppMode.Bpp4:
					width = (ushort)(pixelWidth / 4);
					break;

				case TimBppMode.Bpp8:
					width = (ushort)(pixelWidth / 2);
					break;
			}

			timAsset.ClutData.SetData(clutEntries);
			timAsset.PixelData.SetData(width, pixelHeight, pixelData);

			return timAsset;
		}

		#endregion
	}
}
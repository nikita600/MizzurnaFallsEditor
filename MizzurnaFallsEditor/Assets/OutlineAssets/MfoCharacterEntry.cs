using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.OutlineAssets
{
    public sealed class MfoCharacterEntry
    {
        #region Fields
        
        public byte ClutOffsetY;
        public byte Width;
        public byte Height;
        public byte BitsPerPixelMode;

        public byte[] PixelData;

        public readonly ushort Code;

		public readonly bool NewLine;

		public readonly bool NewPage;

        #endregion

        #region Public

        public MfoCharacterEntry(int index, bool newLine = false, bool newPage = false)
        {
            Code = (ushort)(0xA000 | index);

			NewLine = newLine;
			NewPage = newPage;
        }

        public void SerializeData(BinaryWriter binaryWriter)
        {
            binaryWriter.Write(ClutOffsetY);
            binaryWriter.Write(Width);
            binaryWriter.Write(Height);
            binaryWriter.Write(BitsPerPixelMode);
        }

        public void SerializePixelData(BinaryWriter binaryWriter)
        {
            binaryWriter.Write(PixelData);
        }
        
        public void DeserializeData(BinaryReader binaryReader)
        {
            ClutOffsetY = binaryReader.ReadByte();
            Width = binaryReader.ReadByte();
            Height = binaryReader.ReadByte();
            BitsPerPixelMode = binaryReader.ReadByte();

			if (BitsPerPixelMode == 0)
			{
				BitsPerPixelMode = 2;
			}
        }

        public void DeserializePixelData(BinaryReader binaryReader)
        {
            var pixelDataSize = (Width * Height) / BitsPerPixelMode;
            PixelData = binaryReader.ReadBytes(pixelDataSize);
        }

		public IReadOnlyList<ushort> GetTimPixelData()
		{
			var pixels = new List<ushort>();
			for (int i = 0, l = PixelData.Length; i < l; i += 2)
			{
				var first = PixelData[i];
				var second = i + 1 < l ? PixelData[i + 1] : (byte)0;

				var timPixel = (second << 8) | first;

				pixels.Add((ushort)timPixel);
			}

			return pixels;
		}

		public void SetTimPixelData(TimAsset timAsset)
		{
            var pixelWidth = (byte)timAsset.PixelWidth;
            var pixelHeight = (byte)timAsset.PixelHeight;
            var timPixelData = timAsset.PixelData.Pixels;

            var pixelCount = (pixelWidth / 4) * pixelHeight;
			if (pixelCount > timPixelData.Count)
			{
				throw new System.Exception("SetTimPixelData Fail");
			}
			
			var pixels = new List<byte>();
			for (int i = 0, l = timPixelData.Count; i < l; ++i)
			{
				var timPixel = timPixelData[i];

				var first = timPixel & 0x00FF;
				var second = (timPixel & 0xFF00) >> 8;

				pixels.Add((byte)first);
				pixels.Add((byte)second);
			}

			Width = pixelWidth;
			Height = pixelHeight;
			PixelData = pixels.ToArray();
		}

        public override string ToString()
        {
            return $"0x{Code:X4}, Width: 0x{Width:X2}, Height: 0x{Height:X2}";
        }
        
        #endregion
    }
}
using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public sealed class TmdTextureFlags
    {
        public int TexturePage;
        public int TransparentMode;
        public TexturePixelFormat PixelFormat;

        public void Deserialize(BinaryReader binaryReader)
        {
            var tsb = binaryReader.ReadInt16();

            TexturePage = tsb & 0x0F;
            TransparentMode = (tsb & 0x30) >> 4;
            PixelFormat = (TexturePixelFormat)((tsb & 0xC0) >> 6);
        }

		public override string ToString()
		{
            return $"BPP: {PixelFormat}, TPAGE: {TexturePage}, TSP: {TransparentMode}";
		}

		public enum TexturePixelFormat
        {
            BPP4 = 0,
            BPP8 = 1,
            BPP15 = 2,
        }
    }
}

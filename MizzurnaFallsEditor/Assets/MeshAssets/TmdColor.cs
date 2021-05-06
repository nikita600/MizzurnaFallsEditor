using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdColor
    {
        public byte R;
        public byte G;
        public byte B;

        public void Deserialize(BinaryReader binaryReader, bool readPaddingByte = false)
        {
            R = binaryReader.ReadByte();
            G = binaryReader.ReadByte();
            B = binaryReader.ReadByte();

            if (readPaddingByte)
            {
                binaryReader.ReadByte();
            }
        }

        public override string ToString()
        {
            return $"R: 0x{R:X2}, G: 0x{G:X2}, B: 0x{B:X2}";
        }
    }
}

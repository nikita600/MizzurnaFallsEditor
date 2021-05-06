using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdClutAddress
    {
        public int X;
        public int Y;

        public TmdClutAddress()
        {
        }

        public void Deserialize(BinaryReader binaryReader)
        {
            var cba = binaryReader.ReadUInt16();

            X = (cba & 0x3F) << 4;
            Y = (cba & 0xFFC0) >> 6;
        }

		public override string ToString()
		{
            return $"X: 0x{X:X4} ({X}), Y: 0x{Y:X4} ({Y})";
		}
	}
}

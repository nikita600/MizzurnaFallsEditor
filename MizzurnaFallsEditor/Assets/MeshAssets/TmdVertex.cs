using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdVertex
    {
        public short X;
        public short Y;
        public short Z;

        public void Deserialize(BinaryReader binaryReader)
        {
            X = binaryReader.ReadInt16();
            Y = binaryReader.ReadInt16();
            Z = binaryReader.ReadInt16();

            binaryReader.ReadInt16(); // padding
        }

        public override string ToString()
        {
            return $"({X}, {Y}, {Z})";
        }
    }
}

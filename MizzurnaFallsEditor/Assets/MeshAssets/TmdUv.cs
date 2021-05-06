using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdUv
    {
        public byte U;
        public byte V;

        public void Deserialize(BinaryReader binaryReader)
        {
            U = binaryReader.ReadByte();
            V = binaryReader.ReadByte();
        }

        public override string ToString()
        {
            return $"U: 0x{U:X2} ({U}), V: 0x{V:X2} ({V})";
        }
    }
}

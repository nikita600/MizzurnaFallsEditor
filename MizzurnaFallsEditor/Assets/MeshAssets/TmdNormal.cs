using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdNormal
    {
        private const float Scale = 4096f;

        public float NX;
        public float NY;
        public float NZ;

        public void Deserialize(BinaryReader binaryReader)
        {
            var x = binaryReader.ReadInt16();
            var y = binaryReader.ReadInt16();
            var z = binaryReader.ReadInt16();

            NX = x / Scale;
            NY = y / Scale;
            NZ = z / Scale;

            binaryReader.ReadInt16(); // padding
        }

        public override string ToString()
        {
            return $"({NX}, {NY}, {NZ})";
        }
    }
}

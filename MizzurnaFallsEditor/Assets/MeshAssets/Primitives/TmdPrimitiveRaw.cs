using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public class TmdPrimitiveRaw : TmdPrimitive
    {
        private byte[] _primitiveData;

        public override void Deserialize(BinaryReader binaryReader)
        {
            base.Deserialize(binaryReader);
            binaryReader.BaseStream.Position = binaryReader.BaseStream.Position - 4;

            var packetSize = (Ilen * 4) + 4;
            _primitiveData = binaryReader.ReadBytes(packetSize);

            if (Header.PrimitiveCode != TmdPrimitiveCode.Polygon)
            {
                System.Console.WriteLine("Found: " + Header.PrimitiveCode);
            }
        }

        public override string ToString()
        {
            var primitiveName = System.Enum.GetName(typeof(TmdPrimitiveCode), Header.PrimitiveCode);

            return $"{Header.PrimitiveCode.ToString()}, 4Vert: {Header.IsQuadPrimitive}";
        }
    }
}

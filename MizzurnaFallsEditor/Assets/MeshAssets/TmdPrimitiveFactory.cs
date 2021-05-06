using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    using Primitives;
    using Primitives.Sprite;

    public static class TmdPrimitiveFactory
    {
        public static TmdPrimitive Create(BinaryReader binaryReader)
        {
            binaryReader.BaseStream.Position += 2;
            var Flag = binaryReader.ReadByte();
            var Mode = binaryReader.ReadByte();
            binaryReader.BaseStream.Position -= 4;

            var PrimitiveCode = (TmdPrimitiveCode)((Mode & 0xE0) >> 5);
            switch (PrimitiveCode)
            {
                case TmdPrimitiveCode.Polygon:
                    return CreatePolygonPrimitive(binaryReader, Mode, Flag);

                case TmdPrimitiveCode.StraightLine:
                    return CreateStraightLine(binaryReader);

                case TmdPrimitiveCode.Sprite:
                    return CreateSprite(binaryReader);
            }

            throw new System.ArgumentException("Invalid Primitive Code.");
        }

        private static TmdPrimitive CreatePolygonPrimitive(BinaryReader binaryReader, byte mode, byte flag)
        {
            var isCalculateLight = (flag & 0x01) == 0;
            TmdPrimitive tmdPrimitive;
            if (isCalculateLight)
            {
                tmdPrimitive = new TmdPolygonLitPrimitive();
            }
            else
            {
                tmdPrimitive = new TmdPolygonUnlitPrimitive();
            }

            tmdPrimitive.Deserialize(binaryReader);
            return tmdPrimitive;
        }

        private static TmdPrimitive CreateStraightLine(BinaryReader binaryReader)
        {
            System.Console.WriteLine("Line!");
            return null;
        }

        public static TmdPrimitive CreateSprite(BinaryReader binaryReader)
        {
            var tmdSprite = new TmdSpritePrimitive();
            tmdSprite.Deserialize(binaryReader);

            return tmdSprite;
        }
    }
}

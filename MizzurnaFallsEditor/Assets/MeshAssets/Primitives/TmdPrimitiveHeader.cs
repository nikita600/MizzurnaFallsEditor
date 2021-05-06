namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public sealed class TmdPrimitiveHeader
    {
        public readonly TmdPrimitiveCode PrimitiveCode;

        public readonly TmdPrimitiveShadingMode ShadingMode;

        public readonly bool IsQuadPrimitive;
        public readonly bool IsTextured;
        public readonly bool IsTransparent;
        public readonly bool IsCalculateBrightness;

        public readonly bool IsGradationPolygon;
        public readonly bool IsDoubleFacedPolygon;
        public readonly bool IsLightSourceCalculationCarried;

        public readonly byte Mode;
        public readonly byte Flag;
        public readonly int Options;

        public TmdPrimitiveHeader(byte mode, byte flag)
        {
            Mode = mode;
            Flag = flag;
            Options = mode & 0x1F;

            PrimitiveCode = (TmdPrimitiveCode)((mode & 0xE0) >> 5);

            ShadingMode = (TmdPrimitiveShadingMode)((Options & 0x10) >> 4);
            IsQuadPrimitive = ((Options & 0x08) >> 3) == 1;
            IsTextured = ((Options & 0x04) >> 2) == 1;
            IsTransparent = ((Options & 0x02) >> 1) == 1;
            IsCalculateBrightness = (Options & 0x01) == 0;

            IsGradationPolygon = ((flag & 0x04) >> 2) == 1;
            IsDoubleFacedPolygon = ((flag & 0x02) >> 1) == 1;
            IsLightSourceCalculationCarried = (flag & 0x01) == 0;
        }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}

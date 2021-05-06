using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives.Sprite
{
    public sealed class TmdSpritePrimitive : TmdPrimitive
    {
        public short Width;
        public short Height;

        public short Vertex0;
        public readonly TmdUv UV0 = new TmdUv();

        public readonly TmdClutAddress CBA = new TmdClutAddress();
        public readonly TmdTextureFlags TSB = new TmdTextureFlags();
        
        public override void Deserialize(BinaryReader binaryReader)
        {
            base.Deserialize(binaryReader);

            Vertex0 = binaryReader.ReadInt16();
            TSB.Deserialize(binaryReader);
            UV0.Deserialize(binaryReader);
            CBA.Deserialize(binaryReader);

            var sizeType = (Header.Options & 0x18) >> 3;
            switch (sizeType)
            {
                case 0: // FreeSize
                    Width = binaryReader.ReadInt16();
                    Height = binaryReader.ReadInt16();
                    break;

                case 1: // 1x1
                    Width = Height = 1;
                    break;

                case 2: // 8x8
                    Width = Height = 8;
                    break;

                case 3: // 16x16
                    Width = Height = 16;
                    break;
            }
        }
    }
}

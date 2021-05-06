using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public abstract class TmdPrimitive
    {
        public byte Mode;
        public byte Flag;
        public byte Ilen;
        public byte Olen;

        public TmdPrimitiveHeader Header;

        public int ByteSize => (Ilen * 4) + 4;

        public virtual void Deserialize(BinaryReader binaryReader)
        {
            Olen = binaryReader.ReadByte();
            Ilen = binaryReader.ReadByte();
            Flag = binaryReader.ReadByte();
            Mode = binaryReader.ReadByte();

            Header = new TmdPrimitiveHeader(Mode, Flag);
        }
    }
}

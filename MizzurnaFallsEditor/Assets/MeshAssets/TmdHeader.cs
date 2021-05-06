using System;
using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public sealed class TmdHeader
    {
        public const int Size = 12;

        public int Id;
        public int Flags;
        public int ObjectsCount;

        public void Deserialize(BinaryReader binaryReader)
        {
            Id = binaryReader.ReadInt32();
            Flags = binaryReader.ReadInt32();
            ObjectsCount = binaryReader.ReadInt32();

            if (Id != 0x41)
            {
                throw new ArgumentException("This is not a TMD asset.");
            }
        }
    }
}

using System.IO;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(Signature)]
    public sealed class VabAsset : Asset
    {
        #region Constants

        public const int Signature = 0x56414270;

        #endregion

        #region Fields

        public int Version;
        public int VabId;
        public int WaveformSize;
        public short SystemReserved01;
        public short ProgramsCount;
        public short TonesCount;
        public short VagCount;
        public byte MasterVolume;
        public byte MasterPan;
        public byte BankAttribute01;
        public byte BankAttribute02;
        public int SystemReserved02;

        #endregion

        #region Public

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

            using (var memoryStream = new MemoryStream(bytes))
			{
                using (var binaryReader = new BinaryReader(memoryStream))
				{
                    var signature = binaryReader.ReadInt32();
                    Version = binaryReader.ReadInt32();
                    VabId = binaryReader.ReadInt32();
                    WaveformSize = binaryReader.ReadInt32();
                    SystemReserved01 = binaryReader.ReadInt16();
                    ProgramsCount = binaryReader.ReadInt16();
                    TonesCount = binaryReader.ReadInt16();
                    VagCount = binaryReader.ReadInt16();
                    MasterVolume = binaryReader.ReadByte();
                    MasterPan = binaryReader.ReadByte();
                    BankAttribute01 = binaryReader.ReadByte();
                    BankAttribute02 = binaryReader.ReadByte();
                    SystemReserved02 = binaryReader.ReadInt32();
				}
			}
        }

        public override byte[] Serialize()
        {
            return _bytes;
        }

        #endregion
    }
}
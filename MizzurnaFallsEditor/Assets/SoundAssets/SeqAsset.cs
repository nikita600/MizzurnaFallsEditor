using System;
using System.IO;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(Signature)]
    public sealed class SeqAsset : Asset
    {
        #region Constants

        public const int Signature = 0x53455170;

        #endregion

        #region Fields

        public int Version;
        public ushort ResoulutionOfQuarterNote;
        public int Tempo; // Should be 3 bytes
        public ushort Rhythm;
        public byte[] ScoreData;

        #endregion

        #region Public

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

            using (var memoryStream = new MemoryStream(bytes))
			{
                using (var binaryReader = new BinaryReader(memoryStream))
				{
                    binaryReader.ReadInt32(); // Signature

                    Version = binaryReader.ReadInt32();
                    ResoulutionOfQuarterNote = binaryReader.ReadUInt16();

                    var tempo = binaryReader.ReadBytes(3);
                    Tempo = BitConverter.ToInt32(new byte[] { tempo[0], tempo[1], tempo[2], 0}, 0);

                    Rhythm = binaryReader.ReadUInt16();


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
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    [AssetData(Signature)]
    public sealed class TmdAsset : Asset
    {
        public const int Signature = 0x00000041;

        #region Fields

        public readonly TmdHeader Header = new TmdHeader();
        public readonly List<TmdObjectEntry> ObjectTable = new List<TmdObjectEntry>();

        #endregion

        #region Methods

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

            ObjectTable.Clear();
            using (var memoryStream = new MemoryStream(bytes))
            {
                using (var binaryReader = new BinaryReader(memoryStream))
                {
                    Header.Deserialize(binaryReader);

                    for (var i = 0; i < Header.ObjectsCount; ++i)
                    {
                        var objectEntry = new TmdObjectEntry();
                        objectEntry.Deserialize(binaryReader);

                        ObjectTable.Add(objectEntry);
                    }

                    for (var i = 0; i < ObjectTable.Count; ++i)
                    {
                        var objectEntry = ObjectTable[i];
                        objectEntry.DeserializeVertices(binaryReader);
                        objectEntry.DeserializeNormals(binaryReader);
                        objectEntry.DeserializePrimitives(binaryReader);
                    }
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

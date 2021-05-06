using MizzurnaFallsEditor.Assets.MeshAssets.Primitives;
using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets
{
    public class TmdObjectEntry
    {
        public int VerticesOffset;
        public int VerticesCount;
        public readonly List<TmdVertex> Vertices = new List<TmdVertex>();

        public int NormalsOffset;
        public int NormalsCount;
        public readonly List<TmdNormal> Normals = new List<TmdNormal>();

        public int PrimitivesOffset;
        public int PrimitivesCount;
        public readonly List<TmdPrimitive> Primitives = new List<TmdPrimitive>();

        public int Scale;

        public void Deserialize(BinaryReader binaryReader)
        {
            VerticesOffset = binaryReader.ReadInt32();
            VerticesCount = binaryReader.ReadInt32();

            NormalsOffset = binaryReader.ReadInt32();
            NormalsCount = binaryReader.ReadInt32();

            PrimitivesOffset = binaryReader.ReadInt32();
            PrimitivesCount = binaryReader.ReadInt32();

            Scale = binaryReader.ReadInt32();
        }

        public void DeserializeVertices(BinaryReader binaryReader)
        {
            binaryReader.BaseStream.Position = VerticesOffset + TmdHeader.Size;

            Vertices.Clear();
            for (var i = 0; i < VerticesCount; ++i)
            {
                var vertex = new TmdVertex();
                vertex.Deserialize(binaryReader);

                Vertices.Add(vertex);
            }
        }

        public void DeserializeNormals(BinaryReader binaryReader)
        {
            binaryReader.BaseStream.Position = NormalsOffset + TmdHeader.Size;

            Normals.Clear();
            for (var i = 0; i < NormalsCount; ++i)
            {
                var normal = new TmdNormal();
                normal.Deserialize(binaryReader);

                Normals.Add(normal);
            }
        }
        public void DeserializePrimitives(BinaryReader binaryReader)
        {
            binaryReader.BaseStream.Position = PrimitivesOffset + TmdHeader.Size;

            Primitives.Clear();

            for (var i = 0; i < PrimitivesCount; ++i)
            {
                var primitive = TmdPrimitiveFactory.Create(binaryReader);
                Primitives.Add(primitive);
            }
        }
    }
}

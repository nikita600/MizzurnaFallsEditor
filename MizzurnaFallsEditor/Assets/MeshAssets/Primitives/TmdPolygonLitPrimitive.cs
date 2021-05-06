using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public sealed class TmdPolygonLitPrimitive : TmdPolygonPrimitive
    {
		#region Fields

		public List<short> Normals = new List<short>();

		#endregion

		#region Serialization

		public override void Deserialize(BinaryReader binaryReader)
        {
            base.Deserialize(binaryReader);

            var startPosition = binaryReader.BaseStream.Position;
            switch (Header.ShadingMode)
            {
                case TmdPrimitiveShadingMode.Flat:
                    DeserializeFlatShadedPolygon(binaryReader);
                    break;

                case TmdPrimitiveShadingMode.Gouraud:
                    DeserializeGouraudShadedPolygon(binaryReader);
                    break;
            }

            if ((binaryReader.BaseStream.Position - startPosition) != (ByteSize - 4))
            {
                throw new System.Exception("Fail to deserialize.");
            }
        }

		#endregion

		#region Flat Shading

		private void DeserializeFlatShadedPolygon(BinaryReader reader)
		{
            if (Header.IsTextured)
            {
                //DeserializeFlatTexture(reader);

                DeserializeUVs(reader);
                DeserializeFlatNormalAndVertices(reader);
            }
            else
            {
                if (Header.IsGradationPolygon)
                {
                    //DeserializeFlatNoTextureGradation(reader);

                    DeserializeGradationColors(reader);
                    DeserializeFlatNormalAndVertices(reader);
                }
                else
                {
                    //DeserializeFlatNoTextureSolid(reader);

                    DeserializeFlatColor(reader);
                    DeserializeFlatNormalAndVertices(reader);
                }
            }
        }

        private void DeserializeFlatNormalAndVertices(BinaryReader binaryReader)
		{
            var normal = binaryReader.ReadInt16();

            Normals.Add(normal);
            Normals.Add(normal);
            Normals.Add(normal);

            if (Header.IsQuadPrimitive)
            {
                Normals.Add(normal);
            }

            Vertices.Add(binaryReader.ReadInt16()); // Vertex0
            Vertices.Add(binaryReader.ReadInt16()); // Vertex1
            Vertices.Add(binaryReader.ReadInt16()); // Vertex2

            if (Header.IsQuadPrimitive)
            {
                Vertices.Add(binaryReader.ReadInt16()); // Vertex3
                binaryReader.BaseStream.Position += 2;
            }
        }

		#endregion

		#region Gouraud

        private void DeserializeGouraudShadedPolygon(BinaryReader reader)
		{
            if (Header.IsTextured)
            {
                DeserializeGouraudTexture(reader);
            }
            else
            {
                if (Header.IsGradationPolygon)
                {
                    DeserializeGouraudNoTextureGradation(reader);
                }
                else
                {
                    DeserializeGouraudNoTextureSolid(reader);
                }
            }
        }

		private void DeserializeGouraudNoTextureSolid(BinaryReader binaryReader)
        {
            DeserializeFlatColor(binaryReader);
            DeserializeGouraudNormalsAndVertices(binaryReader);
        }

        private void DeserializeGouraudNoTextureGradation(BinaryReader binaryReader)
        {
            DeserializeGradationColors(binaryReader);
            DeserializeGouraudNormalsAndVertices(binaryReader);
        }

        private void DeserializeGouraudTexture(BinaryReader binaryReader)
        {
            DeserializeUVs(binaryReader);
            DeserializeGouraudNormalsAndVertices(binaryReader);
        }

        private void DeserializeGouraudNormalsAndVertices(BinaryReader binaryReader)
		{
            Normals.Add(binaryReader.ReadInt16()); // Normal0
            Vertices.Add(binaryReader.ReadInt16()); // Vertex0

            Normals.Add(binaryReader.ReadInt16()); // Normal1
            Vertices.Add(binaryReader.ReadInt16()); // Vertex1

            Normals.Add(binaryReader.ReadInt16()); // Normal2
            Vertices.Add(binaryReader.ReadInt16()); // Vertex2

            if (Header.IsQuadPrimitive)
            {
                Normals.Add(binaryReader.ReadInt16()); // Normal3
                Vertices.Add(binaryReader.ReadInt16()); // Vertex3
            }
        }

		#endregion
	}
}

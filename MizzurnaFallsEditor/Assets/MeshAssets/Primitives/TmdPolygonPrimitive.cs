using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public abstract class TmdPolygonPrimitive : TmdPrimitive
    {
        #region Fields

        public readonly TmdClutAddress ClutAdress = new TmdClutAddress();
        public readonly TmdTextureFlags TextureFlags = new TmdTextureFlags();

        public readonly List<TmdUv> UVs = new List<TmdUv>();
        public readonly List<short> Vertices = new List<short>();
        public readonly List<TmdColor> Colors = new List<TmdColor>();
        
        #endregion

        #region Methods

        protected void DeserializeVertices(BinaryReader binaryReader)
        {
            Vertices.Add(binaryReader.ReadInt16()); // Vertex0
            Vertices.Add(binaryReader.ReadInt16()); // Vertex1
            Vertices.Add(binaryReader.ReadInt16()); // Vertex2

            if (Header.IsQuadPrimitive)
            {
                Vertices.Add(binaryReader.ReadInt16()); // Vertex3
            }
            else
            {
                binaryReader.BaseStream.Position += 2;
            }
        }

        protected void DeserializeUVs(BinaryReader binaryReader)
        {
            DeserializeUV(binaryReader); // UV0
            ClutAdress.Deserialize(binaryReader);
            DeserializeUV(binaryReader); // UV1
            TextureFlags.Deserialize(binaryReader);
            DeserializeUV(binaryReader); // UV2
            binaryReader.BaseStream.Position += 2;

            if (Header.IsQuadPrimitive)
            {
                DeserializeUV(binaryReader); // UV3
                binaryReader.BaseStream.Position += 2;
            }
        }

        protected void DeserializeFlatColor(BinaryReader binaryReader)
		{
            var color = new TmdColor();
            color.Deserialize(binaryReader, true);

            Colors.Add(color);
            Colors.Add(color);
            Colors.Add(color);

            if (Header.IsQuadPrimitive)
			{
                Colors.Add(color);
			}
        }

        protected void DeserializeGradationColors(BinaryReader binaryReader)
		{
            DeserializeColor(binaryReader); // Color0
            DeserializeColor(binaryReader); // Color1
            DeserializeColor(binaryReader); // Color2

            if (Header.IsQuadPrimitive)
            {
                DeserializeColor(binaryReader); // Color3
            }
        }

        private TmdUv DeserializeUV(BinaryReader binaryReader)
		{
            var uv = new TmdUv();
            uv.Deserialize(binaryReader);
            UVs.Add(uv);

            return uv;
        }

        private TmdColor DeserializeColor(BinaryReader binaryReader)
		{
            var color = new TmdColor();
            color.Deserialize(binaryReader, true);
            Colors.Add(color);

            return color;
        }

		#endregion
	}
}

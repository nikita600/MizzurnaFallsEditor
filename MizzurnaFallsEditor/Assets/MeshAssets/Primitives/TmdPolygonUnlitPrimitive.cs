using System.IO;

namespace MizzurnaFallsEditor.Assets.MeshAssets.Primitives
{
    public sealed class TmdPolygonUnlitPrimitive : TmdPolygonPrimitive
    {
        public override void Deserialize(BinaryReader binaryReader)
        {
            base.Deserialize(binaryReader);
            binaryReader.BaseStream.Position = binaryReader.BaseStream.Position - 4;

            var primitiveData = binaryReader.ReadBytes(ByteSize);

            using (var stream = new MemoryStream(primitiveData))
            {
                stream.Position += 4;

                using (var reader = new BinaryReader(stream))
                {
                    switch (Header.ShadingMode)
                    {
                        case TmdPrimitiveShadingMode.Flat:
                            {
                                if (Header.IsGradationPolygon)
                                {
                                    if (Header.IsTextured)
                                    {
                                        DeserializeGradationTextured(reader);
                                    }
                                    else
                                    {
                                        DeserializeGradationNoTexture(reader);
                                    }
                                }
                                else
                                {
                                    if (Header.IsTextured)
                                    {
                                        DeserializeFlatTextured(reader);
                                    }
                                    else
                                    {
                                        DeserializeFlatNoTexture(reader);
                                    }
                                }
                            }
                            break;

                        case TmdPrimitiveShadingMode.Gouraud:
                            {
                                if (Header.IsTextured)
                                {
                                    DeserializeGradationTextured(reader);
                                }
                                else
                                {
                                    DeserializeGradationNoTexture(reader);
                                }
                            }
                            break;
                    }
                }
            }
        }

        private void DeserializeFlatNoTexture(BinaryReader binaryReader)
        {
            DeserializeFlatColor(binaryReader);
            DeserializeVertices(binaryReader);
        }

        private void DeserializeFlatTextured(BinaryReader binaryReader)
        {
            DeserializeUVs(binaryReader);
            DeserializeFlatColor(binaryReader);
            DeserializeVertices(binaryReader);
        }

        private void DeserializeGradationNoTexture(BinaryReader binaryReader)
        {
            DeserializeGradationColors(binaryReader);
            DeserializeVertices(binaryReader);
        }

        private void DeserializeGradationTextured(BinaryReader binaryReader)
        {
            DeserializeUVs(binaryReader);
            DeserializeGradationColors(binaryReader);
            DeserializeVertices(binaryReader);
        }
    }
}

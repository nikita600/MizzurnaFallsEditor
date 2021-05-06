using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Assets.MeshAssets;
using MizzurnaFallsEditor.Assets.MeshAssets.Primitives;

namespace MizzurnaFallsEditor.Utilities
{
	public class TmdConverterUtility
	{
        public static void SaveAsWavefrontObject(Asset baseAsset, TmdAsset tmdAsset)
        {
            using (var saveFileDialog = new SaveFileDialog())
            {
                saveFileDialog.FileName = baseAsset.Name;
                saveFileDialog.Filter = "|*.OBJ";
                saveFileDialog.InitialDirectory = "/../";
                saveFileDialog.Title = $"Save {baseAsset.Name} file...";

                if (saveFileDialog.ShowDialog() != DialogResult.OK)
                {
                    return;
                }

                var i = 0;
                var wavefrontObjects = TmdConverterUtility.ConvertToWavefrontObject(tmdAsset, out var textureMapData);
                foreach (var wavefrontObject in wavefrontObjects)
                {
                    var path = string.Concat(saveFileDialog.FileName, "_", i.ToString("D2"), ".OBJ");

                    File.WriteAllText(path, wavefrontObject);

                    i++;
                }

                File.WriteAllText(string.Concat(saveFileDialog.FileName, ".MAP"), textureMapData);
            }
        }

        public static List<string> ConvertToWavefrontObject(TmdAsset tmdAsset, out string textureMapData)
        {
            var tpages = new HashSet<int>();
            var wavefrontObjects = new List<string>();

            var textureMapBuilder = new StringBuilder();
            foreach (var objectEntry in tmdAsset.ObjectTable)
            {
                var objBuilder = new StringBuilder();
                foreach (var vertex in objectEntry.Vertices)
                {
                    objBuilder.AppendLine(FormatVertex(vertex));
                }

                foreach (var normal in objectEntry.Normals)
                {
                    objBuilder.AppendLine(FormatNormal(normal));
                }

                textureMapBuilder.AppendLine("=== OBJECT ===");

                foreach (var primitive in objectEntry.Primitives)
                {
                    if (primitive is TmdPolygonPrimitive poly && poly.Header.IsTextured)
                    {
                        var tpage = poly.TextureFlags.TexturePage;
                        if (!tpages.Contains(tpage))
                        {
                            tpages.Add(tpage);
                        }

                        textureMapBuilder.
                            Append("BPP: ").AppendLine(poly.TextureFlags.PixelFormat.ToString()).
                            Append("TPAGE: ").AppendLine(tpage.ToString("X2")).
                            Append("CLUT: ").AppendLine(poly.ClutAdress.ToString());
                        foreach (var uv in poly.UVs)
                        {
                            textureMapBuilder.Append("\t").AppendLine(uv.ToString());
                        }
                        textureMapBuilder.AppendLine();
                    }

                    if (primitive is TmdPolygonLitPrimitive litPrimitive)
                    {
                        FormatLitPrimitive(objBuilder, litPrimitive).AppendLine();
                    }
                    else if (primitive is TmdPolygonUnlitPrimitive unlitPrimitive)
                    {
                        FormatUnlitPrimitive(objBuilder, unlitPrimitive).AppendLine();
                    }
                    else
                    {
                        throw new System.Exception("Can't format primitive of type: " + primitive.GetType());
                    }
                }

                wavefrontObjects.Add(objBuilder.ToString());
            }

            textureMapData = textureMapBuilder.ToString();
            return wavefrontObjects;
        }

        private static string FormatVertex(TmdVertex vertex)
        {
            return $"v {vertex.X} {vertex.Y} {vertex.Z}";
        }

        private static string FormatNormal(TmdNormal normal)
        {
            var x = normal.NX.ToString().Replace(",", ".");
            var y = normal.NY.ToString().Replace(",", ".");
            var z = normal.NZ.ToString().Replace(",", ".");

            return $"vn {x} {y} {z}";
        }

        private static readonly int[] VertexOrderQuad = new[] { 0, 2, 3, 1 };
        private static readonly int[] VertexOrderTriangle = new[] { 0, 2, 1 };

        private static StringBuilder FormatLitPrimitive(StringBuilder builder, TmdPolygonLitPrimitive litPoly)
        {
            builder.Append("f ");

            var vertexOrder = litPoly.Header.IsQuadPrimitive ? VertexOrderQuad : VertexOrderTriangle;

            foreach (var v in vertexOrder)
            {
                builder.Append(litPoly.Vertices[v] + 1).Append("//").Append(litPoly.Normals[v] + 1).Append(" ");
            }

            return builder;
        }

        private static StringBuilder FormatUnlitPrimitive(StringBuilder builder, TmdPolygonUnlitPrimitive unlitPoly)
        {
            builder.Append("f ");

            var vertexOrder = unlitPoly.Header.IsQuadPrimitive ? VertexOrderQuad : VertexOrderTriangle;

            foreach (var v in vertexOrder)
            {
                builder.Append(unlitPoly.Vertices[v] + 1).Append(" ");
            }

            return builder;
        }
    }
}

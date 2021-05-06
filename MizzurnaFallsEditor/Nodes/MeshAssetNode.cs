using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Nodes
{
	[AssetNodeData(typeof(MeshAsset))]
	public class MeshAssetNode : AssetNode<MeshAsset, MeshAsset>
	{
		public MeshAssetNode(MeshAsset asset, MeshAsset sourceAsset) : base(asset, sourceAsset, "MESH")
		{
			AddContextAction("Export to OBJ", () =>
            {
                TmdConverterUtility.SaveAsWavefrontObject(Asset, Asset.TmdAsset);
            });
		}
	}
}

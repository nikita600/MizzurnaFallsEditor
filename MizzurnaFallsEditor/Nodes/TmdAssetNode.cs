using MizzurnaFallsEditor.Assets.MeshAssets;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Nodes
{
	[AssetNodeData(typeof(TmdAsset))]
	public class TmdAssetNode : AssetNode<TmdAsset, TmdAsset>
	{
		public TmdAssetNode(TmdAsset asset, TmdAsset sourceAsset) : base(asset, sourceAsset, "TMD")
		{
			AddContextAction("Export to OBJ", () =>
			{
				TmdConverterUtility.SaveAsWavefrontObject(Asset, Asset);
			});
		}
	}
}

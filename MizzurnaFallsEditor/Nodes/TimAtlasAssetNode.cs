using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
	[AssetNodeData(typeof(TimAtlasAsset))]
	public class TimAtlasAssetNode : AssetNode<TimAtlasAsset, TimAtlasAsset>
	{
		public TimAtlasAssetNode(TimAtlasAsset asset, TimAtlasAsset sourceAsset) : base(asset, sourceAsset, "TIM.ATLAS")
		{
		}
	}
}

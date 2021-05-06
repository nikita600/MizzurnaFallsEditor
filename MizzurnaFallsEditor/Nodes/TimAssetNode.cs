using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(TimAsset))]
    public sealed class TimAssetNode : AssetNode<TimAsset, TimAsset>
    {
        public TimAssetNode(TimAsset asset, TimAsset sourceAsset) : base(asset, sourceAsset, "TIM")
        {
            //Text += string.Concat("_", asset.Bpp.ToString());
            AddContextAction("Load binary asset", OnLoadFileAsset);
        }
    }
}
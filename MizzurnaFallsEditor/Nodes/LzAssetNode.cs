using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(LzAsset))]
    public class LzAssetNode : AssetNode<LzAsset, LzAsset>
    {
        public LzAssetNode(LzAsset asset, LzAsset sourceAsset) : base(asset, sourceAsset, "LZ")
        {
        }
    }
}
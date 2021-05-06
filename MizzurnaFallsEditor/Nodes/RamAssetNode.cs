using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(RamAsset))]
    public class RamAssetNode : AssetNode<RamAsset, RamAsset>
    {
        public RamAssetNode(RamAsset asset, RamAsset sourceAsset) : base(asset, sourceAsset, "RAM")
        {
        }
    }
}
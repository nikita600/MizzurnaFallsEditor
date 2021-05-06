using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(VabAsset))]
    public sealed class VabAssetNode : AssetNode<VabAsset, VabAsset>
    {
        public VabAssetNode(VabAsset asset, VabAsset sourceAsset) : base(asset, sourceAsset, "VAB")
        {
        }
    }
}
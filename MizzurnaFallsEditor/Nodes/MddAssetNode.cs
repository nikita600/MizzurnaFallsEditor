using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(MddAsset))]
    public class MddAssetNode : BaseTextAssetNode<MddAsset, BaseTextAsset>
    {
        public MddAssetNode(MddAsset asset, BaseTextAsset sourceAsset) : base(asset, sourceAsset, "MDD")
        {
        }
    }
}
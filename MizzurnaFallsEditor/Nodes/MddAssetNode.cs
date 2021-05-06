using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(MddAsset))]
    public class MddAssetNode : BaseTextAssetNode<MddAsset, MdtAsset>
    {
        public MddAssetNode(MddAsset asset, MdtAsset sourceAsset) : base(asset, sourceAsset, "MDD")
        {
        }
    }
}
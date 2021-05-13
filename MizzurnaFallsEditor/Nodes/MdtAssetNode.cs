using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(MdtAsset))]
    public sealed class MdtAssetNode : BaseTextAssetNode<MdtAsset, BaseTextAsset>
    {
        public MdtAssetNode(MdtAsset asset, BaseTextAsset sourceAsset) : base(asset, sourceAsset, "MDT")
        {
        }
    }
}
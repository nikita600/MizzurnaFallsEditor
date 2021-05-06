using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(MdtAsset))]
    public sealed class MdtAssetNode : BaseTextAssetNode<MdtAsset, MdtAsset>
    {
        public MdtAssetNode(MdtAsset asset, MdtAsset sourceAsset) : base(asset, sourceAsset, "MDT")
        {
        }
    }
}
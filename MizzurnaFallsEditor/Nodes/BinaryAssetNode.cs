using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(BinaryAsset))]
    public sealed class BinaryAssetNode : AssetNode<BinaryAsset, BinaryAsset>
    {
        public BinaryAssetNode(BinaryAsset asset, BinaryAsset sourceAsset) : base(asset, sourceAsset, "BIN")
        {
            AddContextAction("Load binary asset", OnLoadFileAsset);
        }
    }
}
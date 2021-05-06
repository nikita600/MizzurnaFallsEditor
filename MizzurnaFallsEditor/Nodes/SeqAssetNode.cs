using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(SeqAsset))]
    public sealed class SeqAssetNode : AssetNode<SeqAsset, SeqAsset>
    {
        public SeqAssetNode(SeqAsset asset, SeqAsset sourceAsset) : base(asset, sourceAsset, "SEQ")
        {
        }
    }
}
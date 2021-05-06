using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(LevelAssetArchive))]
    public sealed class LevelAssetArchiveNode : AssetNode<LevelAssetArchive, LevelAssetArchive>
    {
        public LevelAssetArchiveNode(LevelAssetArchive asset, LevelAssetArchive sourceAsset) : base(asset, sourceAsset, "LVL")
        {
        }
    }
}
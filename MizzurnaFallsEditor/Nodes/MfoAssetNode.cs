using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Nodes
{
    [AssetNodeData(typeof(MfoAsset))]
    public sealed class MfoAssetNode : AssetNode<MfoAsset, MfoAsset>
    {
        public MfoAssetNode(MfoAsset asset, MfoAsset sourceAsset) : base(asset, sourceAsset, "MFO")
        {
			AddContextAction("Load binary asset", OnLoadFileAsset);
		}
    }
}
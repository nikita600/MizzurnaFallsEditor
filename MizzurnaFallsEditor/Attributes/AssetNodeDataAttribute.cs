using System;

namespace MizzurnaFallsEditor.Attributes
{
    public sealed class AssetNodeDataAttribute : Attribute
    {
        public readonly Type AssetType;

        public AssetNodeDataAttribute(Type assetType)
        {
            AssetType = assetType;
        }
    }
}
using System;
using System.Collections.Generic;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Attributes;
using MizzurnaFallsEditor.Nodes;

namespace MizzurnaFallsEditor.Utilities
{
    public static class NodeUtility
    {
        #region Fields

        // AssetType, NodeType
        private static readonly Dictionary<Type, Type> NodeTypes = new Dictionary<Type, Type>();

        #endregion

        #region Constructor

        static NodeUtility()
        {
            var entries = ReflectionUtility.GetTypesWithAttribute<AssetNodeDataAttribute>();
            foreach (var entry in entries)
            {
                var assetType = entry.Key.AssetType;
                var nodeType = entry.Value;
				
                if (!NodeTypes.ContainsKey(assetType))
                {
                    NodeTypes.Add(assetType, nodeType);
                }
                else
                {
                    throw new Exception("Asset type already registered: " + assetType);
                }
            }
        }

        #endregion
        
        #region Public
        
        public static AssetNode CreateAssetNode(Asset asset, Asset sourceAsset)
        {
            var assetType = asset.GetType();
            if (!NodeTypes.TryGetValue(assetType, out var nodeType))
            {
                throw new Exception("Can't create AssetNode for type: " + assetType);
            }
            
            return Activator.CreateInstance(nodeType, asset, sourceAsset) as AssetNode;
        }
        
        #endregion
    }
}
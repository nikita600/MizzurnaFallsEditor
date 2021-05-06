using System;
using System.IO;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Nodes
{
    public abstract class AssetNode : TreeNode
    {
        #region Fields
        
        public readonly Asset BaseAsset;
        public readonly Asset SourceBaseAsset;

        #endregion

        #region Protected
        
        protected AssetNode(Asset asset, Asset sourceBaseAsset)
        {
            BaseAsset = asset;
            SourceBaseAsset = sourceBaseAsset;
        }
        
        #endregion
    }
    
    public abstract class AssetNode<T, U> : AssetNode where T : Asset where U : Asset
    {
        #region Fields
        
        public readonly T Asset;
        public readonly U SourceAsset;

        protected readonly string Extension;
        
        #endregion

        #region Protected
        
        protected AssetNode(T asset, U sourceAsset, string extension) : base(asset, sourceAsset)
        {
            Asset = asset;
            SourceAsset = sourceAsset;
            Extension = extension;

            Text = GetPreviewName(asset, extension);

            CreateContextMenu();
            AddContextAction("Save asset bytes", () => SaveAssetBytes(Asset, Extension));
            AddContextAction("Save original asset bytes", () => SaveAssetBytes(SourceAsset, Extension));

            for (int i = 0, l = asset.ChildAssets.Count; i < l; ++i)
            {
                var childNode = NodeUtility.CreateAssetNode(asset.ChildAssets[i], sourceAsset.ChildAssets[i]);
                Nodes.Add(childNode);
            }
        }

        protected void AddContextAction(string actionName, Action action)
        {
            ContextMenu.MenuItems.Add(actionName, (sender, args) => action?.Invoke());
        }

		protected void OnLoadFileAsset()
		{
			using (var openFileDialog = new OpenFileDialog())
			{
				openFileDialog.FileName = Asset.Name;
				openFileDialog.Filter = string.Concat("|*.", Extension);
				openFileDialog.InitialDirectory = "/../";
				openFileDialog.Title = $"Load {Asset.Name} file...";

				if (openFileDialog.ShowDialog() == DialogResult.OK)
				{
					Asset.Deserialize(File.ReadAllBytes(openFileDialog.FileName));
				}
			}
		}

		#endregion

		#region Private

        private string GetPreviewName(Asset asset, string extension)
		{
            var name = asset.IsEmpty ? "EMPTY" : string.IsNullOrEmpty(asset.Name) ? "UNKNOWN" : asset.Name;

            return string.Concat(name, ".", extension);
        }

		private void CreateContextMenu()
        {
            ContextMenu = new ContextMenu();
        }

        private static void SaveAssetBytes(Asset asset, string extension)
		{
            using (var saveFileDialog = new SaveFileDialog())
            {
                saveFileDialog.FileName = asset.Name;
                saveFileDialog.Filter = string.Concat("|*.", extension);
                saveFileDialog.InitialDirectory = "/../";
                saveFileDialog.Title = $"Save {asset.Name} file...";

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    File.WriteAllBytes(saveFileDialog.FileName, asset.Serialize());
                }
            }
        }

        #endregion
    }
}
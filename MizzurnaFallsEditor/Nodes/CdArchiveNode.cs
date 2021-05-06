using System.Collections.Generic;
using System.Windows.Forms;
using MizzurnaFallsEditor.Assets;
using MizzurnaFallsEditor.Utilities;

namespace MizzurnaFallsEditor.Nodes
{
    public sealed class CdArchiveNode : TreeNode
    {
        #region Constants

        private const string NodeName = "CD.BIN";

        private readonly List<KeyValuePair<string, int>> _folderStructureData = 
            new List<KeyValuePair<string, int>>()
        {
            new KeyValuePair<string, int>("Common Assets", 173),
            new KeyValuePair<string, int>("Map Assets", 175),
			new KeyValuePair<string, int>("Photos (Merged)", 187),
            new KeyValuePair<string, int>("Photos (Splitted)", 213),
            new KeyValuePair<string, int>("Text Assets (Talks)", 270),
            new KeyValuePair<string, int>("Text Assets (Phone Calls)", 291),
            new KeyValuePair<string, int>("Audio", 317),
            new KeyValuePair<string, int>("Notebook Text", 319),
            new KeyValuePair<string, int>("Character Atlases", 325),
            new KeyValuePair<string, int>("Character Icons", 366),
            new KeyValuePair<string, int>("Meshes", 565)
        };

		private readonly Dictionary<int, string> LevelFolderNames = new Dictionary<int, string>()
		{
			{ 0, "Police Station" },
			{ 1, "Matthew Room 01" },
			{ 2, "Hospital 01" },
			{ 3, "Emma House 01" },
			{ 4, "James House 01" },
			{ 5, "Warehouse" },
			{ 6, "Mel Room" },
			{ 7, "Cemetery" },
			{ 8, "Junkyard" },
			{ 9, "Boathouse" },
			{ 10, "Little Cabin" },
			{ 11, "Motel" },
			{ 12, "Bar Wolves" },
			{ 13, "Park" },
			{ 14, "Matthew Room 02" },
			{ 15, "Matthew Room 03" },
			{ 16, "High School" },
			{ 17, "High School Main" },
			{ 18, "Gas Station" },
			{ 19, "Apartment Building 01" },
			{ 20, "Matthew Room 04" },
			{ 21, "Dinner" },
			{ 22, "Matthew Room 05" },
			{ 23, "Cohen Lodge" },
			{ 24, "Church" },
			{ 25, "Matthew Room 06" },
			{ 26, "Forest" },
			{ 27, "Outside" },
			{ 28, "Farm Workers Lodge" },
			{ 29, "Hospital 02" },
			{ 30, "Hospital 03" },
			{ 31, "Apartment Building 02" },
			{ 32, "Apartment Building 03" },
			{ 33, "Common" },
		};
        
        #endregion
        
        #region Public

        public CdArchiveNode(CdArchive cdArchive, CdArchive sourceCdArchive)
        {
            Text = NodeName;

            var lastProcessedIndex = 0;
            var assets = new List<Asset>(cdArchive);
            var sourceAssets = new List<Asset>(sourceCdArchive);

            BuildLevelsNode(assets, sourceAssets, ref lastProcessedIndex);

            foreach (var pair in _folderStructureData)
            {
                BuildFolderNode(assets, sourceAssets, pair.Key, pair.Value, ref lastProcessedIndex);
            }

            for (var i = lastProcessedIndex; i < assets.Count; ++i)
            {
                Nodes.Add(NodeUtility.CreateAssetNode(assets[i], sourceAssets[i]));
            }
            
            Expand();
        }

        #endregion

        #region Private

        private void BuildLevelsNode(IReadOnlyList<Asset> assets, IReadOnlyList<Asset> sourceAssets, ref int lastProcessedIndex)
        {
            var parentNode = new TreeNode("Levels");
			//parentNode.Expand();
            
            var levelIndex = 0;
            for (int i = 0, l = 170; i < l; i += 5)
            {
                var codeAssetNode = NodeUtility.CreateAssetNode(assets[i], sourceAssets[i]);
                var sfxHeaderAssetNode = NodeUtility.CreateAssetNode(assets[i + 1], sourceAssets[i + 1]);
                var sfxBodyAssetNode = NodeUtility.CreateAssetNode(assets[i + 2], sourceAssets[i + 2]);
                var gfxAssetNode = NodeUtility.CreateAssetNode(assets[i + 3], sourceAssets[i + 3]);
                var assetsNode = NodeUtility.CreateAssetNode(assets[i + 4], sourceAssets[i + 4]);

                var levelName = LevelFolderNames.TryGetValue(levelIndex, out var name) ? name : "Level_" + levelIndex.ToString("D2");
                var levelNode = new TreeNode(levelName);

                parentNode.Nodes.Add(levelNode);

                var levelNodes = levelNode.Nodes;
                levelNodes.Add(new TreeNode("OVL", new[] { codeAssetNode }));
                levelNodes.Add(new TreeNode("SFX", new[] { sfxHeaderAssetNode, sfxBodyAssetNode }));
                levelNodes.Add(new TreeNode("GFX", new[] { gfxAssetNode }));
				levelNodes.Add(assetsNode);

                levelIndex++;
            }

            lastProcessedIndex = 170;
            
            Nodes.Add(parentNode);
        }

        private void BuildFolderNode(IReadOnlyList<Asset> assets, IReadOnlyList<Asset> sourceAssets, string nodeName,
            int lastFileIndex, ref int lastProcessedIndex, bool expanded = false)
        {
            var node = new TreeNode(nodeName);
            for (var i = lastProcessedIndex; i < lastFileIndex; ++i)
            {
                node.Nodes.Add(NodeUtility.CreateAssetNode(assets[i], sourceAssets[i]));
            }

            lastProcessedIndex = lastFileIndex;

            if (expanded)
            {
                node.Expand();
            }
            
            Nodes.Add(node);
        }
        
        #endregion
    }
}
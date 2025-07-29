using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using MizzurnaFallsEditor.Nodes;

namespace MizzurnaFallsEditor
{
	using Assets;

    public partial class EditorForm : Form
    {
	    #region Constants

	    private const string CafeMdtNodeName = "0169_06.MDT";
	    private const string CafeMddNodeName = "0169_06.MDD";

		private const string BasePath = "..\\Resources\\";

	    #endregion
	    
	    #region Fields

		private CdArchive _cdArchive = null;
		private CdArchive _sourceCdArchive = null;
		private EncodingTable _cafeTable = null;
		private EncodingTable _defaultTable = null;
		private EncodingTable _pixelTable = null;
		private EncodingTable _sourceTable = null;

		private MdtAssetNode _mdtAssetNode;
		private MddAssetNode _mddAssetNode;
		
		#endregion
		#region Constructor

		public EditorForm()
        {
            InitializeComponent();
            
            _openExeFileDialog.InitialDirectory = Application.StartupPath;
            _openCDFileDialog.InitialDirectory = Application.StartupPath;

            //CompareCdFiles();
            
            // DEBUG
            LoadCd(BasePath + "SLPS017.83", BasePath + "CD.BIN", BasePath + "src_SLPS017.83", BasePath + "src_CD.BIN");
            LoadTables(BasePath + "ShiftJis.tbl", BasePath + "Cafe.tbl", BasePath + "PixelFonts.tbl", BasePath + "src_ShiftJis.tbl");
        }

        #endregion
        #region Methods
        
        private void LoadCd(string exePath, string cdPath, string sourceExePath, string sourceCdPath)
        {
	        _cdArchive = LoadCdArchive(exePath, cdPath);
	        _sourceCdArchive = LoadCdArchive(sourceExePath, sourceCdPath);
	        
	        _fileHierarchyView.Nodes.Clear();
            _fileHierarchyView.Nodes.Add(new CdArchiveNode(_cdArchive, _sourceCdArchive));

            _currentFilePathStatusLabel.Text = cdPath;
        }

        private CdArchive LoadCdArchive(string exePath, string cdPath)
        {
	        if (!File.Exists(exePath) || !File.Exists(cdPath))
	        {
		        throw new Exception($"Can't find {exePath} or {cdPath} file.");
	        }
	        
	        var exeBytes = File.ReadAllBytes(exePath);
	        var archiveBytes = File.ReadAllBytes(cdPath);

	        var cdArchive = new CdArchive();
	        cdArchive.Load(exeBytes, archiveBytes);

	        return cdArchive;
        }
        
        private void LoadTables(string defaultTablePath, string cafeTablePath, string pixelTablePath, string sourceTablePath)
        {
	        if (!File.Exists(defaultTablePath) || !File.Exists(cafeTablePath))
	        {
		        throw new Exception("Character tables ShiftJis.tbl or Cafe.tbl not found");
	        }
	        
	        _cafeTable = new EncodingTable(cafeTablePath, File.ReadAllBytes(cafeTablePath));
	        _defaultTable = new EncodingTable(defaultTablePath, File.ReadAllBytes(defaultTablePath));
	        _pixelTable = new EncodingTable(pixelTablePath, File.ReadAllBytes(pixelTablePath));
	        _sourceTable = new EncodingTable(sourceTablePath, File.ReadAllBytes(sourceTablePath));
        }
        
        private static void CompareCdFiles()
        {
	        var srcExeBytes = File.ReadAllBytes("SLPS017.83");
	        var srcArchiveBytes = File.ReadAllBytes("CD.BIN");

	        var dstExeBytes = File.ReadAllBytes("SLPS017.83_.83");
	        var dstArchiveBytes = File.ReadAllBytes("CD.BIN_.BIN");
	        
	        var srcCd = new CdArchive();
	        srcCd.Load(srcExeBytes, srcArchiveBytes);
	        
	        var destCd = new CdArchive();
	        destCd.Load(dstExeBytes, dstArchiveBytes);

	        var srcAssets = new List<Asset>(srcCd);
	        var dstAssets = new List<Asset>(destCd);

	        for (var i = 0; i < srcAssets.Count; ++i)
	        {
		        var srcAsset = srcAssets[i];
		        var dstAsset = dstAssets[i];

		        var srcBytes = srcAsset.Bytes;
		        var dstBytes = dstAsset.Bytes;

		        if (srcBytes.Length == dstBytes.Length)
		        {
			        if (srcBytes.Where((t, j) => t != dstBytes[j]).Any())
			        {
				        Console.WriteLine("Fail at: " + i);
			        }
		        }
		        else
		        {
			        Console.WriteLine("Fail at: " + i);
		        }
	        }
        }

        private void UpdateMdtTextEditor()
        {
	        if (_mdtAssetNode == null)
	        {
		        return;
	        }
	        
	        var encodingTable = _mdtAssetNode.Text.Equals(CafeMdtNodeName) ||
	                            _mdtAssetNode.Text.Equals(CafeMddNodeName) ? _cafeTable : _defaultTable;

			_mdtTextViewer.Setup(_cdArchive);

			_mdtTextViewer.Show();
	        _mdtTextViewer.SetTextAsset(_mdtAssetNode.Asset, _mdtAssetNode.SourceAsset, encodingTable, _pixelTable, _sourceTable);
        }

        private void UpdateMddTextEditor()
        {
	        if (_mddAssetNode == null)
	        {
		        return;
	        }
			
	        var encodingTable = _mddAssetNode.Text.Equals(CafeMdtNodeName) ||
	                            _mddAssetNode.Text.Equals(CafeMddNodeName) ? _cafeTable : _defaultTable;

			_mdtTextViewer.Setup(_cdArchive);

			_mdtTextViewer.Show();
	        _mdtTextViewer.SetTextAsset(_mddAssetNode.Asset, _mddAssetNode.SourceAsset, encodingTable, _pixelTable, _sourceTable);
        }
        
        #endregion
		#region Event Handlers

		private void OpenMainArchiveButtonClick(object sender, EventArgs e)
		{
			var openExeResult = _openExeFileDialog.ShowDialog();
			if (openExeResult != DialogResult.OK)
			{
				return;
			}
			
			var openCdResult = _openCDFileDialog.ShowDialog();
			if (openCdResult == DialogResult.OK)
			{
				LoadCd(_openExeFileDialog.FileName, _openCDFileDialog.FileName, "src_SLPS017.83", "src_CD.BIN");
			}
		}
		
		private void SaveMainArchiveButtonClick(object sender, EventArgs e)
		{
			if (_cdArchive == null)
			{
				return;
			}
			
			var saveExeResult = _saveExeFileDialog.ShowDialog();
			if (saveExeResult != DialogResult.OK)
			{
				return;
			}

			var saveCdResult = _saveCdBinFileDialog.ShowDialog();
			if (saveCdResult != DialogResult.OK)
			{
				return;
			}

			_cdArchive.Save(out var exeBytes, out var archiveBytes);
			
			File.WriteAllBytes(_saveExeFileDialog.FileName, exeBytes);
			File.WriteAllBytes(_saveCdBinFileDialog.FileName, archiveBytes);
		}

		private void ConvertAllMdtToMddButton_Click(object sender, EventArgs e)
		{
			MdtAsset.SetActiveMddSerializeMode(true);
			SaveMainArchiveButtonClick(sender, e);
			MdtAsset.SetActiveMddSerializeMode(false);
		}
		
		private void FileHierarchyView_AfterSelect(object sender, TreeViewEventArgs e)
        {
	        if (_mdtAssetNode != null)
	        {
		        _mdtAssetNode.Changed -= UpdateMdtTextEditor;
	        }
	        
	        if (_mddAssetNode != null)
	        {
		        _mddAssetNode.Changed -= UpdateMddTextEditor;
	        }
	        
            var node = e.Node;

			_timViewer.Hide();
			_mfoEditor.Hide();
            _mdtTextViewer.Hide();
			_timAtlasViewer.Hide();
			_defaultAssetView.Hide();

            if (!(node is AssetNode assetNode))
            {
	            return;
            }

            switch (assetNode)
            {
	            case MdtAssetNode mdtAssetNode:
	            {
		            _mdtAssetNode = mdtAssetNode;
		            UpdateMdtTextEditor();
		            
		            if (_mdtAssetNode != null)
		            {
			            _mdtAssetNode.Changed += UpdateMdtTextEditor;
		            }
		            
		            break;
	            }

	            case MddAssetNode mddAssetNode:
	            {
		            _mddAssetNode = mddAssetNode;
		            UpdateMddTextEditor();

		            if (_mddAssetNode != null)
		            {
			            _mddAssetNode.Changed += UpdateMddTextEditor;
		            }
		            
		            break;
	            }

				case MfoAssetNode mfoAssetNode:
				{
					_mfoEditor.Show(mfoAssetNode, _defaultTable, _cafeTable);
					break;
				}

				case TimAssetNode timAssetNode:
				{
					_timViewer.SetTimAsset(timAssetNode.Asset);
					break;
				}

				case TimAtlasAssetNode timAtlasAssetNode:
				{
					_timAtlasViewer.SetTimAtlas(timAtlasAssetNode.Asset);
					break;
				}

	            default:
		            _defaultAssetView.Show();
		            _defaultAssetView.SetBytes(assetNode.BaseAsset.Bytes, assetNode.SourceBaseAsset.Bytes);
		            break;
            }
        }

		private void CreateMfo_Click(object sender, EventArgs e)
		{
			var saveMfoDialog = new SaveFileDialog();
			saveMfoDialog.Filter = "(*.MFO_CHAR)|*.MFO_CHAR";
			if (saveMfoDialog.ShowDialog() != DialogResult.OK)
			{
				return;
			}

			const int charCount = 0x62;
			const byte charWidth = 0x08;
			const byte charHeight = 0x10;

			using (var memoryStream = new MemoryStream())
			{
				using (var binaryWriter = new BinaryWriter(memoryStream))
				{
					var charSize = (charWidth * charHeight) / 2;
					for (int i = 0; i < charCount; ++i)
					{
						binaryWriter.Write(charSize * i);
						binaryWriter.Write((byte)0);
						binaryWriter.Write(charWidth);
						binaryWriter.Write(charHeight);
						binaryWriter.Write((byte)0x02);
					}
				}

				File.WriteAllBytes(saveMfoDialog.FileName, memoryStream.ToArray());
			}
		}

		#endregion
    }
}

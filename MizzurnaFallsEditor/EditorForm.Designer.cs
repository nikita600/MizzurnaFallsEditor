namespace MizzurnaFallsEditor
{
    partial class EditorForm
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EditorForm));
			this._fileHierarchyView = new System.Windows.Forms.TreeView();
			this.m_CurrentStatusStrip = new System.Windows.Forms.StatusStrip();
			this.m_CurrentFileStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
			this._currentFilePathStatusLabel = new System.Windows.Forms.ToolStripStatusLabel();
			this._openExeFileDialog = new System.Windows.Forms.OpenFileDialog();
			this._openCDFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.topToolStrip = new System.Windows.Forms.ToolStrip();
			this.openMainArchiveButton = new System.Windows.Forms.ToolStripButton();
			this.saveMainArchiveButton = new System.Windows.Forms.ToolStripButton();
			this._saveExeFileDialog = new System.Windows.Forms.SaveFileDialog();
			this._saveCdBinFileDialog = new System.Windows.Forms.SaveFileDialog();
			this._timViewer = new MizzurnaFallsEditor.ViewControls.TimViewer();
			this._mfoEditor = new MizzurnaFallsEditor.ViewControls.MfoEditor();
			this._mdtTextViewer = new MizzurnaFallsEditor.ViewControls.MdtTextEditor();
			this._defaultAssetView = new MizzurnaFallsEditor.ViewControls.RawAssetControl();
			this._timAtlasViewer = new MizzurnaFallsEditor.ViewControls.TimAtlasViewer();
			this.m_CurrentStatusStrip.SuspendLayout();
			this.topToolStrip.SuspendLayout();
			this.SuspendLayout();
			// 
			// _fileHierarchyView
			// 
			this._fileHierarchyView.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
			this._fileHierarchyView.HideSelection = false;
			this._fileHierarchyView.Location = new System.Drawing.Point(0, 28);
			this._fileHierarchyView.Name = "_fileHierarchyView";
			this._fileHierarchyView.Size = new System.Drawing.Size(234, 640);
			this._fileHierarchyView.TabIndex = 1;
			this._fileHierarchyView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.FileHierarchyView_AfterSelect);
			// 
			// m_CurrentStatusStrip
			// 
			this.m_CurrentStatusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.m_CurrentFileStatusLabel,
            this._currentFilePathStatusLabel});
			this.m_CurrentStatusStrip.Location = new System.Drawing.Point(0, 671);
			this.m_CurrentStatusStrip.Name = "m_CurrentStatusStrip";
			this.m_CurrentStatusStrip.Size = new System.Drawing.Size(892, 22);
			this.m_CurrentStatusStrip.TabIndex = 2;
			this.m_CurrentStatusStrip.Text = "statusStrip1";
			// 
			// m_CurrentFileStatusLabel
			// 
			this.m_CurrentFileStatusLabel.Name = "m_CurrentFileStatusLabel";
			this.m_CurrentFileStatusLabel.Size = new System.Drawing.Size(70, 17);
			this.m_CurrentFileStatusLabel.Text = "Current File: ";
			// 
			// _currentFilePathStatusLabel
			// 
			this._currentFilePathStatusLabel.Name = "_currentFilePathStatusLabel";
			this._currentFilePathStatusLabel.Size = new System.Drawing.Size(0, 17);
			// 
			// _openExeFileDialog
			// 
			this._openExeFileDialog.FileName = "SLPS017.83";
			this._openExeFileDialog.Filter = "|*.83";
			this._openExeFileDialog.InitialDirectory = "/../";
			this._openExeFileDialog.Title = "Select SLPS017.83 file...";
			// 
			// _openCDFileDialog
			// 
			this._openCDFileDialog.FileName = "CD.BIN";
			this._openCDFileDialog.Filter = "|*.BIN";
			this._openCDFileDialog.Title = "Select CD.BIN file...";
			// 
			// topToolStrip
			// 
			this.topToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openMainArchiveButton,
            this.saveMainArchiveButton});
			this.topToolStrip.Location = new System.Drawing.Point(0, 0);
			this.topToolStrip.Name = "topToolStrip";
			this.topToolStrip.RenderMode = System.Windows.Forms.ToolStripRenderMode.System;
			this.topToolStrip.Size = new System.Drawing.Size(892, 25);
			this.topToolStrip.TabIndex = 5;
			this.topToolStrip.Text = "toolStrip1";
			// 
			// openMainArchiveButton
			// 
			this.openMainArchiveButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.openMainArchiveButton.Image = ((System.Drawing.Image)(resources.GetObject("openMainArchiveButton.Image")));
			this.openMainArchiveButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.openMainArchiveButton.Name = "openMainArchiveButton";
			this.openMainArchiveButton.Size = new System.Drawing.Size(23, 22);
			this.openMainArchiveButton.Text = "Open CD.BIN Archive";
			this.openMainArchiveButton.Click += new System.EventHandler(this.OpenMainArchiveButtonClick);
			// 
			// saveMainArchiveButton
			// 
			this.saveMainArchiveButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.saveMainArchiveButton.Image = ((System.Drawing.Image)(resources.GetObject("saveMainArchiveButton.Image")));
			this.saveMainArchiveButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this.saveMainArchiveButton.Name = "saveMainArchiveButton";
			this.saveMainArchiveButton.Size = new System.Drawing.Size(23, 22);
			this.saveMainArchiveButton.Text = "Save CD.BIN Archive";
			this.saveMainArchiveButton.Click += new System.EventHandler(this.SaveMainArchiveButtonClick);
			// 
			// _saveExeFileDialog
			// 
			this._saveExeFileDialog.FileName = "SLPS017.83";
			this._saveExeFileDialog.Filter = "|*.83";
			this._saveExeFileDialog.InitialDirectory = "/../";
			this._saveExeFileDialog.Title = "Save SLPS017.83 file...";
			// 
			// _saveCdBinFileDialog
			// 
			this._saveCdBinFileDialog.FileName = "CD.BIN";
			this._saveCdBinFileDialog.Filter = "|*.BIN";
			this._saveCdBinFileDialog.Title = "Save CD.BIN file...";
			// 
			// _timViewer
			// 
			this._timViewer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._timViewer.Location = new System.Drawing.Point(240, 28);
			this._timViewer.Name = "_timViewer";
			this._timViewer.Size = new System.Drawing.Size(652, 640);
			this._timViewer.TabIndex = 7;
			// 
			// _mfoEditor
			// 
			this._mfoEditor.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._mfoEditor.BackColor = System.Drawing.SystemColors.Control;
			this._mfoEditor.Location = new System.Drawing.Point(240, 28);
			this._mfoEditor.Name = "_mfoEditor";
			this._mfoEditor.Size = new System.Drawing.Size(652, 640);
			this._mfoEditor.TabIndex = 6;
			// 
			// _mdtTextViewer
			// 
			this._mdtTextViewer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._mdtTextViewer.Location = new System.Drawing.Point(240, 28);
			this._mdtTextViewer.Name = "_mdtTextViewer";
			this._mdtTextViewer.Size = new System.Drawing.Size(652, 640);
			this._mdtTextViewer.TabIndex = 4;
			// 
			// _defaultAssetView
			// 
			this._defaultAssetView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._defaultAssetView.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
			this._defaultAssetView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this._defaultAssetView.Location = new System.Drawing.Point(240, 28);
			this._defaultAssetView.Name = "_defaultAssetView";
			this._defaultAssetView.Size = new System.Drawing.Size(652, 640);
			this._defaultAssetView.TabIndex = 3;
			// 
			// _timAtlasViewer
			// 
			this._timAtlasViewer.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._timAtlasViewer.Location = new System.Drawing.Point(240, 28);
			this._timAtlasViewer.Name = "_timAtlasViewer";
			this._timAtlasViewer.Size = new System.Drawing.Size(652, 640);
			this._timAtlasViewer.TabIndex = 8;
			// 
			// EditorForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(892, 693);
			this.Controls.Add(this._timAtlasViewer);
			this.Controls.Add(this._timViewer);
			this.Controls.Add(this._mfoEditor);
			this.Controls.Add(this.topToolStrip);
			this.Controls.Add(this.m_CurrentStatusStrip);
			this.Controls.Add(this._fileHierarchyView);
			this.Controls.Add(this._mdtTextViewer);
			this.Controls.Add(this._defaultAssetView);
			this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
			this.Name = "EditorForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Mizzurna Falls Editor [PSX] by nikita600";
			this.m_CurrentStatusStrip.ResumeLayout(false);
			this.m_CurrentStatusStrip.PerformLayout();
			this.topToolStrip.ResumeLayout(false);
			this.topToolStrip.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip m_CurrentStatusStrip;
        private System.Windows.Forms.ToolStripStatusLabel m_CurrentFileStatusLabel;
        private System.Windows.Forms.TreeView _fileHierarchyView;
        private System.Windows.Forms.ToolStripStatusLabel _currentFilePathStatusLabel;
        private System.Windows.Forms.OpenFileDialog _openExeFileDialog;
        private System.Windows.Forms.OpenFileDialog _openCDFileDialog;
        private MizzurnaFallsEditor.ViewControls.RawAssetControl _defaultAssetView;
        private MizzurnaFallsEditor.ViewControls.MdtTextEditor _mdtTextViewer;
        private System.Windows.Forms.ToolStrip topToolStrip;
        private System.Windows.Forms.ToolStripButton openMainArchiveButton;
        private System.Windows.Forms.SaveFileDialog _saveExeFileDialog;
        private System.Windows.Forms.SaveFileDialog _saveCdBinFileDialog;
        private System.Windows.Forms.ToolStripButton saveMainArchiveButton;
		private ViewControls.MfoEditor _mfoEditor;
		private ViewControls.TimViewer _timViewer;
		private ViewControls.TimAtlasViewer _timAtlasViewer;
	}
}


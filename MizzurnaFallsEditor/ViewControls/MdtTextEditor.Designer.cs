namespace MizzurnaFallsEditor.ViewControls
{
    partial class MdtTextEditor
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

        #region Код, автоматически созданный конструктором компонентов

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MdtTextEditor));
			this._stringsListView = new System.Windows.Forms.ListView();
			this.textColumn = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
			this._stringTextBox = new System.Windows.Forms.TextBox();
			this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
			this.m_TopToolStrip = new System.Windows.Forms.ToolStrip();
			this._textInfoLabel = new System.Windows.Forms.ToolStripLabel();
			this._formatAllTextButton = new System.Windows.Forms.ToolStripButton();
			this._sourceTextBox = new System.Windows.Forms.TextBox();
			this._textViewer = new MizzurnaFallsEditor.ViewControls.TextViewer();
			this._formatCurrentEntryButton = new System.Windows.Forms.ToolStripButton();
			this.m_TopToolStrip.SuspendLayout();
			this.SuspendLayout();
			// 
			// _stringsListView
			// 
			this._stringsListView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._stringsListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.textColumn});
			this._stringsListView.HideSelection = false;
			this._stringsListView.LabelWrap = false;
			this._stringsListView.Location = new System.Drawing.Point(3, 28);
			this._stringsListView.MultiSelect = false;
			this._stringsListView.Name = "_stringsListView";
			this._stringsListView.Size = new System.Drawing.Size(643, 191);
			this._stringsListView.TabIndex = 0;
			this._stringsListView.UseCompatibleStateImageBehavior = false;
			this._stringsListView.View = System.Windows.Forms.View.Details;
			this._stringsListView.ItemSelectionChanged += new System.Windows.Forms.ListViewItemSelectionChangedEventHandler(this.OnStringsListView_ItemSelectionChanged);
			// 
			// textColumn
			// 
			this.textColumn.Text = "Text";
			// 
			// _stringTextBox
			// 
			this._stringTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._stringTextBox.Font = new System.Drawing.Font("Arial", 16F);
			this._stringTextBox.Location = new System.Drawing.Point(3, 311);
			this._stringTextBox.Multiline = true;
			this._stringTextBox.Name = "_stringTextBox";
			this._stringTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
			this._stringTextBox.Size = new System.Drawing.Size(643, 80);
			this._stringTextBox.TabIndex = 1;
			this._stringTextBox.TextChanged += new System.EventHandler(this.OnStringTextBox_TextChanged);
			// 
			// contextMenuStrip1
			// 
			this.contextMenuStrip1.Name = "contextMenuStrip1";
			this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
			// 
			// m_TopToolStrip
			// 
			this.m_TopToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this._textInfoLabel,
            this._formatCurrentEntryButton,
            this._formatAllTextButton});
			this.m_TopToolStrip.Location = new System.Drawing.Point(0, 0);
			this.m_TopToolStrip.Name = "m_TopToolStrip";
			this.m_TopToolStrip.Size = new System.Drawing.Size(649, 25);
			this.m_TopToolStrip.TabIndex = 2;
			this.m_TopToolStrip.Text = "toolStrip1";
			// 
			// _textInfoLabel
			// 
			this._textInfoLabel.Name = "_textInfoLabel";
			this._textInfoLabel.Size = new System.Drawing.Size(17, 22);
			this._textInfoLabel.Text = "-1";
			// 
			// _formatAllTextButton
			// 
			this._formatAllTextButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
			this._formatAllTextButton.Image = ((System.Drawing.Image)(resources.GetObject("_formatAllTextButton.Image")));
			this._formatAllTextButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this._formatAllTextButton.Name = "_formatAllTextButton";
			this._formatAllTextButton.Size = new System.Drawing.Size(84, 22);
			this._formatAllTextButton.Text = "Format All Text";
			this._formatAllTextButton.Click += new System.EventHandler(this._formatAllTextButton_Click);
			// 
			// _sourceTextBox
			// 
			this._sourceTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._sourceTextBox.Font = new System.Drawing.Font("Arial", 16F);
			this._sourceTextBox.Location = new System.Drawing.Point(3, 225);
			this._sourceTextBox.Multiline = true;
			this._sourceTextBox.Name = "_sourceTextBox";
			this._sourceTextBox.ReadOnly = true;
			this._sourceTextBox.Size = new System.Drawing.Size(643, 80);
			this._sourceTextBox.TabIndex = 4;
			// 
			// _textViewer
			// 
			this._textViewer.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this._textViewer.Location = new System.Drawing.Point(3, 397);
			this._textViewer.Name = "_textViewer";
			this._textViewer.Size = new System.Drawing.Size(643, 110);
			this._textViewer.TabIndex = 5;
			// 
			// _formatCurrentEntryButton
			// 
			this._formatCurrentEntryButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
			this._formatCurrentEntryButton.Image = ((System.Drawing.Image)(resources.GetObject("_formatCurrentEntryButton.Image")));
			this._formatCurrentEntryButton.ImageTransparentColor = System.Drawing.Color.Magenta;
			this._formatCurrentEntryButton.Name = "_formatCurrentEntryButton";
			this._formatCurrentEntryButton.Size = new System.Drawing.Size(110, 22);
			this._formatCurrentEntryButton.Text = "Format Current Text";
			this._formatCurrentEntryButton.Click += new System.EventHandler(this._formatCurrentEntryButton_Click);
			// 
			// MdtTextEditor
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this._textViewer);
			this.Controls.Add(this._sourceTextBox);
			this.Controls.Add(this.m_TopToolStrip);
			this.Controls.Add(this._stringTextBox);
			this.Controls.Add(this._stringsListView);
			this.Name = "MdtTextEditor";
			this.Size = new System.Drawing.Size(649, 510);
			this.m_TopToolStrip.ResumeLayout(false);
			this.m_TopToolStrip.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListView _stringsListView;
        private System.Windows.Forms.TextBox _stringTextBox;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ColumnHeader textColumn;
        private System.Windows.Forms.ToolStrip m_TopToolStrip;
        private System.Windows.Forms.ToolStripLabel _textInfoLabel;
        private System.Windows.Forms.TextBox _sourceTextBox;
		private TextViewer _textViewer;
		private System.Windows.Forms.ToolStripButton _formatAllTextButton;
		private System.Windows.Forms.ToolStripButton _formatCurrentEntryButton;
	}
}

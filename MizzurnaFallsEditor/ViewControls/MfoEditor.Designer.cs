using System.ComponentModel;

namespace MizzurnaFallsEditor.ViewControls
{
    partial class MfoEditor
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }

            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			this._previewGroupBox = new System.Windows.Forms.GroupBox();
			this._paletteIndexValueBox = new System.Windows.Forms.NumericUpDown();
			this._paletteLabel = new System.Windows.Forms.Label();
			this._zoomValueBox = new System.Windows.Forms.NumericUpDown();
			this._zoomLabel = new System.Windows.Forms.Label();
			this._defaulSettingsBox = new System.Windows.Forms.GroupBox();
			this._defaultHeightOffsetBox = new System.Windows.Forms.NumericUpDown();
			this._defaultWidthBox = new System.Windows.Forms.NumericUpDown();
			this._defaultHeightBox = new System.Windows.Forms.NumericUpDown();
			this._defaultWidthOffsetBox = new System.Windows.Forms.NumericUpDown();
			this._defaultYOffsetLabel = new System.Windows.Forms.Label();
			this._defaultXOffsetLabel = new System.Windows.Forms.Label();
			this._defaultHeightLabel = new System.Windows.Forms.Label();
			this._widthLabel = new System.Windows.Forms.Label();
			this._characterSettingsBox = new System.Windows.Forms.GroupBox();
			this._loadPaletteFromTimFileButton = new System.Windows.Forms.Button();
			this._addEntryButton = new System.Windows.Forms.Button();
			this._characterBppModeBox = new System.Windows.Forms.NumericUpDown();
			this._deleteButton = new System.Windows.Forms.Button();
			this._characterXOffsetBox = new System.Windows.Forms.NumericUpDown();
			this._saveButton = new System.Windows.Forms.Button();
			this._characterHeightBox = new System.Windows.Forms.NumericUpDown();
			this._loadButton = new System.Windows.Forms.Button();
			this._characterWidthBox = new System.Windows.Forms.NumericUpDown();
			this._characterEntryBox = new System.Windows.Forms.ComboBox();
			this._characterBppModeLabel = new System.Windows.Forms.Label();
			this._characterXOffsetLabel = new System.Windows.Forms.Label();
			this._characterHeightLabel = new System.Windows.Forms.Label();
			this._characterWidthLabel = new System.Windows.Forms.Label();
			this._characterImageBox = new System.Windows.Forms.PictureBox();
			this._saveTextureDialog = new System.Windows.Forms.SaveFileDialog();
			this._loadTextureDialog = new System.Windows.Forms.OpenFileDialog();
			this._previewGroupBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._paletteIndexValueBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._zoomValueBox)).BeginInit();
			this._defaulSettingsBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._defaultHeightOffsetBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultWidthBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultHeightBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultWidthOffsetBox)).BeginInit();
			this._characterSettingsBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._characterBppModeBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._characterXOffsetBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._characterHeightBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._characterWidthBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._characterImageBox)).BeginInit();
			this.SuspendLayout();
			// 
			// _previewGroupBox
			// 
			this._previewGroupBox.Controls.Add(this._paletteIndexValueBox);
			this._previewGroupBox.Controls.Add(this._paletteLabel);
			this._previewGroupBox.Controls.Add(this._zoomValueBox);
			this._previewGroupBox.Controls.Add(this._zoomLabel);
			this._previewGroupBox.Location = new System.Drawing.Point(3, 3);
			this._previewGroupBox.Name = "_previewGroupBox";
			this._previewGroupBox.Size = new System.Drawing.Size(165, 68);
			this._previewGroupBox.TabIndex = 12;
			this._previewGroupBox.TabStop = false;
			this._previewGroupBox.Text = "Preview Settings";
			// 
			// _paletteIndexValueBox
			// 
			this._paletteIndexValueBox.Location = new System.Drawing.Point(58, 40);
			this._paletteIndexValueBox.Name = "_paletteIndexValueBox";
			this._paletteIndexValueBox.Size = new System.Drawing.Size(101, 20);
			this._paletteIndexValueBox.TabIndex = 13;
			this._paletteIndexValueBox.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this._paletteIndexValueBox.ValueChanged += new System.EventHandler(this._paletteIndexValueBox_ValueChanged);
			// 
			// _paletteLabel
			// 
			this._paletteLabel.AutoSize = true;
			this._paletteLabel.Location = new System.Drawing.Point(5, 42);
			this._paletteLabel.Name = "_paletteLabel";
			this._paletteLabel.Size = new System.Drawing.Size(40, 13);
			this._paletteLabel.TabIndex = 12;
			this._paletteLabel.Text = "Palette";
			// 
			// _zoomValueBox
			// 
			this._zoomValueBox.Location = new System.Drawing.Point(59, 14);
			this._zoomValueBox.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this._zoomValueBox.Name = "_zoomValueBox";
			this._zoomValueBox.Size = new System.Drawing.Size(101, 20);
			this._zoomValueBox.TabIndex = 11;
			this._zoomValueBox.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this._zoomValueBox.ValueChanged += new System.EventHandler(this._zoomValueBox_ValueChanged);
			// 
			// _zoomLabel
			// 
			this._zoomLabel.AutoSize = true;
			this._zoomLabel.Location = new System.Drawing.Point(6, 16);
			this._zoomLabel.Name = "_zoomLabel";
			this._zoomLabel.Size = new System.Drawing.Size(34, 13);
			this._zoomLabel.TabIndex = 10;
			this._zoomLabel.Text = "Zoom";
			// 
			// _defaulSettingsBox
			// 
			this._defaulSettingsBox.Controls.Add(this._defaultHeightOffsetBox);
			this._defaulSettingsBox.Controls.Add(this._defaultWidthBox);
			this._defaulSettingsBox.Controls.Add(this._defaultHeightBox);
			this._defaulSettingsBox.Controls.Add(this._defaultWidthOffsetBox);
			this._defaulSettingsBox.Controls.Add(this._defaultYOffsetLabel);
			this._defaulSettingsBox.Controls.Add(this._defaultXOffsetLabel);
			this._defaulSettingsBox.Controls.Add(this._defaultHeightLabel);
			this._defaulSettingsBox.Controls.Add(this._widthLabel);
			this._defaulSettingsBox.Location = new System.Drawing.Point(3, 77);
			this._defaulSettingsBox.Name = "_defaulSettingsBox";
			this._defaulSettingsBox.Size = new System.Drawing.Size(165, 125);
			this._defaulSettingsBox.TabIndex = 3;
			this._defaulSettingsBox.TabStop = false;
			this._defaulSettingsBox.Text = "Default Settings";
			// 
			// _defaultHeightOffsetBox
			// 
			this._defaultHeightOffsetBox.Location = new System.Drawing.Point(57, 98);
			this._defaultHeightOffsetBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._defaultHeightOffsetBox.Name = "_defaultHeightOffsetBox";
			this._defaultHeightOffsetBox.Size = new System.Drawing.Size(102, 20);
			this._defaultHeightOffsetBox.TabIndex = 12;
			this._defaultHeightOffsetBox.ValueChanged += new System.EventHandler(this._defaultHeightOffsetBox_ValueChanged);
			// 
			// _defaultWidthBox
			// 
			this._defaultWidthBox.Location = new System.Drawing.Point(57, 20);
			this._defaultWidthBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._defaultWidthBox.Name = "_defaultWidthBox";
			this._defaultWidthBox.Size = new System.Drawing.Size(102, 20);
			this._defaultWidthBox.TabIndex = 11;
			this._defaultWidthBox.ValueChanged += new System.EventHandler(this._defaultWidthBox_ValueChanged);
			// 
			// _defaultHeightBox
			// 
			this._defaultHeightBox.Location = new System.Drawing.Point(57, 46);
			this._defaultHeightBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._defaultHeightBox.Name = "_defaultHeightBox";
			this._defaultHeightBox.Size = new System.Drawing.Size(102, 20);
			this._defaultHeightBox.TabIndex = 10;
			this._defaultHeightBox.ValueChanged += new System.EventHandler(this._defaultHeightBox_ValueChanged);
			// 
			// _defaultWidthOffsetBox
			// 
			this._defaultWidthOffsetBox.Location = new System.Drawing.Point(57, 72);
			this._defaultWidthOffsetBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._defaultWidthOffsetBox.Name = "_defaultWidthOffsetBox";
			this._defaultWidthOffsetBox.Size = new System.Drawing.Size(102, 20);
			this._defaultWidthOffsetBox.TabIndex = 9;
			this._defaultWidthOffsetBox.ValueChanged += new System.EventHandler(this._defaultWidthOffsetBox_ValueChanged);
			// 
			// _defaultYOffsetLabel
			// 
			this._defaultYOffsetLabel.AutoSize = true;
			this._defaultYOffsetLabel.Location = new System.Drawing.Point(6, 100);
			this._defaultYOffsetLabel.Name = "_defaultYOffsetLabel";
			this._defaultYOffsetLabel.Size = new System.Drawing.Size(45, 13);
			this._defaultYOffsetLabel.TabIndex = 8;
			this._defaultYOffsetLabel.Text = "Y Offset";
			// 
			// _defaultXOffsetLabel
			// 
			this._defaultXOffsetLabel.AutoSize = true;
			this._defaultXOffsetLabel.Location = new System.Drawing.Point(6, 74);
			this._defaultXOffsetLabel.Name = "_defaultXOffsetLabel";
			this._defaultXOffsetLabel.Size = new System.Drawing.Size(45, 13);
			this._defaultXOffsetLabel.TabIndex = 6;
			this._defaultXOffsetLabel.Text = "X Offset";
			// 
			// _defaultHeightLabel
			// 
			this._defaultHeightLabel.AutoSize = true;
			this._defaultHeightLabel.Location = new System.Drawing.Point(6, 48);
			this._defaultHeightLabel.Name = "_defaultHeightLabel";
			this._defaultHeightLabel.Size = new System.Drawing.Size(38, 13);
			this._defaultHeightLabel.TabIndex = 4;
			this._defaultHeightLabel.Text = "Height";
			// 
			// _widthLabel
			// 
			this._widthLabel.AutoSize = true;
			this._widthLabel.Location = new System.Drawing.Point(6, 22);
			this._widthLabel.Name = "_widthLabel";
			this._widthLabel.Size = new System.Drawing.Size(35, 13);
			this._widthLabel.TabIndex = 2;
			this._widthLabel.Text = "Width";
			// 
			// _characterSettingsBox
			// 
			this._characterSettingsBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
			this._characterSettingsBox.Controls.Add(this._loadPaletteFromTimFileButton);
			this._characterSettingsBox.Controls.Add(this._addEntryButton);
			this._characterSettingsBox.Controls.Add(this._characterBppModeBox);
			this._characterSettingsBox.Controls.Add(this._deleteButton);
			this._characterSettingsBox.Controls.Add(this._characterXOffsetBox);
			this._characterSettingsBox.Controls.Add(this._saveButton);
			this._characterSettingsBox.Controls.Add(this._characterHeightBox);
			this._characterSettingsBox.Controls.Add(this._loadButton);
			this._characterSettingsBox.Controls.Add(this._characterWidthBox);
			this._characterSettingsBox.Controls.Add(this._characterEntryBox);
			this._characterSettingsBox.Controls.Add(this._characterBppModeLabel);
			this._characterSettingsBox.Controls.Add(this._characterXOffsetLabel);
			this._characterSettingsBox.Controls.Add(this._characterHeightLabel);
			this._characterSettingsBox.Controls.Add(this._characterWidthLabel);
			this._characterSettingsBox.Location = new System.Drawing.Point(3, 208);
			this._characterSettingsBox.Name = "_characterSettingsBox";
			this._characterSettingsBox.Size = new System.Drawing.Size(165, 380);
			this._characterSettingsBox.TabIndex = 9;
			this._characterSettingsBox.TabStop = false;
			this._characterSettingsBox.Text = "Character Settings";
			// 
			// _loadPaletteFromTimFileButton
			// 
			this._loadPaletteFromTimFileButton.Location = new System.Drawing.Point(6, 266);
			this._loadPaletteFromTimFileButton.Name = "_loadPaletteFromTimFileButton";
			this._loadPaletteFromTimFileButton.Size = new System.Drawing.Size(151, 23);
			this._loadPaletteFromTimFileButton.TabIndex = 19;
			this._loadPaletteFromTimFileButton.Text = "Load Palette From TIM";
			this._loadPaletteFromTimFileButton.UseVisualStyleBackColor = true;
			this._loadPaletteFromTimFileButton.Click += new System.EventHandler(this._loadPaletteFromTimFileButton_Click);
			// 
			// _addEntryButton
			// 
			this._addEntryButton.Location = new System.Drawing.Point(6, 208);
			this._addEntryButton.Name = "_addEntryButton";
			this._addEntryButton.Size = new System.Drawing.Size(151, 23);
			this._addEntryButton.TabIndex = 18;
			this._addEntryButton.Text = "Add Entry";
			this._addEntryButton.UseVisualStyleBackColor = true;
			this._addEntryButton.Click += new System.EventHandler(this._addEntryButton_Click);
			// 
			// _characterBppModeBox
			// 
			this._characterBppModeBox.Enabled = false;
			this._characterBppModeBox.Location = new System.Drawing.Point(59, 124);
			this._characterBppModeBox.Name = "_characterBppModeBox";
			this._characterBppModeBox.ReadOnly = true;
			this._characterBppModeBox.Size = new System.Drawing.Size(100, 20);
			this._characterBppModeBox.TabIndex = 15;
			// 
			// _deleteButton
			// 
			this._deleteButton.Location = new System.Drawing.Point(6, 237);
			this._deleteButton.Name = "_deleteButton";
			this._deleteButton.Size = new System.Drawing.Size(151, 23);
			this._deleteButton.TabIndex = 17;
			this._deleteButton.Text = "Delete Entry";
			this._deleteButton.UseVisualStyleBackColor = true;
			this._deleteButton.Click += new System.EventHandler(this._deleteButton_Click);
			// 
			// _characterXOffsetBox
			// 
			this._characterXOffsetBox.Enabled = false;
			this._characterXOffsetBox.Location = new System.Drawing.Point(59, 98);
			this._characterXOffsetBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._characterXOffsetBox.Name = "_characterXOffsetBox";
			this._characterXOffsetBox.ReadOnly = true;
			this._characterXOffsetBox.Size = new System.Drawing.Size(100, 20);
			this._characterXOffsetBox.TabIndex = 16;
			// 
			// _saveButton
			// 
			this._saveButton.Location = new System.Drawing.Point(6, 179);
			this._saveButton.Name = "_saveButton";
			this._saveButton.Size = new System.Drawing.Size(151, 23);
			this._saveButton.TabIndex = 16;
			this._saveButton.Text = "Save Texture";
			this._saveButton.UseVisualStyleBackColor = true;
			this._saveButton.Click += new System.EventHandler(this._saveButton_Click);
			// 
			// _characterHeightBox
			// 
			this._characterHeightBox.Enabled = false;
			this._characterHeightBox.Location = new System.Drawing.Point(59, 72);
			this._characterHeightBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._characterHeightBox.Name = "_characterHeightBox";
			this._characterHeightBox.ReadOnly = true;
			this._characterHeightBox.Size = new System.Drawing.Size(100, 20);
			this._characterHeightBox.TabIndex = 17;
			// 
			// _loadButton
			// 
			this._loadButton.Location = new System.Drawing.Point(6, 150);
			this._loadButton.Name = "_loadButton";
			this._loadButton.Size = new System.Drawing.Size(151, 23);
			this._loadButton.TabIndex = 15;
			this._loadButton.Text = "Load Texture";
			this._loadButton.UseVisualStyleBackColor = true;
			this._loadButton.Click += new System.EventHandler(this._loadButton_Click);
			// 
			// _characterWidthBox
			// 
			this._characterWidthBox.Enabled = false;
			this._characterWidthBox.Location = new System.Drawing.Point(59, 46);
			this._characterWidthBox.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
			this._characterWidthBox.Name = "_characterWidthBox";
			this._characterWidthBox.ReadOnly = true;
			this._characterWidthBox.Size = new System.Drawing.Size(100, 20);
			this._characterWidthBox.TabIndex = 14;
			// 
			// _characterEntryBox
			// 
			this._characterEntryBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this._characterEntryBox.FormattingEnabled = true;
			this._characterEntryBox.Location = new System.Drawing.Point(8, 19);
			this._characterEntryBox.Name = "_characterEntryBox";
			this._characterEntryBox.Size = new System.Drawing.Size(151, 21);
			this._characterEntryBox.TabIndex = 14;
			this._characterEntryBox.SelectedIndexChanged += new System.EventHandler(this._characterEntryBox_SelectedIndexChanged);
			// 
			// _characterBppModeLabel
			// 
			this._characterBppModeLabel.AutoSize = true;
			this._characterBppModeLabel.Location = new System.Drawing.Point(8, 126);
			this._characterBppModeLabel.Name = "_characterBppModeLabel";
			this._characterBppModeLabel.Size = new System.Drawing.Size(34, 13);
			this._characterBppModeLabel.TabIndex = 8;
			this._characterBppModeLabel.Text = "Mode";
			// 
			// _characterXOffsetLabel
			// 
			this._characterXOffsetLabel.AutoSize = true;
			this._characterXOffsetLabel.Location = new System.Drawing.Point(8, 100);
			this._characterXOffsetLabel.Name = "_characterXOffsetLabel";
			this._characterXOffsetLabel.Size = new System.Drawing.Size(35, 13);
			this._characterXOffsetLabel.TabIndex = 6;
			this._characterXOffsetLabel.Text = "Clut Y";
			// 
			// _characterHeightLabel
			// 
			this._characterHeightLabel.AutoSize = true;
			this._characterHeightLabel.Location = new System.Drawing.Point(8, 74);
			this._characterHeightLabel.Name = "_characterHeightLabel";
			this._characterHeightLabel.Size = new System.Drawing.Size(38, 13);
			this._characterHeightLabel.TabIndex = 4;
			this._characterHeightLabel.Text = "Height";
			// 
			// _characterWidthLabel
			// 
			this._characterWidthLabel.AutoSize = true;
			this._characterWidthLabel.Location = new System.Drawing.Point(8, 48);
			this._characterWidthLabel.Name = "_characterWidthLabel";
			this._characterWidthLabel.Size = new System.Drawing.Size(35, 13);
			this._characterWidthLabel.TabIndex = 2;
			this._characterWidthLabel.Text = "Width";
			// 
			// _characterImageBox
			// 
			this._characterImageBox.Location = new System.Drawing.Point(174, 3);
			this._characterImageBox.Name = "_characterImageBox";
			this._characterImageBox.Size = new System.Drawing.Size(594, 585);
			this._characterImageBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
			this._characterImageBox.TabIndex = 13;
			this._characterImageBox.TabStop = false;
			// 
			// _saveTextureDialog
			// 
			this._saveTextureDialog.Filter = "|*.TIM";
			this._saveTextureDialog.InitialDirectory = "/../";
			// 
			// _loadTextureDialog
			// 
			this._loadTextureDialog.Filter = "|*.TIM";
			this._loadTextureDialog.InitialDirectory = "/../";
			// 
			// MfoEditor
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.BackColor = System.Drawing.SystemColors.Control;
			this.Controls.Add(this._characterImageBox);
			this.Controls.Add(this._characterSettingsBox);
			this.Controls.Add(this._previewGroupBox);
			this.Controls.Add(this._defaulSettingsBox);
			this.Name = "MfoEditor";
			this.Size = new System.Drawing.Size(771, 593);
			this._previewGroupBox.ResumeLayout(false);
			this._previewGroupBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._paletteIndexValueBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._zoomValueBox)).EndInit();
			this._defaulSettingsBox.ResumeLayout(false);
			this._defaulSettingsBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._defaultHeightOffsetBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultWidthBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultHeightBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._defaultWidthOffsetBox)).EndInit();
			this._characterSettingsBox.ResumeLayout(false);
			this._characterSettingsBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._characterBppModeBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._characterXOffsetBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._characterHeightBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._characterWidthBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._characterImageBox)).EndInit();
			this.ResumeLayout(false);

        }

        #endregion
		private System.Windows.Forms.GroupBox _defaulSettingsBox;
		private System.Windows.Forms.Label _defaultYOffsetLabel;
		private System.Windows.Forms.Label _defaultXOffsetLabel;
		private System.Windows.Forms.Label _defaultHeightLabel;
		private System.Windows.Forms.Label _widthLabel;
		private System.Windows.Forms.NumericUpDown _zoomValueBox;
		private System.Windows.Forms.Label _zoomLabel;
		private System.Windows.Forms.GroupBox _previewGroupBox;
		private System.Windows.Forms.NumericUpDown _paletteIndexValueBox;
		private System.Windows.Forms.Label _paletteLabel;
		private System.Windows.Forms.GroupBox _characterSettingsBox;
		private System.Windows.Forms.Label _characterBppModeLabel;
		private System.Windows.Forms.Label _characterXOffsetLabel;
		private System.Windows.Forms.Label _characterHeightLabel;
		private System.Windows.Forms.Label _characterWidthLabel;
		private System.Windows.Forms.PictureBox _characterImageBox;
		private System.Windows.Forms.NumericUpDown _characterBppModeBox;
		private System.Windows.Forms.NumericUpDown _characterXOffsetBox;
		private System.Windows.Forms.NumericUpDown _characterHeightBox;
		private System.Windows.Forms.NumericUpDown _characterWidthBox;
		private System.Windows.Forms.ComboBox _characterEntryBox;
		private System.Windows.Forms.Button _loadButton;
		private System.Windows.Forms.Button _saveButton;
		private System.Windows.Forms.Button _deleteButton;
		private System.Windows.Forms.Button _addEntryButton;
		private System.Windows.Forms.NumericUpDown _defaultHeightOffsetBox;
		private System.Windows.Forms.NumericUpDown _defaultWidthBox;
		private System.Windows.Forms.NumericUpDown _defaultHeightBox;
		private System.Windows.Forms.NumericUpDown _defaultWidthOffsetBox;
		private System.Windows.Forms.SaveFileDialog _saveTextureDialog;
		private System.Windows.Forms.OpenFileDialog _loadTextureDialog;
		private System.Windows.Forms.Button _loadPaletteFromTimFileButton;
	}
}
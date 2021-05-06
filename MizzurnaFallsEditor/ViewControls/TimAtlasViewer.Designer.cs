namespace MizzurnaFallsEditor.ViewControls
{
	partial class TimAtlasViewer
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
		/// Требуемый метод для поддержки конструктора — не изменяйте 
		/// содержимое этого метода с помощью редактора кода.
		/// </summary>
		private void InitializeComponent()
		{
			this._viewSettingsBox = new System.Windows.Forms.GroupBox();
			this._timEntriesComboBox = new System.Windows.Forms.ComboBox();
			this._saveButton = new System.Windows.Forms.Button();
			this._loadButton = new System.Windows.Forms.Button();
			this._transparentCheckbox = new System.Windows.Forms.CheckBox();
			this._zoomLabel = new System.Windows.Forms.Label();
			this._zoomNumericBox = new System.Windows.Forms.NumericUpDown();
			this.panel1 = new System.Windows.Forms.Panel();
			this._imageBox = new System.Windows.Forms.PictureBox();
			this._saveTextureDialog = new System.Windows.Forms.SaveFileDialog();
			this._loadTextureDialog = new System.Windows.Forms.OpenFileDialog();
			this._loadAllFromFolderButton = new System.Windows.Forms.Button();
			this._saveAllToFolderButton = new System.Windows.Forms.Button();
			this._loadAllFromFolderDialog = new System.Windows.Forms.FolderBrowserDialog();
			this._saveAllToFolderDialog = new System.Windows.Forms.FolderBrowserDialog();
			this._viewSettingsBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._zoomNumericBox)).BeginInit();
			this.panel1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._imageBox)).BeginInit();
			this.SuspendLayout();
			// 
			// _viewSettingsBox
			// 
			this._viewSettingsBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
			this._viewSettingsBox.Controls.Add(this._saveAllToFolderButton);
			this._viewSettingsBox.Controls.Add(this._loadAllFromFolderButton);
			this._viewSettingsBox.Controls.Add(this._timEntriesComboBox);
			this._viewSettingsBox.Controls.Add(this._saveButton);
			this._viewSettingsBox.Controls.Add(this._loadButton);
			this._viewSettingsBox.Controls.Add(this._transparentCheckbox);
			this._viewSettingsBox.Controls.Add(this._zoomLabel);
			this._viewSettingsBox.Controls.Add(this._zoomNumericBox);
			this._viewSettingsBox.Location = new System.Drawing.Point(3, 3);
			this._viewSettingsBox.Name = "_viewSettingsBox";
			this._viewSettingsBox.Size = new System.Drawing.Size(136, 377);
			this._viewSettingsBox.TabIndex = 2;
			this._viewSettingsBox.TabStop = false;
			this._viewSettingsBox.Text = "View Settings";
			// 
			// _timEntriesComboBox
			// 
			this._timEntriesComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this._timEntriesComboBox.FormattingEnabled = true;
			this._timEntriesComboBox.Location = new System.Drawing.Point(6, 19);
			this._timEntriesComboBox.Name = "_timEntriesComboBox";
			this._timEntriesComboBox.Size = new System.Drawing.Size(123, 21);
			this._timEntriesComboBox.TabIndex = 10;
			this._timEntriesComboBox.SelectedIndexChanged += new System.EventHandler(this._timEntriesComboBox_SelectedIndexChanged);
			// 
			// _saveButton
			// 
			this._saveButton.Location = new System.Drawing.Point(6, 75);
			this._saveButton.Name = "_saveButton";
			this._saveButton.Size = new System.Drawing.Size(123, 23);
			this._saveButton.TabIndex = 9;
			this._saveButton.Text = "Save Selected";
			this._saveButton.UseVisualStyleBackColor = true;
			this._saveButton.Click += new System.EventHandler(this._saveButton_Click);
			// 
			// _loadButton
			// 
			this._loadButton.Location = new System.Drawing.Point(6, 46);
			this._loadButton.Name = "_loadButton";
			this._loadButton.Size = new System.Drawing.Size(123, 23);
			this._loadButton.TabIndex = 8;
			this._loadButton.Text = "Load Selected";
			this._loadButton.UseVisualStyleBackColor = true;
			this._loadButton.Click += new System.EventHandler(this._loadButton_Click);
			// 
			// _transparentCheckbox
			// 
			this._transparentCheckbox.AutoSize = true;
			this._transparentCheckbox.Location = new System.Drawing.Point(6, 188);
			this._transparentCheckbox.Name = "_transparentCheckbox";
			this._transparentCheckbox.Size = new System.Drawing.Size(83, 17);
			this._transparentCheckbox.TabIndex = 6;
			this._transparentCheckbox.Text = "Transparent";
			this._transparentCheckbox.UseVisualStyleBackColor = true;
			this._transparentCheckbox.CheckedChanged += new System.EventHandler(this._transparentCheckbox_CheckedChanged);
			// 
			// _zoomLabel
			// 
			this._zoomLabel.AutoSize = true;
			this._zoomLabel.Location = new System.Drawing.Point(6, 164);
			this._zoomLabel.Name = "_zoomLabel";
			this._zoomLabel.Size = new System.Drawing.Size(34, 13);
			this._zoomLabel.TabIndex = 2;
			this._zoomLabel.Text = "Zoom";
			// 
			// _zoomNumericBox
			// 
			this._zoomNumericBox.Location = new System.Drawing.Point(67, 162);
			this._zoomNumericBox.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this._zoomNumericBox.Name = "_zoomNumericBox";
			this._zoomNumericBox.Size = new System.Drawing.Size(62, 20);
			this._zoomNumericBox.TabIndex = 0;
			this._zoomNumericBox.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
			this._zoomNumericBox.ValueChanged += new System.EventHandler(this._zoomNumericBox_ValueChanged);
			// 
			// panel1
			// 
			this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.panel1.AutoScroll = true;
			this.panel1.Controls.Add(this._imageBox);
			this.panel1.Location = new System.Drawing.Point(145, 3);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(630, 377);
			this.panel1.TabIndex = 3;
			// 
			// _imageBox
			// 
			this._imageBox.BackColor = System.Drawing.Color.Magenta;
			this._imageBox.Location = new System.Drawing.Point(3, 3);
			this._imageBox.Name = "_imageBox";
			this._imageBox.Size = new System.Drawing.Size(100, 100);
			this._imageBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
			this._imageBox.TabIndex = 0;
			this._imageBox.TabStop = false;
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
			// _loadAllFromFolderButton
			// 
			this._loadAllFromFolderButton.Location = new System.Drawing.Point(6, 104);
			this._loadAllFromFolderButton.Name = "_loadAllFromFolderButton";
			this._loadAllFromFolderButton.Size = new System.Drawing.Size(123, 23);
			this._loadAllFromFolderButton.TabIndex = 11;
			this._loadAllFromFolderButton.Text = "Load All From Folder";
			this._loadAllFromFolderButton.UseVisualStyleBackColor = true;
			this._loadAllFromFolderButton.Click += new System.EventHandler(this._loadAllFromFolderButton_Click);
			// 
			// _saveAllToFolderButton
			// 
			this._saveAllToFolderButton.Location = new System.Drawing.Point(6, 133);
			this._saveAllToFolderButton.Name = "_saveAllToFolderButton";
			this._saveAllToFolderButton.Size = new System.Drawing.Size(123, 23);
			this._saveAllToFolderButton.TabIndex = 12;
			this._saveAllToFolderButton.Text = "Save All To Folder";
			this._saveAllToFolderButton.UseVisualStyleBackColor = true;
			this._saveAllToFolderButton.Click += new System.EventHandler(this._saveAllToFolderButton_Click);
			// 
			// TimAtlasViewer
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this._viewSettingsBox);
			this.Controls.Add(this.panel1);
			this.Name = "TimAtlasViewer";
			this.Size = new System.Drawing.Size(778, 383);
			this._viewSettingsBox.ResumeLayout(false);
			this._viewSettingsBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._zoomNumericBox)).EndInit();
			this.panel1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this._imageBox)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.GroupBox _viewSettingsBox;
		private System.Windows.Forms.CheckBox _transparentCheckbox;
		private System.Windows.Forms.Label _zoomLabel;
		private System.Windows.Forms.NumericUpDown _zoomNumericBox;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.PictureBox _imageBox;
		private System.Windows.Forms.Button _saveButton;
		private System.Windows.Forms.Button _loadButton;
		private System.Windows.Forms.ComboBox _timEntriesComboBox;
		private System.Windows.Forms.SaveFileDialog _saveTextureDialog;
		private System.Windows.Forms.OpenFileDialog _loadTextureDialog;
		private System.Windows.Forms.Button _saveAllToFolderButton;
		private System.Windows.Forms.Button _loadAllFromFolderButton;
		private System.Windows.Forms.FolderBrowserDialog _loadAllFromFolderDialog;
		private System.Windows.Forms.FolderBrowserDialog _saveAllToFolderDialog;
	}
}

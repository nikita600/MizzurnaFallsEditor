namespace MizzurnaFallsEditor.ViewControls
{
	partial class TextViewer
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
			this._textPreviewPixtureBox = new System.Windows.Forms.PictureBox();
			this._settingsBox = new System.Windows.Forms.GroupBox();
			this._fontComboBox = new System.Windows.Forms.ComboBox();
			this._viewPresetComboBox = new System.Windows.Forms.ComboBox();
			this._presetLabel = new System.Windows.Forms.Label();
			this._paletteIndexBox = new System.Windows.Forms.NumericUpDown();
			this._paletteLabel = new System.Windows.Forms.Label();
			this._fontLabel = new System.Windows.Forms.Label();
			this.panel1 = new System.Windows.Forms.Panel();
			((System.ComponentModel.ISupportInitialize)(this._textPreviewPixtureBox)).BeginInit();
			this._settingsBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._paletteIndexBox)).BeginInit();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// _textPreviewPixtureBox
			// 
			this._textPreviewPixtureBox.BackColor = System.Drawing.Color.Magenta;
			this._textPreviewPixtureBox.Location = new System.Drawing.Point(3, 3);
			this._textPreviewPixtureBox.Name = "_textPreviewPixtureBox";
			this._textPreviewPixtureBox.Size = new System.Drawing.Size(437, 94);
			this._textPreviewPixtureBox.TabIndex = 0;
			this._textPreviewPixtureBox.TabStop = false;
			this._textPreviewPixtureBox.Paint += new System.Windows.Forms.PaintEventHandler(this._textPreviewPixtureBox_Paint);
			// 
			// _settingsBox
			// 
			this._settingsBox.Controls.Add(this._fontComboBox);
			this._settingsBox.Controls.Add(this._viewPresetComboBox);
			this._settingsBox.Controls.Add(this._presetLabel);
			this._settingsBox.Controls.Add(this._paletteIndexBox);
			this._settingsBox.Controls.Add(this._paletteLabel);
			this._settingsBox.Controls.Add(this._fontLabel);
			this._settingsBox.Location = new System.Drawing.Point(3, 3);
			this._settingsBox.Name = "_settingsBox";
			this._settingsBox.Size = new System.Drawing.Size(185, 100);
			this._settingsBox.TabIndex = 1;
			this._settingsBox.TabStop = false;
			this._settingsBox.Text = "Preview Settings";
			// 
			// _fontComboBox
			// 
			this._fontComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this._fontComboBox.FormattingEnabled = true;
			this._fontComboBox.Location = new System.Drawing.Point(75, 46);
			this._fontComboBox.Name = "_fontComboBox";
			this._fontComboBox.Size = new System.Drawing.Size(104, 21);
			this._fontComboBox.TabIndex = 6;
			this._fontComboBox.SelectedIndexChanged += new System.EventHandler(this._fontComboBox_SelectedIndexChanged);
			// 
			// _viewPresetComboBox
			// 
			this._viewPresetComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this._viewPresetComboBox.FormattingEnabled = true;
			this._viewPresetComboBox.Location = new System.Drawing.Point(75, 19);
			this._viewPresetComboBox.Name = "_viewPresetComboBox";
			this._viewPresetComboBox.Size = new System.Drawing.Size(104, 21);
			this._viewPresetComboBox.TabIndex = 5;
			this._viewPresetComboBox.SelectedIndexChanged += new System.EventHandler(this._viewPresetComboBox_SelectedIndexChanged);
			// 
			// _presetLabel
			// 
			this._presetLabel.AutoSize = true;
			this._presetLabel.Location = new System.Drawing.Point(6, 22);
			this._presetLabel.Name = "_presetLabel";
			this._presetLabel.Size = new System.Drawing.Size(63, 13);
			this._presetLabel.TabIndex = 4;
			this._presetLabel.Text = "View Preset";
			// 
			// _paletteIndexBox
			// 
			this._paletteIndexBox.Location = new System.Drawing.Point(75, 73);
			this._paletteIndexBox.Name = "_paletteIndexBox";
			this._paletteIndexBox.Size = new System.Drawing.Size(104, 20);
			this._paletteIndexBox.TabIndex = 3;
			this._paletteIndexBox.ValueChanged += new System.EventHandler(this._paletteIndexBox_ValueChanged);
			// 
			// _paletteLabel
			// 
			this._paletteLabel.AutoSize = true;
			this._paletteLabel.Location = new System.Drawing.Point(6, 75);
			this._paletteLabel.Name = "_paletteLabel";
			this._paletteLabel.Size = new System.Drawing.Size(40, 13);
			this._paletteLabel.TabIndex = 2;
			this._paletteLabel.Text = "Palette";
			// 
			// _fontLabel
			// 
			this._fontLabel.AutoSize = true;
			this._fontLabel.Location = new System.Drawing.Point(6, 49);
			this._fontLabel.Name = "_fontLabel";
			this._fontLabel.Size = new System.Drawing.Size(28, 13);
			this._fontLabel.TabIndex = 0;
			this._fontLabel.Text = "Font";
			// 
			// panel1
			// 
			this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.panel1.AutoScroll = true;
			this.panel1.Controls.Add(this._textPreviewPixtureBox);
			this.panel1.Location = new System.Drawing.Point(194, 3);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(443, 100);
			this.panel1.TabIndex = 2;
			// 
			// TextViewer
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this.panel1);
			this.Controls.Add(this._settingsBox);
			this.Name = "TextViewer";
			this.Size = new System.Drawing.Size(640, 110);
			((System.ComponentModel.ISupportInitialize)(this._textPreviewPixtureBox)).EndInit();
			this._settingsBox.ResumeLayout(false);
			this._settingsBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._paletteIndexBox)).EndInit();
			this.panel1.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.PictureBox _textPreviewPixtureBox;
		private System.Windows.Forms.GroupBox _settingsBox;
		private System.Windows.Forms.Label _presetLabel;
		private System.Windows.Forms.NumericUpDown _paletteIndexBox;
		private System.Windows.Forms.Label _paletteLabel;
		private System.Windows.Forms.Label _fontLabel;
		private System.Windows.Forms.ComboBox _viewPresetComboBox;
		private System.Windows.Forms.ComboBox _fontComboBox;
		private System.Windows.Forms.Panel panel1;
	}
}

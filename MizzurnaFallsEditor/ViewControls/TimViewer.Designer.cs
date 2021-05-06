namespace MizzurnaFallsEditor.ViewControls
{
	partial class TimViewer
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
			this._imageBox = new System.Windows.Forms.PictureBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this._viewSettingsBox = new System.Windows.Forms.GroupBox();
			this._clutOffsetYNumericBox = new System.Windows.Forms.NumericUpDown();
			this._clutOffsetYLabel = new System.Windows.Forms.Label();
			this._prevPaletteButton = new System.Windows.Forms.Button();
			this._nextPaletteButton = new System.Windows.Forms.Button();
			this._force4BppModeBox = new System.Windows.Forms.CheckBox();
			this._transparentCheckbox = new System.Windows.Forms.CheckBox();
			this._clutOffsetXNumericBox = new System.Windows.Forms.NumericUpDown();
			this._clutOffsetXLabel = new System.Windows.Forms.Label();
			this._zoomLabel = new System.Windows.Forms.Label();
			this._zoomNumericBox = new System.Windows.Forms.NumericUpDown();
			this._paletteBox = new System.Windows.Forms.PictureBox();
			((System.ComponentModel.ISupportInitialize)(this._imageBox)).BeginInit();
			this.panel1.SuspendLayout();
			this._viewSettingsBox.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this._clutOffsetYNumericBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._clutOffsetXNumericBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._zoomNumericBox)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this._paletteBox)).BeginInit();
			this.SuspendLayout();
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
			// panel1
			// 
			this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.panel1.AutoScroll = true;
			this.panel1.Controls.Add(this._paletteBox);
			this.panel1.Controls.Add(this._imageBox);
			this.panel1.Location = new System.Drawing.Point(145, 3);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(630, 377);
			this.panel1.TabIndex = 1;
			// 
			// _viewSettingsBox
			// 
			this._viewSettingsBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
			this._viewSettingsBox.Controls.Add(this._clutOffsetYNumericBox);
			this._viewSettingsBox.Controls.Add(this._clutOffsetYLabel);
			this._viewSettingsBox.Controls.Add(this._prevPaletteButton);
			this._viewSettingsBox.Controls.Add(this._nextPaletteButton);
			this._viewSettingsBox.Controls.Add(this._force4BppModeBox);
			this._viewSettingsBox.Controls.Add(this._transparentCheckbox);
			this._viewSettingsBox.Controls.Add(this._clutOffsetXNumericBox);
			this._viewSettingsBox.Controls.Add(this._clutOffsetXLabel);
			this._viewSettingsBox.Controls.Add(this._zoomLabel);
			this._viewSettingsBox.Controls.Add(this._zoomNumericBox);
			this._viewSettingsBox.Location = new System.Drawing.Point(3, 3);
			this._viewSettingsBox.Name = "_viewSettingsBox";
			this._viewSettingsBox.Size = new System.Drawing.Size(136, 377);
			this._viewSettingsBox.TabIndex = 1;
			this._viewSettingsBox.TabStop = false;
			this._viewSettingsBox.Text = "View Settings";
			// 
			// _clutOffsetYNumericBox
			// 
			this._clutOffsetYNumericBox.Location = new System.Drawing.Point(68, 71);
			this._clutOffsetYNumericBox.Name = "_clutOffsetYNumericBox";
			this._clutOffsetYNumericBox.Size = new System.Drawing.Size(62, 20);
			this._clutOffsetYNumericBox.TabIndex = 11;
			this._clutOffsetYNumericBox.ValueChanged += new System.EventHandler(this._clutOffsetYNumericBox_ValueChanged);
			// 
			// _clutOffsetYLabel
			// 
			this._clutOffsetYLabel.AutoSize = true;
			this._clutOffsetYLabel.Location = new System.Drawing.Point(6, 73);
			this._clutOffsetYLabel.Name = "_clutOffsetYLabel";
			this._clutOffsetYLabel.Size = new System.Drawing.Size(35, 13);
			this._clutOffsetYLabel.TabIndex = 10;
			this._clutOffsetYLabel.Text = "Clut Y";
			// 
			// _prevPaletteButton
			// 
			this._prevPaletteButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
			this._prevPaletteButton.Location = new System.Drawing.Point(6, 348);
			this._prevPaletteButton.Name = "_prevPaletteButton";
			this._prevPaletteButton.Size = new System.Drawing.Size(123, 23);
			this._prevPaletteButton.TabIndex = 9;
			this._prevPaletteButton.Text = "Prev Palette";
			this._prevPaletteButton.UseVisualStyleBackColor = true;
			this._prevPaletteButton.Click += new System.EventHandler(this._prevPaletteButton_Click);
			// 
			// _nextPaletteButton
			// 
			this._nextPaletteButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
			this._nextPaletteButton.Location = new System.Drawing.Point(6, 319);
			this._nextPaletteButton.Name = "_nextPaletteButton";
			this._nextPaletteButton.Size = new System.Drawing.Size(123, 23);
			this._nextPaletteButton.TabIndex = 8;
			this._nextPaletteButton.Text = "Next Palette";
			this._nextPaletteButton.UseVisualStyleBackColor = true;
			this._nextPaletteButton.Click += new System.EventHandler(this._nextPaletteButton_Click);
			// 
			// _force4BppModeBox
			// 
			this._force4BppModeBox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
			this._force4BppModeBox.AutoSize = true;
			this._force4BppModeBox.Location = new System.Drawing.Point(6, 296);
			this._force4BppModeBox.Name = "_force4BppModeBox";
			this._force4BppModeBox.Size = new System.Drawing.Size(83, 17);
			this._force4BppModeBox.TabIndex = 7;
			this._force4BppModeBox.Text = "Force 4BPP";
			this._force4BppModeBox.UseVisualStyleBackColor = true;
			this._force4BppModeBox.CheckedChanged += new System.EventHandler(this._force4BppModeBox_CheckedChanged);
			// 
			// _transparentCheckbox
			// 
			this._transparentCheckbox.AutoSize = true;
			this._transparentCheckbox.Location = new System.Drawing.Point(6, 97);
			this._transparentCheckbox.Name = "_transparentCheckbox";
			this._transparentCheckbox.Size = new System.Drawing.Size(83, 17);
			this._transparentCheckbox.TabIndex = 6;
			this._transparentCheckbox.Text = "Transparent";
			this._transparentCheckbox.UseVisualStyleBackColor = true;
			this._transparentCheckbox.CheckedChanged += new System.EventHandler(this._transparentCheckbox_CheckedChanged);
			// 
			// _clutOffsetXNumericBox
			// 
			this._clutOffsetXNumericBox.Location = new System.Drawing.Point(68, 45);
			this._clutOffsetXNumericBox.Name = "_clutOffsetXNumericBox";
			this._clutOffsetXNumericBox.Size = new System.Drawing.Size(62, 20);
			this._clutOffsetXNumericBox.TabIndex = 4;
			this._clutOffsetXNumericBox.ValueChanged += new System.EventHandler(this._clutOffsetXNumericBox_ValueChanged);
			// 
			// _clutOffsetXLabel
			// 
			this._clutOffsetXLabel.AutoSize = true;
			this._clutOffsetXLabel.Location = new System.Drawing.Point(6, 47);
			this._clutOffsetXLabel.Name = "_clutOffsetXLabel";
			this._clutOffsetXLabel.Size = new System.Drawing.Size(35, 13);
			this._clutOffsetXLabel.TabIndex = 3;
			this._clutOffsetXLabel.Text = "Clut X";
			// 
			// _zoomLabel
			// 
			this._zoomLabel.AutoSize = true;
			this._zoomLabel.Location = new System.Drawing.Point(6, 21);
			this._zoomLabel.Name = "_zoomLabel";
			this._zoomLabel.Size = new System.Drawing.Size(34, 13);
			this._zoomLabel.TabIndex = 2;
			this._zoomLabel.Text = "Zoom";
			// 
			// _zoomNumericBox
			// 
			this._zoomNumericBox.Location = new System.Drawing.Point(68, 19);
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
			// _paletteBox
			// 
			this._paletteBox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
			this._paletteBox.BackColor = System.Drawing.Color.Magenta;
			this._paletteBox.Location = new System.Drawing.Point(3, 274);
			this._paletteBox.Name = "_paletteBox";
			this._paletteBox.Size = new System.Drawing.Size(100, 100);
			this._paletteBox.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
			this._paletteBox.TabIndex = 1;
			this._paletteBox.TabStop = false;
			this._paletteBox.Paint += new System.Windows.Forms.PaintEventHandler(this._paletteBox_Paint);
			// 
			// TimViewer
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.Controls.Add(this._viewSettingsBox);
			this.Controls.Add(this.panel1);
			this.Name = "TimViewer";
			this.Size = new System.Drawing.Size(778, 383);
			((System.ComponentModel.ISupportInitialize)(this._imageBox)).EndInit();
			this.panel1.ResumeLayout(false);
			this._viewSettingsBox.ResumeLayout(false);
			this._viewSettingsBox.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this._clutOffsetYNumericBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._clutOffsetXNumericBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._zoomNumericBox)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this._paletteBox)).EndInit();
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.PictureBox _imageBox;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.GroupBox _viewSettingsBox;
		private System.Windows.Forms.Label _zoomLabel;
		private System.Windows.Forms.NumericUpDown _zoomNumericBox;
		private System.Windows.Forms.NumericUpDown _clutOffsetXNumericBox;
		private System.Windows.Forms.Label _clutOffsetXLabel;
		private System.Windows.Forms.CheckBox _transparentCheckbox;
		private System.Windows.Forms.CheckBox _force4BppModeBox;
		private System.Windows.Forms.Button _nextPaletteButton;
		private System.Windows.Forms.Button _prevPaletteButton;
		private System.Windows.Forms.NumericUpDown _clutOffsetYNumericBox;
		private System.Windows.Forms.Label _clutOffsetYLabel;
		private System.Windows.Forms.PictureBox _paletteBox;
	}
}

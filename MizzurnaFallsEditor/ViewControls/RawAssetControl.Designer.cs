namespace MizzurnaFallsEditor.ViewControls
{
    partial class RawAssetControl
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
            this._infoLabel = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // _infoLabel
            // 
            this._infoLabel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this._infoLabel.Location = new System.Drawing.Point(0, 350);
            this._infoLabel.Name = "_infoLabel";
            this._infoLabel.Size = new System.Drawing.Size(638, 16);
            this._infoLabel.TabIndex = 0;
            this._infoLabel.Text = "None";
            // 
            // RawAssetControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Controls.Add(this._infoLabel);
            this.Name = "RawAssetControl";
            this.Size = new System.Drawing.Size(638, 366);
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Label _infoLabel;
    }
}

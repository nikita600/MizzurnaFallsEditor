using System.Windows.Forms;
using System.ComponentModel.Design;

namespace MizzurnaFallsEditor.ViewControls
{
    public partial class RawAssetControl : UserControl
    {
        #region Constants

        private static readonly byte[] EmptyBytes = { };

        #endregion
        #region Fields

        private readonly ByteViewer _byteViewer;

        #endregion
        #region Constructor

        public RawAssetControl()
        {
            InitializeComponent();

            SuspendLayout();

            _byteViewer = new ByteViewer
            {
                Dock = DockStyle.Fill
            };
            _byteViewer.SetBytes(EmptyBytes);
            
            Controls.Add(_byteViewer);

            ResumeLayout(true);
        }

        #endregion
        #region Methods

        public void SetBytes(byte[] bytes, byte[] sourceBytes)
        {
            _byteViewer.SetBytes(EmptyBytes);

            if (bytes != null)
            {
                _byteViewer.SetBytes(bytes);
            }

            _infoLabel.Text = "Current: " + bytes.Length + ", Source: " + sourceBytes.Length;
        }

        #endregion
    }
}

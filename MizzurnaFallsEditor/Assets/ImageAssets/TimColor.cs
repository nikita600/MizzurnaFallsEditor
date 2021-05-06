namespace MizzurnaFallsEditor.Assets.ImageAssets
{
    public sealed class TimColor
    {
        #region Fields
        
        public readonly byte R;
        public readonly byte G;
        public readonly byte B;
        public readonly byte A;

        #endregion

        #region Public
        
        public TimColor(byte r, byte g, byte b) : this(r, g, b, 255)
        {
            
        }
        
        public TimColor(byte r, byte g, byte b, byte a)
        {
            R = r;
            G = g;
            B = b;
            A = a;
        }
        
        public static TimColor Create(ushort color)
		{
            var r = GetColorComponent(color, 0x001F, 00, 3);
            var g = GetColorComponent(color, 0x03E0, 05, 3);
            var b = GetColorComponent(color, 0x7C00, 10, 3);
            var a = GetColorComponent(color, 0x8000, 15, 0);

            if (r == 0 && g == 0 && b == 0)
            {
                a = 0;
            }
            else
            {
                a = 255;
            }

            return new TimColor(r, g, b, a);
        }

        private static byte GetColorComponent(ushort color, int mask, int bitOffset, int mod)
        {
            return (byte)(((color & mask) >> bitOffset) << mod);
        }

        #endregion
    }
}
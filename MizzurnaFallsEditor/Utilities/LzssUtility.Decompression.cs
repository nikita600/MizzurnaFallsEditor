using System;
using System.IO;

namespace MizzurnaFallsEditor.Utilities
{
    public static partial class LzssUtility
    {
        #region Public

		public static byte[] Decompress(BinaryReader compressedReader, int decompressedSize)
		{
			var decompressedPosition = 0;
			var decompressedBuffer = new byte[decompressedSize];
			
			var size = compressedReader.ReadSByte();
			while (size != 0)
			{
				if (size > 0)
				{
					for (var i = size; i != 0; --i)
					{
						decompressedBuffer[decompressedPosition] = compressedReader.ReadByte();
						decompressedPosition++;
					}
				}
				else
				{
					var windowOffset = decompressedPosition - compressedReader.ReadByte() - 1;
					for (var i = (sbyte)(0x02 - size); i != 0; --i)
					{
						decompressedBuffer[decompressedPosition] = decompressedBuffer[windowOffset];

						decompressedPosition++;
						windowOffset++;
					}
				}

				size = compressedReader.ReadSByte();
			}

			if (decompressedSize != decompressedBuffer.Length)
			{
				throw new Exception("Fail to decompress.");
			}
			
			return decompressedBuffer;
		}

		#endregion
    }
}
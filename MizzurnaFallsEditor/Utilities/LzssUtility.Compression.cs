using System.IO;

namespace MizzurnaFallsEditor.Utilities
{
    public static partial class LzssUtility
    {
	    #region Public
	    
	    public static byte[] Compress(byte[] decompressedBytes)
		{
			const byte MIN_MATCH = 0x02;

			var compressedStream = new MemoryStream();
			var compressedWriter = new BinaryWriter(compressedStream);

			var currentPosition = 0;

			var literalPosition = 0;
			sbyte literalCount = 0x01;
			var literalWrited = true;

			compressedWriter.Write(literalCount);
			compressedWriter.Write(decompressedBytes[currentPosition]);

			currentPosition++;

			while (currentPosition < decompressedBytes.Length)
			{
				var lzEntry = SearchLzMatch(currentPosition, decompressedBytes);
				var lzEntryAlt = SearchLzMatch(currentPosition + 1, decompressedBytes);

				if (lzEntry.Size <= MIN_MATCH || (lzEntry.Size < lzEntryAlt.Size && lzEntryAlt.Size >= MIN_MATCH))
				{
					if (literalCount >= sbyte.MaxValue)
					{
						//Console.WriteLine("Overflow");

						literalCount = 0;
						literalPosition = (int)compressedStream.Position;
						literalWrited = false;
					}

					var position = compressedStream.Position;

					if (!literalWrited)
					{
						literalWrited = true;
						position++;
					}

					literalCount++;

					compressedStream.Position = literalPosition;
					compressedWriter.Write(literalCount);

					var data = decompressedBytes[currentPosition];

					compressedStream.Position = position;
					compressedWriter.Write(data);

					currentPosition++;
				}
				else
				{
					var size = (sbyte)(0x02 - lzEntry.Size);

					compressedWriter.Write(size);
					compressedWriter.Write(lzEntry.Distance);

					currentPosition += lzEntry.Size;

					literalCount = 0;
					literalPosition = (int)compressedStream.Position;
					literalWrited = false;
				}
			}

			compressedWriter.Write(default(byte));

			var compressedBytes = compressedStream.ToArray();

			compressedWriter.Close();
			compressedStream.Close();

			return compressedBytes;
		}

	    #endregion
	    
	    #region Private
	    
	    private static LzEntry SearchLzMatch(int currentPosition, byte[] decompressedData)
		{
			const int MAX_MATCH = sbyte.MaxValue;
			const int WINDOW_SIZE = byte.MaxValue;

			var lzSize = 0;
			var lzOffset = 0;

			if (currentPosition >= decompressedData.Length)
			{
				return new LzEntry
				{
					Size = (byte) lzSize,
					Offset = lzOffset,
					Distance = (byte) (currentPosition - lzOffset - 1)
				};
			}
			
			var windowOffset = currentPosition - WINDOW_SIZE;
			if (windowOffset < 0)
			{
				windowOffset = 0;
			}

			for (var w = windowOffset; (w < currentPosition) && ((w + MAX_MATCH) < (currentPosition + MAX_MATCH)); w++)
			{
				var matchSize = 0;

				var windowData = decompressedData[w];
				var currentData = decompressedData[currentPosition];

				if (windowData == currentData)
				{
					matchSize = 1;

					while (currentPosition + matchSize < decompressedData.Length &&
					       decompressedData[w + matchSize] == decompressedData[currentPosition + matchSize])
					{
						if (matchSize >= MAX_MATCH)
						{
							break;
						}

						matchSize++;
					}

					if (matchSize > lzSize)
					{
						lzSize = matchSize;
						lzOffset = w;
					}
				}

				if (matchSize <= MAX_MATCH)
				{
					continue;
				}
					
				lzSize = MAX_MATCH;
				break;
			}

			return new LzEntry
			{
				Size = (byte) lzSize,
				Offset = lzOffset,
				Distance = (byte) (currentPosition - lzOffset - 1)
			};
		}
	    
	    #endregion
	    
	    #region Nested

	    private struct LzEntry
		{
			public byte Size;
			public byte Distance;

			public int Offset;

			public override string ToString()
			{
				return string.Concat("LzEntry Offset: 0x", Offset.ToString("X8"), " Distance: 0x", Distance.ToString("X2"), ", Size: 0x", Size.ToString("X2"));
			}
		}
		
		#endregion
    }
}
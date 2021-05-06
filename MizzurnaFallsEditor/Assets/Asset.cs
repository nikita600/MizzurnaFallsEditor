using System;
using System.Collections.Generic;

namespace MizzurnaFallsEditor.Assets
{
	public abstract class Asset
	{
		#region Fields

		// ReSharper disable once InconsistentNaming
		protected byte[] _bytes = new byte[0];
		
		// ReSharper disable once InconsistentNaming
		protected readonly List<Asset> _childAssets = new List<Asset>();

		#endregion

		#region Properties

		public string Name;

		public byte[] Bytes => _bytes;
		
		public List<Asset> ChildAssets => _childAssets;

		public bool IsEmpty
		{
			get
			{
				var size = _bytes.Length;
				if (size <= 4)
				{
					for (var i = 0; i < size; ++i)
					{
						if (_bytes[i] != 0)
						{
							return false;
						}
					}

					return true;
				}

				return false;
			}
		}

		#endregion
		
		#region Public

		public virtual void Deserialize(byte[] bytes)
		{
			throw new NotImplementedException();
		}
		
		public virtual byte[] Serialize()
		{
			throw new NotImplementedException();
		}
		
		#endregion

		#region Protected

		protected Asset()
		{
			
		}
		
		protected static int Swap(int value)
		{
			return (int)Swap((uint)value);
		}
		
		protected static short Swap(short value)
		{
			return (short)Swap((ushort) value);
		}

		protected static void GetPaddedBytes(ref byte[] bytes, int padding)
		{
			var size = bytes.Length;
			if (size % padding <= 0)
			{
				return;
			}
			
			var newSize = size / padding * padding;
			newSize += (size % padding > 0) ? padding : 0;

			Array.Resize(ref bytes, newSize);
		}
		
		#endregion

		#region Private

		private static uint Swap(uint value)
		{
			return	(value & 0x000000FF) << 24 | (value & 0x0000FF00) << 08 |
			        (value & 0x00FF0000) >> 08 | (value & 0xFF000000) >> 24;
		}

		private static ushort Swap(ushort value)
		{
			return (ushort)((value & 0x00FF) << 8 | (value & 0xFF00) >> 8);
		}
		
		#endregion
	}
}

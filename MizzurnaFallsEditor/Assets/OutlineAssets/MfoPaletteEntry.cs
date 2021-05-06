using System;
using System.IO;
using MizzurnaFallsEditor.Assets.ImageAssets;

namespace MizzurnaFallsEditor.Assets.OutlineAssets
{
	public sealed class MfoPaletteEntry
	{
		#region Constants
		
		private const int PaletteSize = 16;

		#endregion

		#region Fields

		private ushort[] _palette = Array.Empty<ushort>();

		#endregion

		#region Properties

		public ushort[] PaletteEntries => _palette;

		#endregion

		#region Public

		public void Serialize(BinaryWriter binaryWriter)
		{
			for (var i = 0; i < PaletteSize; ++i)
			{
				binaryWriter.Write(_palette[i]);
			}
		}

		public void Deserialize(BinaryReader binaryReader)
		{
			_palette = new ushort[PaletteSize];
			for (var i = 0; i < PaletteSize; ++i)
			{
				_palette[i] = binaryReader.ReadUInt16();
			}
		}

		public TimColor GetColor(int index, int clutX, int clutY)
		{
			if (index >= _palette.Length)
			{
				throw new ArgumentException("Color index out of range.");
			}

			return TimColor.Create(_palette[index]);
		}

		public void SetData(ushort[] palette)
		{
			_palette = palette;
		}

		#endregion
	}
}

using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets.ImageAssets
{
	public sealed class TimClutData
	{
		#region Fields

		public readonly TimVramData VramData = new TimVramData();
		public readonly List<ushort> ClutEntries = new List<ushort>();

		#endregion

		#region Public

		public void Deserialize(byte[] data)
		{
			ClutEntries.Clear();

			using (var memoryStream = new MemoryStream(data))
			{
				using (var binaryReader = new BinaryReader(memoryStream))
				{
					VramData.Deserialize(binaryReader);

					var entriesCount = VramData.Width * VramData.Height;
					
					for (var i = 0; i < entriesCount; ++i)
					{
						var clutEntry = binaryReader.ReadUInt16();
						ClutEntries.Add(clutEntry);
					}
				}
			}
		}

		public byte[] Serialize()
		{
			using (var memoryStream = new MemoryStream())
			{
				using (var binaryWriter = new BinaryWriter(memoryStream))
				{
					VramData.Serialize(binaryWriter);

					for (int i = 0, l = ClutEntries.Count; i < l; ++i)
					{
						var clutEntry = ClutEntries[i];
						binaryWriter.Write(clutEntry);
					}
				}

				return memoryStream.ToArray();
			}
		}

		public void SetData(IReadOnlyList<ushort> clutEntries)
		{
			if (clutEntries == null)
			{
				return;
			}

			VramData.DX = 0;
			VramData.DY = 0;
			VramData.Height = 1;
			VramData.Width = (ushort)clutEntries.Count;

			ClutEntries.Clear();
			ClutEntries.AddRange(clutEntries);
		}

		public List<ushort> GetClutEntries(int x, int y, TimBppMode bppMode)
		{
			int colorCount;
			switch (bppMode)
			{
				case TimBppMode.Bpp4:
					colorCount = 16;
					break;

				case TimBppMode.Bpp8:
					colorCount = 256;
					break;

				default:
					return null;
			}

			var xOffset = x - VramData.DX;
			var yOffset = y - VramData.DY;

			var start = xOffset + (yOffset * VramData.Width);

			var colors = new ushort[colorCount];
			for (var i = 0; i < colorCount; ++i)
			{
				var index = start + i;
				if (0 <= index && index < ClutEntries.Count)
				{
					colors[i] = ClutEntries[index];
				}
			}

			return new List<ushort>(colors);
		}

		public TimColor GetColor(int index, int clutX, int clutY)
		{
			var finalIndex = GetClutIndex(index, clutX, clutY);
			if (finalIndex >= ClutEntries.Count)
			{
				return new TimColor(0, 0, 0, 255);
			}

			return TimColor.Create(ClutEntries[finalIndex]);
		}

		#endregion

		#region Private

		private int GetClutIndex(int index, int clutX, int clutY)
		{
			var xOffset = clutX - VramData.DX;
			var yOffset = clutY - VramData.DY;

			return xOffset + (yOffset * VramData.Width) + index;
		}

		#endregion
	}
}

using System.IO;

namespace MizzurnaFallsEditor.Assets.ImageAssets
{
	public sealed class TimFlagData
	{
		#region Fields

		public TimBppMode BppMode;
		public bool HasClutData;

		#endregion

		#region Public

		public void Deserialize(BinaryReader binaryReader)
		{
			var data = binaryReader.ReadUInt32();

			BppMode = (TimBppMode)(data & 0x07);
			HasClutData = (data & 0x08) == 0x08;
		}

		public void Serialize(BinaryWriter binaryWriter)
		{
			var data = HasClutData ? 1 : 0;
			data <<= 3;
			data |= (int)BppMode;

			binaryWriter.Write(data);
		}

		#endregion
	}
}

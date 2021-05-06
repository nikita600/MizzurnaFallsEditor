using System.IO;

namespace MizzurnaFallsEditor.Assets.ImageAssets
{
	public sealed class TimVramData
	{
		#region Fields

		public ushort DX;
		public ushort DY;
		public ushort Width;
		public ushort Height;

		#endregion

		#region Public

		public void Deserialize(BinaryReader binaryReader)
		{
			DX = binaryReader.ReadUInt16();
			DY = binaryReader.ReadUInt16();
			Width = binaryReader.ReadUInt16();
			Height = binaryReader.ReadUInt16();
		}

		public void Serialize(BinaryWriter binaryWriter)
		{
			binaryWriter.Write(DX);
			binaryWriter.Write(DY);
			binaryWriter.Write(Width);
			binaryWriter.Write(Height);
		}

		public override string ToString()
		{
			return $"X: {DX}, Y: {DY}, W: {Width}, H: {Height}";
		}

		#endregion
	}
}

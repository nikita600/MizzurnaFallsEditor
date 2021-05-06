using MizzurnaFallsEditor.Assets.MeshAssets;
using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Assets
{
	public sealed class MeshAsset : Asset
	{
		#region Fields
		
		private ushort _objectsCount;
		private readonly List<MeshObjectEntry> _objectEntries = new List<MeshObjectEntry>();

		public readonly TmdAsset TmdAsset = new TmdAsset();

		#endregion

		#region Public

		public override void Deserialize(byte[] bytes)
		{
			_objectEntries.Clear();

			_bytes = bytes;

			using (var memoryStream = new MemoryStream(bytes))
			{
				using (var binaryReader = new BinaryReader(memoryStream))
				{
					binaryReader.ReadUInt16(); // signature

					_objectsCount = binaryReader.ReadUInt16();

					for (var i = 0; i < _objectsCount; ++i)
					{
						var objectEntry = new MeshObjectEntry();
						objectEntry.Deserialize(binaryReader);

						_objectEntries.Add(objectEntry);
					}

					var tmdSize = memoryStream.Length - memoryStream.Position;
					var tmdBytes = binaryReader.ReadBytes((int)tmdSize);

					TmdAsset.Deserialize(tmdBytes);
				}
			}
		}

		public override byte[] Serialize()
		{
			return _bytes;
		}

		#endregion

		#region Nested
		
		public class MeshObjectEntry
		{
			public short ObjectOrder;
			public short PositionX;
			public short PositionY;
			public short PositionZ;

			public int Unknown03;
			public int Unknown04;

			public void Deserialize(BinaryReader binaryReader)
			{
				ObjectOrder = binaryReader.ReadInt16();
				PositionX = binaryReader.ReadInt16();
				PositionY = binaryReader.ReadInt16();
				PositionZ = binaryReader.ReadInt16();

				Unknown03 = binaryReader.ReadInt32();
				Unknown04 = binaryReader.ReadInt32();
			}

            public override string ToString()
            {
				return $"Order: {ObjectOrder}, X: {PositionX}, Y: {PositionY}, Z: {PositionZ}, Unk1: {Unknown03}, Unk2: {Unknown04}";
            }
        }

		#endregion
	}
}

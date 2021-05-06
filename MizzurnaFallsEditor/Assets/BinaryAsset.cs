namespace MizzurnaFallsEditor.Assets
{
	public sealed class BinaryAsset : Asset
	{
		#region Public

		public override byte[] Serialize()
		{
			return _bytes;
		}

		public override void Deserialize(byte[] bytes)
		{
			_bytes = bytes;
		}
		
		#endregion
	}
}

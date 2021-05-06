using System;

namespace MizzurnaFallsEditor.Attributes
{
	public sealed class AssetDataAttribute : Attribute
	{
		#region Fields
		
		public readonly uint[] Signatures;

		#endregion

		#region Public

		public AssetDataAttribute(uint signature)
		{
			Signatures = new uint[] { signature };
		}

		public AssetDataAttribute(uint[] signatures)
		{
			Signatures = signatures;
		}

		#endregion
	}
}

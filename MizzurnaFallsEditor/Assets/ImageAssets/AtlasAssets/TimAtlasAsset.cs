using MizzurnaFallsEditor.Assets.ImageAssets;

namespace MizzurnaFallsEditor.Assets
{
	public class TimAtlasAsset : TimAsset
	{
		#region Methods

		public static bool IsTimAtlas(string name)
		{
			return TimAtlasEntries.IsContains(name);
		}

		public TimAsset GetSubTimAsset(int entryIndex)
		{
			if (TimAtlasEntries.TryGetTimEntry(Name, entryIndex, out var entry))
			{
				var clutEntries = ClutData.GetClutEntries(entry.ClutX, entry.ClutY, entry.BppMode);
				var pixelsData = PixelData.GetPixelRegion(entry.BppMode, entry.X, entry.Y, entry.Width, entry.Height);

				return Create(entry.BppMode, clutEntries, (ushort)entry.Width, (ushort)entry.Height, pixelsData);
			}

			return null;
		}

		public void SetSubTimAsset(int entryIndex, TimAsset timAsset)
		{
			if (TimAtlasEntries.TryGetTimEntry(Name, entryIndex, out var entry))
			{
				var pixels = timAsset.PixelData.Pixels;
				PixelData.SetPixelRegion(entry.BppMode, entry.X, entry.Y, entry.Width, entry.Height, timAsset.PixelData.VramData.Width, pixels);
			}
		}

		#endregion
	}
}

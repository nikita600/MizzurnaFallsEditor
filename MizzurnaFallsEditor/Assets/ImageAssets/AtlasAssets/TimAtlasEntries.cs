using System;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace MizzurnaFallsEditor.Assets.ImageAssets
{
	public static class TimAtlasEntries
	{
		#region Constants

		private static string PathToTimAtlasEntries = "..\\Resources\\TimAtlasEntries.json";

		#endregion

		#region Fields

		private static Dictionary<string, TimEntry[]> _timEntries = new Dictionary<string, TimEntry[]>()
		{
			{
				"0171",
				new[]
				{
					new TimEntry("GameOver", TimBppMode.Bpp4, 0, 0, 128, 64, 0),
					new TimEntry("Continue/Exit", TimBppMode.Bpp4, 0, 64, 40, 64, 0)
				}
			},
			{
				"0172",
				new[]
				{
					//new TimEntry("Background", 0, 0, 640 / 2, 180, TimBppMode.Bpp15, 0),
					
					new TimEntry("File A", TimBppMode.Bpp8, 0, 180, 32, 48, 0x3FD4),
					new TimEntry("File B", TimBppMode.Bpp8, 32, 180, 32, 48, 0x3FD4),
					new TimEntry("File C", TimBppMode.Bpp8, 64, 180, 32, 48, 0x3FD4),
					new TimEntry("Press Start", TimBppMode.Bpp8, 192, 180, 64, 16, 0x3DD4),
					new TimEntry("Human", TimBppMode.Bpp8, 256, 180, 150, 52, 0x3F94),
					new TimEntry("Screen Adjust", TimBppMode.Bpp4, 640, 0, 160, 240, 0x3FE4),
					new TimEntry("New Game", TimBppMode.Bpp8, 800, 0, 80, 48, 0x3E14),
					new TimEntry("Load", TimBppMode.Bpp8, 800, 48, 80, 48, 0x3F54),
					new TimEntry("Adjust Screen", TimBppMode.Bpp8, 800, 96, 80, 48, 0x3ED4),
					new TimEntry("Adjust Screen", TimBppMode.Bpp8, 800, 144, 80, 48, 0x3ED4),
					new TimEntry("MF logo", TimBppMode.Bpp8, 896, 0, 144, 38, 0x3F14),
					new TimEntry("jap", TimBppMode.Bpp8, 896, 38, 144, 16, 0x3E94),
					new TimEntry("jap", TimBppMode.Bpp8, 896, 54, 144, 30, 0x3E94),
					new TimEntry("mem card 1", TimBppMode.Bpp8, 896, 85, 144, 32, 0x3E94),
					new TimEntry("mem card 2", TimBppMode.Bpp8, 896, 117, 144, 32, 0x3E94),
					new TimEntry("jap", TimBppMode.Bpp8, 896, 150, 144, 32, 0x3E94),
					new TimEntry("jap", TimBppMode.Bpp8, 896, 182, 144, 32, 0x3E94),
					new TimEntry("Vibration On", TimBppMode.Bpp8, 1056, 0, 80, 16, 0x3D94),
					new TimEntry("Vibration On", TimBppMode.Bpp8, 1056, 16, 80, 16, 0x3D94),
					new TimEntry("Vibration Off", TimBppMode.Bpp8, 1056, 32, 80, 16, 0x3D94),
					new TimEntry("Vibration Off", TimBppMode.Bpp8, 1056, 48, 80, 16, 0x3D94),
					new TimEntry("Try Again", TimBppMode.Bpp4, 1152, 0, 64, 16, 0x3E94),
					new TimEntry("Human 1998", TimBppMode.Bpp4, 1152, 16, 64, 16, 0x3E94),
				}
			},
			{
				"0319", // Clut: x 0x28, y 0x1F0
                new[]
				{
					new TimEntry("Matthew", TimBppMode.Bpp8, 0, 0, 64, 80, 0x7F68),
					new TimEntry("Mogan", TimBppMode.Bpp8, 64, 0, 64, 80, 0x7C28),
					new TimEntry("Robert", TimBppMode.Bpp8, 128, 0, 64, 80, 0x7CE8),
					new TimEntry("Haddson", TimBppMode.Bpp8, 192, 0, 64, 80, 0x7D68),
					new TimEntry("Steve", TimBppMode.Bpp8, 256, 0, 64, 80, 0x7E68),
					new TimEntry("Bone Head", TimBppMode.Bpp8, 320, 0, 64, 80, 0x7C28),
					new TimEntry("Barbara", TimBppMode.Bpp8, 384, 0, 64, 80, 0x7E28),
					new TimEntry("Sarah", TimBppMode.Bpp8, 448, 0, 64, 80, 0x7EE8),

					new TimEntry("Sammuel", TimBppMode.Bpp8, 0, 80, 64, 80, 0x7DA8),
					new TimEntry("James", TimBppMode.Bpp8, 64, 80, 64, 80, 0x7C68),
					new TimEntry("Couenn", TimBppMode.Bpp8, 128, 80, 64, 80, 0x7D68),
					new TimEntry("Rolein", TimBppMode.Bpp8, 192, 80, 64, 80, 0x7D28),
					new TimEntry("Mel", TimBppMode.Bpp8, 256, 80, 64, 80, 0x7D28),
					new TimEntry("Dennis", TimBppMode.Bpp8, 320, 80, 64, 80, 0x7E68),
					new TimEntry("Wolf", TimBppMode.Bpp8, 384, 80, 64, 80, 0x7E68),
					new TimEntry("Isabella", TimBppMode.Bpp8, 448, 80, 64, 80, 0x7E28),

					new TimEntry("Isabella (Alt)", TimBppMode.Bpp8, 0, 160, 64, 80, 0x7CA8),
					new TimEntry("Lidds", TimBppMode.Bpp8, 64, 160, 64, 80, 0x7DA8),
					new TimEntry("Burton", TimBppMode.Bpp8, 128, 160, 64, 80, 0x7C28),
					new TimEntry("Nozz", TimBppMode.Bpp8, 192, 160, 64, 80, 0x7CE8),
					new TimEntry("Loretta", TimBppMode.Bpp8, 256, 160, 64, 80, 0x7DA8),
					new TimEntry("Winona", TimBppMode.Bpp8, 320, 160, 64, 80, 0x7CA8),
					new TimEntry("Emma", TimBppMode.Bpp8, 384, 160, 64, 80, 0x7F28),
					new TimEntry("Emprty", TimBppMode.Bpp8, 448, 160, 64, 80, 0x0000),
				}
			}

		};

		#endregion

		#region Constructor

		static TimAtlasEntries()
		{
			ReloadTimEntries();
		}

		#endregion

		#region Methods

		public static bool IsContains(string name)
		{
			ReloadTimEntries();
			return _timEntries.ContainsKey(name);
		}

		public static TimEntry[] GetEntries(string name)
		{
			ReloadTimEntries();
			if (_timEntries.TryGetValue(name, out var entries))
			{
				return entries;
			}

			return Array.Empty<TimEntry>();
		}

		public static bool TryGetTimEntry(string name, int index, out TimEntry timEntry)
		{
			ReloadTimEntries();
			if (_timEntries.TryGetValue(name, out var entries) && index < entries.Length)
			{
				timEntry = entries[index];
				return true;
			}

			timEntry = null;
			return false;
		}

		private static void ReloadTimEntries()
		{
			if (!File.Exists(PathToTimAtlasEntries))
			{
				var data = JsonConvert.SerializeObject(_timEntries, Formatting.Indented);
				File.WriteAllText(PathToTimAtlasEntries, data);

				return;
			}

			var jsonData = File.ReadAllText(PathToTimAtlasEntries);
			_timEntries = JsonConvert.DeserializeObject<Dictionary<string, TimEntry[]>>(jsonData);
		}

		#endregion

		#region Nested

		public class TimEntry
		{
			public string Name;

			[JsonConverter(typeof(StringEnumConverter))]
			public TimBppMode BppMode;

			public int X;
			public int Y;
			public int Width;
			public int Height;

			public ushort ClutX;
			public ushort ClutY;

			public ushort ClutOffset => (ushort)(((ClutX >> 4) & 0x3F) | ((ClutY << 6) & 0xFFC0));

			public TimEntry()
			{

			}

			public TimEntry(string name, TimBppMode bppMode, int x, int y, int width, int height, ushort clutOffset)
			{
				Name = name;
				X = bppMode == TimBppMode.Bpp4 ? x * 2 : x;
				Y = y;
				Width = bppMode == TimBppMode.Bpp4 ? width * 2 : width;
				Height = height;
				BppMode = bppMode;

				ClutX = (ushort)((clutOffset & 0x3F) << 4);
				ClutY = (ushort)((clutOffset & 0xFFC0) >> 6);
			}
		}

		#endregion
	}
}

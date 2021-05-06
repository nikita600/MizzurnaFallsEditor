using System;
using System.Collections.Generic;
using System.IO;
using MizzurnaFallsEditor.Assets.OutlineAssets;
using MizzurnaFallsEditor.Attributes;

namespace MizzurnaFallsEditor.Assets
{
    [AssetData(0x004F464D)]
    public sealed class MfoAsset : Asset
    {
        #region Constants
        
		private const int Signature = 0x004F464D;

		#endregion

		#region Fields

		private byte _defaultCharacterWidth = 0;
        private byte _defaultCharacterHeight = 0;
        private byte _xOffsetPerCharacter = 0;
        private byte _yOffsetPerCharacter = 0;
		
        private readonly List<MfoPaletteEntry> _paletteEntries = new List<MfoPaletteEntry>();
        private readonly List<MfoCharacterEntry> _characterEntries = new List<MfoCharacterEntry>();

		#endregion

		#region Properties

		public byte DefaultCharacterWidth
		{
			get => _defaultCharacterWidth;
			set => _defaultCharacterWidth = value;
		}

		public byte DefaultCharacterHeight
		{
			get => _defaultCharacterHeight;
			set => _defaultCharacterHeight = value;
		}

		public byte XOffsetPerCharacter
		{
			get => _xOffsetPerCharacter;
			set => _xOffsetPerCharacter = value;
		}

		public byte YOffsetPerCharacter
		{
			get => _yOffsetPerCharacter;
			set => _yOffsetPerCharacter = value;
		}

		public List<MfoPaletteEntry> PaletteEntries => _paletteEntries;

		public List<MfoCharacterEntry> CharacterEntries => _characterEntries;

		#endregion

		#region Public

		public override byte[] Serialize()
        {
			using (var memoryStream = new MemoryStream())
			{
				using (var binaryWriter = new BinaryWriter(memoryStream))
				{
					binaryWriter.Write(Signature);

					binaryWriter.Write(_defaultCharacterWidth);
					binaryWriter.Write(_defaultCharacterHeight);
					binaryWriter.Write(_xOffsetPerCharacter);
					binaryWriter.Write(_yOffsetPerCharacter);

					var serializedPaletteEntries = SerializePaletteEntries();
					
					binaryWriter.Write(serializedPaletteEntries.Length);
					binaryWriter.Write((ushort)_characterEntries.Count);
					binaryWriter.Write((ushort)_paletteEntries.Count);
					binaryWriter.Write(serializedPaletteEntries);

					var serializeCharacterEntries = SerializeCharacterEntries();
					binaryWriter.Write(serializeCharacterEntries);
				}

				return memoryStream.ToArray();
			}
        }

        public override void Deserialize(byte[] bytes)
        {
            _bytes = bytes;

            using (var memoryStream = new MemoryStream(bytes))
            {
                using (var binaryReader = new BinaryReader(memoryStream))
                {
                    binaryReader.ReadInt32(); // read MagicWord

                    _defaultCharacterWidth = binaryReader.ReadByte();
                    _defaultCharacterHeight = binaryReader.ReadByte();
                    _xOffsetPerCharacter = binaryReader.ReadByte();
                    _yOffsetPerCharacter = binaryReader.ReadByte();

	                binaryReader.ReadInt32(); // read characterEntriesOffset

                    var charactersCount = binaryReader.ReadInt16();
                    var paletteCount = binaryReader.ReadInt16();
                    
                    DeserializePaletteEntries(memoryStream, binaryReader, paletteCount);
                    DeserializeCharacterEntries(memoryStream, binaryReader, charactersCount);
                }
            }
        }

		public void AddCharacterEntry(TimAsset timAsset)
		{
			var characterEntry = new MfoCharacterEntry(-1);
			characterEntry.SetTimPixelData(timAsset);

			_characterEntries.Add(characterEntry);
		}

        public void DeleteCharacterEntry(int characterIndex)
        {
			_characterEntries.RemoveAt(characterIndex);
		}
        
		public List<MfoCharacterEntry> GetCharacterEntries(IEnumerable<short> rawText)
		{
			var characters = new List<MfoCharacterEntry>();
			foreach (var code in rawText)
			{
				var uCode = (ushort)(code & 0x0000FFFF);
				if (0xA000 <= uCode && uCode <= 0xAFFF)
				{
					var index = uCode - 0xA000;
					if (index < _characterEntries.Count)
					{
						var charEntry = _characterEntries[index];
						characters.Add(charEntry);
					}
				}
				else
				{
					characters.Add(new MfoCharacterEntry(uCode, uCode == 0xFF6E, uCode == 0xFF70));
				}
			}

			return characters;
		}

		public MfoCharacterEntry GetCharacterEntry(short charCode)
		{
			foreach (var entry in _characterEntries)
			{
				if (entry.Code == (ushort)charCode)
				{
					return entry;
				}
			}

			return null;
		}

		public int GetWidth(IEnumerable<short> rawText)
		{
			var width = 0;
			var characters = GetCharacterEntries(rawText);
			foreach (var entry in characters)
			{
				width += entry.Width;
			}

			return width;
		}

        #endregion

        #region Private

        private byte[] SerializePaletteEntries()
        {
	        var paletteCount = _paletteEntries.Count;
	        var paletteOffsets = new int[paletteCount];
	        using (var paletteStream = new MemoryStream())
	        {
		        using (var paletteWriter = new BinaryWriter(paletteStream))
		        {
			        for (var i = 0; i < paletteCount; ++i)
			        {
				        paletteOffsets[i] = (int)paletteStream.Position;
				        _paletteEntries[i].Serialize(paletteWriter);
			        }
		        }

		        var paletteBytes = paletteStream.ToArray();
		        using (var memoryStream = new MemoryStream())
		        {
			        using (var binaryWriter = new BinaryWriter(memoryStream))
			        {
				        for (var i = 0; i < paletteCount; ++i)
				        {
					        binaryWriter.Write(paletteOffsets[i]);
					        binaryWriter.Write(0);
				        }
			        
				        binaryWriter.Write(paletteBytes);
			        }

			        return memoryStream.ToArray();
		        }
	        }
        }

        private byte[] SerializeCharacterEntries()
        {
	        var charactersCount = _characterEntries.Count;
	        var characterOffsets = new int[charactersCount];
	        using (var characterStream = new MemoryStream())
	        {
		        using (var characterWriter = new BinaryWriter(characterStream))
		        {
			        for (var i = 0; i < charactersCount; ++i)
			        {
				        characterOffsets[i] = (int)characterStream.Position;
				        _characterEntries[i].SerializePixelData(characterWriter);
			        }
		        }

		        var characterEntriesBytes = characterStream.ToArray();

		        using (var memoryStream = new MemoryStream())
		        {
			        using (var binaryWriter = new BinaryWriter(memoryStream))
			        {
				        for (var i = 0; i < charactersCount; ++i)
				        {
					        binaryWriter.Write(characterOffsets[i]);
					        _characterEntries[i].SerializeData(binaryWriter);
				        }
				        
				        binaryWriter.Write(characterEntriesBytes);
			        }

			        return memoryStream.ToArray();
		        }
	        }
        }
        
        private void DeserializePaletteEntries(Stream memoryStream, BinaryReader binaryReader, int paletteCount)
        {
	        var paletteOffsets = new int[paletteCount];
	        for (var i = 0; i < paletteCount; ++i)
	        {
		        paletteOffsets[i] = binaryReader.ReadInt32();
		        binaryReader.ReadInt32(); // unknown (zero)
	        }

	        _paletteEntries.Clear();
	        var paletteDataPosition = memoryStream.Position;
	        for (var i = 0; i < paletteCount; ++i)
	        {
		        memoryStream.Position = paletteDataPosition + paletteOffsets[i];
						
		        var paletteEntry = new MfoPaletteEntry();
		        paletteEntry.Deserialize(binaryReader);
		        _paletteEntries.Add(paletteEntry);
	        }
        }

        private void DeserializeCharacterEntries(Stream memoryStream, BinaryReader binaryReader, int charactersCount)
        {
	        _characterEntries.Clear();
	        var characterOffsets = new int[charactersCount];
	        for (var i = 0; i < charactersCount; ++i)
	        {
		        characterOffsets[i] = binaryReader.ReadInt32();
						
		        var characterEntry = new MfoCharacterEntry(i);
		        characterEntry.DeserializeData(binaryReader);
		        _characterEntries.Add(characterEntry);
	        }

	        var pixelDataPosition = memoryStream.Position;
	        for (var i = 0; i < charactersCount; ++i)
	        {
		        memoryStream.Position = pixelDataPosition + characterOffsets[i];
						
		        var characterEntry = _characterEntries[i];
		        characterEntry.DeserializePixelData(binaryReader);
	        }
        }
        
        #endregion
    }
}
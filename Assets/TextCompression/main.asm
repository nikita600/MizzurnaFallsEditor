; -----------------------------------------------------------------------------

.psx
.Open "!SLPS017.83", "SLPS017.83", 0x8000F800


; -----------------------------------------------------------------------------

USE_MDD:
USE_VWF:
;LOG_MEM_MGR:

; -----------------------------------------------------------------------------

.definelabel GetClut, 						0x800563EC
.definelabel GetTPage,						0x800563AC
.definelabel GsGetActiveBuff, 				0x80056B6C
.definelabel GsSetRefView2, 				0x80057E4C
.definelabel GsSetProjection,				0x8005743C

.definelabel Krom2RawAdd2, 					0x80055C4C
.definelabel LoadImage, 					0x80053214
.definelabel LoadImage2, 					0x80055790

.definelabel renderText_copyImageToBuffer, 	0x80033EE4
.definelabel renderTextSub01_05, 			0x80034138

.definelabel sub_80023154, 					0x80023154
.definelabel loadAllFonts, 					0x8003D3B0
.definelabel sub_8003e32c, 					0x8003e32c
.definelabel sub_80025e58, 					0x80025e58
.definelabel sub_8003e81c, 					0x8003e81c
.definelabel sub_8003d6e0, 					0x8003d6e0
.definelabel sub_80048564, 					0x80048564
.definelabel sub_80035864, 					0x80035864
.definelabel sub_80035cc0, 					0x80035cc0
.definelabel sub_8003e4a0, 					0x8003e4a0
.definelabel sub_8001a770, 					0x8001a770
.definelabel sub_8003ded8, 					0x8003ded8
.definelabel renderText_00, 				0x80035928
.definelabel sub_80048574, 					0x80048574
.definelabel sub_8004fd8c, 					0x8004fd8c
.definelabel sub_800358dc, 					0x800358dc
.definelabel sub_80025e64, 					0x80025e64
.definelabel sub_80019f0c, 					0x80019f0c

.definelabel renderTextUnknown01, 			0x80035B30

.definelabel mm_alloc_NG, 					0x8004FC68
.definelabel loadFontData, 					0x800342D8

.definelabel sub_8004FFFC,					0x8004FFFC
.definelabel printf, 						0x8005143c

.definelabel getActiveBufIndex, 			0x8001A77C
.definelabel AddPrim, 						0x8005640c

.definelabel dword_800A3508, 				0x800A3508
.definelabel unk_80101ED0,   				0x80101ED0
.definelabel dword_800A341C, 				0x800A341C
.definelabel dword_800A3420, 				0x800A3420
.definelabel dword_800A3300, 				0x800A3300
.definelabel dword_800A32FC, 				0x800A32FC
.definelabel dword_800A39D0, 				0x800A39D0
.definelabel InitHeap, 						0x8007A13C
.definelabel main, 							0x8004F480
.definelabel dword_800A32F8, 				0x800A32F8

.definelabel customCodeSize,				0x800
.definelabel dynamicMemoryStart, 			0x8010CC00

.definelabel dynamicMemoryEnd, 				0x801FE000
.definelabel dynamicMemorySize,				dynamicMemoryEnd - dynamicMemoryStart

.definelabel MemCardInit,  0x8007A14C
.definelabel MemCardStart, 0x8007A198
.definelabel sub_80038AD0, 0x80038AD0
.definelabel sub_8004F674, 0x8004F674
.definelabel sub_8004FB7C, 0x8004FB7C
.definelabel sub_8004FC10, 0x8004FC10

; ---------------------------------- PATCHES ---------------------------------

.headersize 0x8000F800

;80051e9c-80051ed8 - SetDumpFnt, no usings
;80051edc-80051f78 - FntLoad, no usings
;80051f7c-80052230 - FntOpen, no usings
;80052234-8005254c - FntFlush, using at: 80014b5c
.org 0x80051e9c
.area 0x6B4

	@renderText_01_patches: ; 8000B3F0 - 8000B100 = 2F0
		.include "src\renderText01\renderText_01_patches.asm"
	@renderText_01_renderChar_patches: ; 8000B420 - 8000B3F0 = 30
		.include "src\renderText01\renderText_01_renderChar_patches.asm"

	@renderText_02_GetStringOffset: ;8000B590 - 8000B420 = 170
		.include "src\renderText02\renderText_02_GetStringOffset.asm"
	@renderText_02_DecompressCharacter: ;8000B690 - 8000B590 = 100
		.include "src\renderText02\renderText_02_DecompressCharacter.asm"
	@renderText_02_renderChar_patches: ; 8000B6C4 - 8000B690 = 34
		.include "src\renderText02\renderText_02_renderChar_patches.asm"

.endarea

;80052550-80052918 - FntPrint
;8005291c-80052948 - memset
.org 0x80052550
.area 0x3FC
	jr ra
	nop

	@renderInventory_patches: ; 8000B800 - 8000B6C8 = 58
		.include "src\renderInventory_patches.asm"
	@renderNotebookCharacter_patches: ; 8000B800 - 8000B720 = E0
		.include "src\renderNotebookCharacter_patches.asm"

	@memoryManagerAllocPatches: ; DEBUG
		.include "src\memoryManagerAllocPatches.asm"

.endarea

.org 0x80014b5c
	nop ;jal FntFlush
	nop ;_move a0,v0

; -----------------------------------------------------------------------------

; ------------------------------- ORIGINAL CODE -------------------------------


.include "src\patches.asm"

.org 0x80079FBC
.area 0x118
.include "src\entryPoint.asm"
.endarea

.org 0x8004F42C
.area 0x54
.include "src\setupGame.asm"
.endarea

.org 0x800338D0
.area 0xF8
.include "src\setupGameTextContext.asm"
.endarea

.org 0x800349C4
.area 0x43C
.include "src\renderText01\renderText_01.asm"
.endarea

.org 0x80034E00
.area 0x230
.include "src\renderText01\renderText_01_renderChar.asm"
.endarea

.org 0x8003629C
.area 0xB8
.include "src\renderText01\renderText_01_renderChar_clampPosition.asm"
.endarea

.org 0x80036354
.area 0x88
.include "src\renderText01\renderText_01_renderChar_loadImage.asm"
.endarea

.org 0x80035030
.area 0x238
.include "src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm"
.endarea

.org 0x80035D38
.area 0xFC
.include "src\renderText02\renderText_02.asm"
.endarea

.org 0x80035460
.area 0x1F0
.include "src\renderText02\renderText_02_renderChar.asm"
.endarea

.org 0x8003D904
.area 0x35C
.include "src\renderInventory.asm"
.endarea

.org 0x8003DC60
.area 0x278
.include "src\updateInventory.asm"
.endarea

.org 0x8004D0B8
.area 0x280
.include "src\renderMap.asm"
.endarea

.org 0x8004D850
.area 0xB4
.include "src\renderMapTextPoliceStation.asm"
.endarea

.org 0x8004FC68
.area 0x124
.include "src\memoryManagerAlloc.asm"
.endarea

; -----------------------------------------------------------------------------

.Close

; -----------------------------------------------------------------------------
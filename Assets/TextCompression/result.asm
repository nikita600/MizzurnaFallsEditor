; 28 files included
; 3857 lines
; 515 labels
; 296 equations

; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm
; src\renderText01\renderText_01_patches.asm
; src\renderText01\renderText_01_getStringEntryOffset.asm
; src\renderText01\renderText_01_getStringPosition.asm
; src\renderText01\renderText_01_decompressCharacter.asm
; src\renderText01\renderText_01_renderChar_patches.asm
; src\renderText02\renderText_02_GetStringOffset.asm
; src\renderText02\renderText_02_DecompressCharacter.asm
; src\renderText02\renderText_02_renderChar_patches.asm
; src\renderInventory_patches.asm
; src\renderNotebookCharacter_patches.asm
; src\memoryManagerAllocPatches.asm
; src\patches.asm
; src\entryPoint.asm
; src\setupGame.asm
; src\setupGameTextContext.asm
; src\renderText01\renderText_01.asm
; src\renderText01\renderText_01_renderChar.asm
; src\renderText01\renderText_01_renderChar_clampPosition.asm
; src\renderText01\renderText_01_renderChar_loadImage.asm
; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm
; src\renderText02\renderText_02.asm
; src\renderText02\renderText_02_renderChar.asm
; src\renderInventory.asm
; src\updateInventory.asm
; src\renderMap.asm
; src\renderMapTextPoliceStation.asm
; src\memoryManagerAlloc.asm

FFFFFFFF .psx                                                         ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 3
FFFFFFFF .open "!SLPS017.83","SLPS017.83",0x8000F800                  ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 4
8000F800 use_mdd:                                                     ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 9
8000F800 use_vwf:                                                     ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 10
800563EC getclut:                                                     ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 15
800563AC gettpage:                                                    ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 16
80056B6C gsgetactivebuff:                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 17
80057E4C gssetrefview2:                                               ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 18
8005743C gssetprojection:                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 19
80055C4C krom2rawadd2:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 21
80053214 loadimage:                                                   ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 22
80055790 loadimage2:                                                  ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 23
80033EE4 rendertext_copyimagetobuffer:                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 25
80034138 rendertextsub01_05:                                          ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 26
80023154 sub_80023154:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 28
8003D3B0 loadallfonts:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 29
8003E32C sub_8003e32c:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 30
80025E58 sub_80025e58:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 31
8003E81C sub_8003e81c:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 32
8003D6E0 sub_8003d6e0:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 33
80048564 sub_80048564:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 34
80035864 sub_80035864:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 35
80035CC0 sub_80035cc0:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 36
8003E4A0 sub_8003e4a0:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 37
8001A770 sub_8001a770:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 38
8003DED8 sub_8003ded8:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 39
80035928 rendertext_00:                                               ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 40
80048574 sub_80048574:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 41
8004FD8C sub_8004fd8c:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 42
800358DC sub_800358dc:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 43
80025E64 sub_80025e64:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 44
80019F0C sub_80019f0c:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 45
80035B30 rendertextunknown01:                                         ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 47
8004FC68 mm_alloc_ng:                                                 ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 49
800342D8 loadfontdata:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 50
8004FFFC sub_8004fffc:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 52
8005143C printf:                                                      ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 53
8001A77C getactivebufindex:                                           ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 55
8005640C addprim:                                                     ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 56
800A3508 dword_800a3508:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 58
80101ED0 unk_80101ed0:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 59
800A341C dword_800a341c:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 60
800A3420 dword_800a3420:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 61
800A3300 dword_800a3300:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 62
800A32FC dword_800a32fc:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 63
800A39D0 dword_800a39d0:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 64
8007A13C initheap:                                                    ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 65
8004F480 main:                                                        ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 66
800A32F8 dword_800a32f8:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 67
00000800 customcodesize:                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 69
8010CC00 dynamicmemorystart:                                          ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 70
801FE000 dynamicmemoryend:                                            ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 72
000F1400 dynamicmemorysize:                                           ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 73
8007A14C memcardinit:                                                 ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 75
8007A198 memcardstart:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 76
80038AD0 sub_80038ad0:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 77
8004F674 sub_8004f674:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 78
8004FB7C sub_8004fb7c:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 79
8004FC10 sub_8004fc10:                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 80
8000F800 .headersize 0x8000F800                                       ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 84
8000F800 .org 0x80051E9C                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 90
80051E9C .area 0x000006B4                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 91
80051E9C @rendertext_01_patches:                                      ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 93
800349EC start_mdt_read:                                              ; src\renderText01\renderText_01_getStringEntryOffset.asm line 19
80034A04 check_string_index:                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 20
80051E9C gettextentryoffset:                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 24
80051E9C @push_registers_to_stack:                                    ; src\renderText01\renderText_01_getStringEntryOffset.asm line 26
80051E9C    sw      s5,0x38(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 27
80051EA0    sw      s6,0x3C(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 28
80051EA4    sw      s7,0x40(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 29
80051EA8 @setup_mdd_context:                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 31
80051EA8    lui     s5,-0x7FFF                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 32
80051EAC    addiu   s5,-0x4F10                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 32
80051EB0 @get_mdt_offset:                                             ; src\renderText01\renderText_01_getStringEntryOffset.asm line 34
80051EB0    lw      s6,0x8(s3)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 35
80051EB4    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 36
80051EB8    lw      s6,0x0(s6)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 37
80051EBC    ori     v0,r0,0x4                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 38
80051EC0    addu    s7,s6,v0                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 39
80051EC4 @check_is_mdt:                                               ; src\renderText01\renderText_01_getStringEntryOffset.asm line 41
80051EC4    lw      v0,0x0(s6)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 42
80051EC8    lui     v1,0x54                                           ; src\renderText01\renderText_01_getStringEntryOffset.asm line 43
80051ECC    addiu   v1,0x444D                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 43
80051ED0    bne     v0,v1,0x80051EF0                                  ; src\renderText01\renderText_01_getStringEntryOffset.asm line 44
80051ED4    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 45
80051ED8 @continue_mdt_mode:                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 49
80051ED8    ori     v0,r0,0x1                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 50
80051EDC    sh      v0,0x34(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 51
80051EE0    sb      zero,0x8(s5)                                      ; src\renderText01\renderText_01_getStringEntryOffset.asm line 52
80051EE4    lhu     a2,0x0(s3)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 54
80051EE8    j       0x800349EC                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 55
80051EEC    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 56
80051EF0 @start_mdd_mode:                                             ; src\renderText01\renderText_01_getStringEntryOffset.asm line 60
80051EF0    sh      zero,0x34(sp)                                     ; src\renderText01\renderText_01_getStringEntryOffset.asm line 61
80051EF4 @get_left_nodes_ptr:                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 65
80051EF4    jal     0x80051F34                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 66
80051EF8    ori     v0,r0,0x14                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 67
80051EFC    sw      v0,0x28(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 68
80051F00 @get_right_nodes_ptr:                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 72
80051F00    jal     0x80051F34                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 73
80051F04    ori     v0,r0,0x1C                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 74
80051F08    sw      v0,0x2C(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 75
80051F0C @get_char_nodes_ptr:                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 79
80051F0C    jal     0x80051F34                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 80
80051F10    ori     v0,r0,0x24                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 81
80051F14    sw      v0,0x30(sp)                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 82
80051F18 @load_str_entry_pos:                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 86
80051F18    lhu     a2,0x0(s3)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 87
80051F1C    lw      v0,0x4(s6)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 88
80051F20    lw      a0,0x8(s6)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 89
80051F24    sll     a1,a2,0x2                                         ; src\renderText01\renderText_01_getStringEntryOffset.asm line 90
80051F28    addu    a0,s7                                             ; src\renderText01\renderText_01_getStringEntryOffset.asm line 91
80051F2C    j       0x80034A04                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 92
80051F30    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 93
80051F34 @get_mdd_offset_to_v0:                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 97
80051F34    add     v0,v0,s6                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 98
80051F38    lw      v1,0x0(v0)                                        ; src\renderText01\renderText_01_getStringEntryOffset.asm line 99
80051F3C    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 100
80051F40    addu    v0,s7,v1                                          ; src\renderText01\renderText_01_getStringEntryOffset.asm line 101
80051F44    jr      ra                                                ; src\renderText01\renderText_01_getStringEntryOffset.asm line 102
80051F48    nop                                                       ; src\renderText01\renderText_01_getStringEntryOffset.asm line 103
80034A74 load_mdt_offset:                                             ; src\renderText01\renderText_01_getStringPosition.asm line 17
80034A88 setup_mdt_render:                                            ; src\renderText01\renderText_01_getStringPosition.asm line 18
80051F4C getstringposition:                                           ; src\renderText01\renderText_01_getStringPosition.asm line 22
80051F4C @is_mdt_mode_str_pos:                                        ; src\renderText01\renderText_01_getStringPosition.asm line 24
80051F4C    lhu     v0,0x34(sp)                                       ; src\renderText01\renderText_01_getStringPosition.asm line 25
80051F50    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 26
80051F54    beqz    v0,0x80051F6C                                     ; src\renderText01\renderText_01_getStringPosition.asm line 27
80051F58    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 28
80051F5C    lw      v0,0x8(s3)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 30
80051F60    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 31
80051F64    j       0x80034A74                                        ; src\renderText01\renderText_01_getStringPosition.asm line 32
80051F68    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 33
80051F6C @get_stringpositionmdd:                                      ; src\renderText01\renderText_01_getStringPosition.asm line 37
80051F6C @load_bit_count:                                             ; src\renderText01\renderText_01_getStringPosition.asm line 39
80051F6C    lw      v0,0xC(s6)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 40
80051F70    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 41
80051F74    addu    v0,v0,s7                                          ; src\renderText01\renderText_01_getStringPosition.asm line 42
80051F78    addu    v0,v0,a2                                          ; src\renderText01\renderText_01_getStringPosition.asm line 43
80051F7C    lbu     v0,0x0(v0)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 44
80051F80    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 45
80051F84    sb      v0,0x4(s5)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 46
80051F88 @load_string_position:                                       ; src\renderText01\renderText_01_getStringPosition.asm line 48
80051F88    lw      v0,0x10(s6)                                       ; src\renderText01\renderText_01_getStringPosition.asm line 49
80051F8C    lhu     v1,0x0(s4)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 50
80051F90    addu    v0,s7,v0                                          ; src\renderText01\renderText_01_getStringPosition.asm line 51
80051F94    addu    v0,v1                                             ; src\renderText01\renderText_01_getStringPosition.asm line 52
80051F98    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01_getStringPosition.asm line 53
80051F9C @load_first_string_byte:                                     ; src\renderText01\renderText_01_getStringPosition.asm line 57
80051F9C    lbu     v1,0x0(v0)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 58
80051FA0    addiu   v0,0x1                                            ; src\renderText01\renderText_01_getStringPosition.asm line 59
80051FA4    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01_getStringPosition.asm line 60
80051FA8    lbu     v0,0x4(s5)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 62
80051FAC    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 63
80051FB0    sllv    v1,v0                                             ; src\renderText01\renderText_01_getStringPosition.asm line 64
80051FB4    sb      v1,0x2(s5)                                        ; src\renderText01\renderText_01_getStringPosition.asm line 65
80051FB8    j       0x80034A88                                        ; src\renderText01\renderText_01_getStringPosition.asm line 67
80051FBC    nop                                                       ; src\renderText01\renderText_01_getStringPosition.asm line 68
80034AE0 continue_read_character:                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 7
80034B24 handle_character:                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 8
80051FC0 decompresscharactermdd:                                      ; src\renderText01\renderText_01_decompressCharacter.asm line 12
80051FC0 @is_mdt_mode_char:                                           ; src\renderText01\renderText_01_decompressCharacter.asm line 14
80051FC0    lhu     v0,0x34(sp)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 15
80051FC4    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 16
80051FC8    beqz    v0,0x80051FDC                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 17
80051FCC    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 18
80051FD0    lbu     s2,0x0(a0)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 20
80051FD4    j       0x80034AE0                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 21
80051FD8    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 22
80051FDC @read_prev_char:                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 26
80051FDC    lbu     v0,0x8(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 27
80051FE0    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 28
80051FE4    beqz    v0,0x80052000                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 29
80051FE8    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 30
80051FEC    lhu     s1,0x6(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 32
80051FF0    lbu     s2,0x6(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 33
80051FF4    sb      zero,0x8(s5)                                      ; src\renderText01\renderText_01_decompressCharacter.asm line 34
80051FF8    j       0x80034B24                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 36
80051FFC    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 37
80052000 @read_leaf:                                                  ; src\renderText01\renderText_01_decompressCharacter.asm line 41
80052000    lb      v0,0x4(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 42
80052004    ori     v1,r0,0x8                                         ; src\renderText01\renderText_01_decompressCharacter.asm line 43
80052008    sltu    v0,v1                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 44
8005200C    beqz    v0,0x800520B4                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 45
80052010    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 46
80052014    lb      v0,0x2(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 48
80052018    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 49
8005201C    andi    v1,v0,0x80                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 50
80052020    sll     v0,0x1                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 51
80052024    sb      v0,0x2(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 52
80052028    lbu     v0,0x4(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 54
8005202C    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 55
80052030    addiu   v0,0x1                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 56
80052034    sb      v0,0x4(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 57
80052038    ori     r1,r0,0x80                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 58
8005203C    beq     v1,r1,0x8005204C                                  ; src\renderText01\renderText_01_decompressCharacter.asm line 58
80052040    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 59
80052044 @read_left_nodes:                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 63
80052044    j       0x80052054                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 64
80052048    lw      v0,0x28(sp)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 65
8005204C @read_right_nodes:                                           ; src\renderText01\renderText_01_decompressCharacter.asm line 69
8005204C    j       0x80052054                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 70
80052050    lw      v0,0x2C(sp)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 71
80052054 @load_node_offset:                                           ; src\renderText01\renderText_01_decompressCharacter.asm line 75
80052054    lhu     v1,0x0(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 76
80052058    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 77
8005205C    sll     v1,0x1                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 79
80052060    addu    v0,v1                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 80
80052064    lhu     v0,0x0(v0)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 81
80052068    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 82
8005206C    sh      v0,0x0(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 84
80052070 @check_character_node:                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 88
80052070    ori     v1,r0,-0x8000                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 89
80052074    sltu    v0,v1                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 90
80052078    bnez    v0,0x80052000                                     ; src\renderText01\renderText_01_decompressCharacter.asm line 91
8005207C    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 92
80052080 @read_character:                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 96
80052080    lw      v0,0x30(sp)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 97
80052084    lhu     v1,0x0(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 98
80052088    sh      zero,0x0(s5)                                      ; src\renderText01\renderText_01_decompressCharacter.asm line 99
8005208C    subiu   v1,-0x8000                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 101
80052090    sll     v1,0x1                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 102
80052094    addu    v0,v1                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 103
80052098    lhu     s1,0x0(v0)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 105
8005209C    lbu     s2,0x1(v0)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 106
800520A0    ori     v1,r0,0x1                                         ; src\renderText01\renderText_01_decompressCharacter.asm line 108
800520A4    sb      v1,0x8(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 109
800520A8    sh      s1,0x6(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 110
800520AC    j       0x80034B24                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 112
800520B0    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 113
800520B4 @read_next_byte:                                             ; src\renderText01\renderText_01_decompressCharacter.asm line 117
800520B4    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 118
800520B8    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 119
800520BC    lbu     v1,0x0(v0)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 120
800520C0    addiu   v0,0x1                                            ; src\renderText01\renderText_01_decompressCharacter.asm line 121
800520C4    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 122
800520C8    sb      v1,0x2(s5)                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 123
800520CC    sb      zero,0x4(s5)                                      ; src\renderText01\renderText_01_decompressCharacter.asm line 124
800520D0    j       0x80052000                                        ; src\renderText01\renderText_01_decompressCharacter.asm line 126
800520D4    nop                                                       ; src\renderText01\renderText_01_decompressCharacter.asm line 127
80034DE4 @loc_80034de0:                                               ; src\renderText01\renderText_01_patches.asm line 47
800520D8 return_01:                                                   ; src\renderText01\renderText_01_patches.asm line 49
800520D8    lw      ra,0x24(sp)                                       ; src\renderText01\renderText_01_patches.asm line 50
800520DC    lw      s5,0x38(sp)                                       ; src\renderText01\renderText_01_patches.asm line 52
800520E0    lw      s6,0x3C(sp)                                       ; src\renderText01\renderText_01_patches.asm line 53
800520E4    lw      s7,0x40(sp)                                       ; src\renderText01\renderText_01_patches.asm line 54
800520E8    j       0x80034DE4                                        ; src\renderText01\renderText_01_patches.asm line 55
800520EC    nop                                                       ; src\renderText01\renderText_01_patches.asm line 56
80034C2C @loc_80034c2c:                                               ; src\renderText01\renderText_01_patches.asm line 60
80034C3C @loc_80034c3c:                                               ; src\renderText01\renderText_01_patches.asm line 61
80034D90 @loc_80034d90:                                               ; src\renderText01\renderText_01_patches.asm line 62
800520F0 addstringposition_01:                                        ; src\renderText01\renderText_01_patches.asm line 64
800520F0    lhu     s6,0x34(sp)                                       ; src\renderText01\renderText_01_patches.asm line 65
800520F4    nop                                                       ; src\renderText01\renderText_01_patches.asm line 66
800520F8    bnez    s6,0x8005210C                                     ; src\renderText01\renderText_01_patches.asm line 67
800520FC    nop                                                       ; src\renderText01\renderText_01_patches.asm line 68
80052100 @add_stringposition_01_mdd:                                  ; src\renderText01\renderText_01_patches.asm line 70
80052100    sb      zero,0x8(s5)                                      ; src\renderText01\renderText_01_patches.asm line 71
80052104    j       0x80034D90                                        ; src\renderText01\renderText_01_patches.asm line 72
80052108    nop                                                       ; src\renderText01\renderText_01_patches.asm line 73
8005210C @add_stringposition_01_mdt:                                  ; src\renderText01\renderText_01_patches.asm line 75
8005210C    beqz    v0,0x8005211C                                     ; src\renderText01\renderText_01_patches.asm line 76
80052110    nop                                                       ; src\renderText01\renderText_01_patches.asm line 77
80052114    j       0x80034C2C                                        ; src\renderText01\renderText_01_patches.asm line 78
80052118    nop                                                       ; src\renderText01\renderText_01_patches.asm line 79
8005211C @inc_01:                                                     ; src\renderText01\renderText_01_patches.asm line 81
8005211C    j       0x80034C3C                                        ; src\renderText01\renderText_01_patches.asm line 82
80052120    nop                                                       ; src\renderText01\renderText_01_patches.asm line 83
80034CB4 @loc_80034cb4:                                               ; src\renderText01\renderText_01_patches.asm line 87
80034CC4 @loc_80034cc4:                                               ; src\renderText01\renderText_01_patches.asm line 88
80034CD4 @loc_80034cd4:                                               ; src\renderText01\renderText_01_patches.asm line 89
80052124 addstringposition_02:                                        ; src\renderText01\renderText_01_patches.asm line 91
80052124    lhu     s6,0x34(sp)                                       ; src\renderText01\renderText_01_patches.asm line 92
80052128    nop                                                       ; src\renderText01\renderText_01_patches.asm line 93
8005212C    bnez    s6,0x80052140                                     ; src\renderText01\renderText_01_patches.asm line 94
80052130    nop                                                       ; src\renderText01\renderText_01_patches.asm line 95
80052134 @add_str_pos_2_mdd:                                          ; src\renderText01\renderText_01_patches.asm line 97
80052134    sb      zero,0x8(s5)                                      ; src\renderText01\renderText_01_patches.asm line 98
80052138    j       0x80034CD4                                        ; src\renderText01\renderText_01_patches.asm line 99
8005213C    nop                                                       ; src\renderText01\renderText_01_patches.asm line 100
80052140 @add_str_pos_2_mdt:                                          ; src\renderText01\renderText_01_patches.asm line 102
80052140    beqz    v0,0x80052150                                     ; src\renderText01\renderText_01_patches.asm line 103
80052144    nop                                                       ; src\renderText01\renderText_01_patches.asm line 104
80052148    j       0x80034CB4                                        ; src\renderText01\renderText_01_patches.asm line 105
8005214C    nop                                                       ; src\renderText01\renderText_01_patches.asm line 106
80052150 @inc_02:                                                     ; src\renderText01\renderText_01_patches.asm line 108
80052150    j       0x80034CC4                                        ; src\renderText01\renderText_01_patches.asm line 109
80052154    nop                                                       ; src\renderText01\renderText_01_patches.asm line 110
80034D04 @loc_80034d04:                                               ; src\renderText01\renderText_01_patches.asm line 114
80034D14 @loc_80034d14:                                               ; src\renderText01\renderText_01_patches.asm line 115
80034D24 @loc_80034d24:                                               ; src\renderText01\renderText_01_patches.asm line 116
80052158 addstringposition_03:                                        ; src\renderText01\renderText_01_patches.asm line 118
80052158    lhu     s6,0x34(sp)                                       ; src\renderText01\renderText_01_patches.asm line 119
8005215C    nop                                                       ; src\renderText01\renderText_01_patches.asm line 120
80052160    bnez    s6,0x80052174                                     ; src\renderText01\renderText_01_patches.asm line 121
80052164    nop                                                       ; src\renderText01\renderText_01_patches.asm line 122
80052168 @add_str_pos_3_mdd:                                          ; src\renderText01\renderText_01_patches.asm line 124
80052168    sb      zero,0x8(s5)                                      ; src\renderText01\renderText_01_patches.asm line 125
8005216C    j       0x80034D24                                        ; src\renderText01\renderText_01_patches.asm line 126
80052170    nop                                                       ; src\renderText01\renderText_01_patches.asm line 127
80052174 @add_str_pos_3_mdt:                                          ; src\renderText01\renderText_01_patches.asm line 129
80052174    beqz    v0,0x80052184                                     ; src\renderText01\renderText_01_patches.asm line 130
80052178    nop                                                       ; src\renderText01\renderText_01_patches.asm line 131
8005217C    j       0x80034D04                                        ; src\renderText01\renderText_01_patches.asm line 132
80052180    nop                                                       ; src\renderText01\renderText_01_patches.asm line 133
80052184 @inc_03:                                                     ; src\renderText01\renderText_01_patches.asm line 135
80052184    j       0x80034D14                                        ; src\renderText01\renderText_01_patches.asm line 136
80052188    nop                                                       ; src\renderText01\renderText_01_patches.asm line 137
8005218C @rendertext_01_renderchar_patches:                           ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 95
8005218C rendertextcharacter01_save_mfoentry:                         ; src\renderText01\renderText_01_renderChar_patches.asm line 15
8005218C    lbu     v1,0x7(s3)                                        ; src\renderText01\renderText_01_renderChar_patches.asm line 17
80052190    move    t6,s3                                             ; src\renderText01\renderText_01_renderChar_patches.asm line 18
80052194    jr      ra                                                ; src\renderText01\renderText_01_renderChar_patches.asm line 20
80052198    nop                                                       ; src\renderText01\renderText_01_renderChar_patches.asm line 21
8005219C rendertextcharacter01_patchcharwidth:                        ; src\renderText01\renderText_01_renderChar_patches.asm line 23
8005219C    lbu     v0,0x5(t6)                                        ; src\renderText01\renderText_01_renderChar_patches.asm line 26
800521A0    andi    s1,s2,0xFF                                        ; src\renderText01\renderText_01_renderChar_patches.asm line 27
800521A4    jr      ra                                                ; src\renderText01\renderText_01_renderChar_patches.asm line 29
800521A8    nop                                                       ; src\renderText01\renderText_01_renderChar_patches.asm line 30
800521AC rendertext_loadimage_patchcharwidth:                         ; src\renderText01\renderText_01_renderChar_patches.asm line 32
800521AC    lbu     v0,0x5(t6)                                        ; src\renderText01\renderText_01_renderChar_patches.asm line 35
800521B0    andi    a2,0xFF                                           ; src\renderText01\renderText_01_renderChar_patches.asm line 36
800521B4    jr      ra                                                ; src\renderText01\renderText_01_renderChar_patches.asm line 38
800521B8    nop                                                       ; src\renderText01\renderText_01_renderChar_patches.asm line 39
800521BC @rendertext_02_getstringoffset:                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 98
80035D74 get_string_entry:                                            ; src\renderText02\renderText_02_GetStringOffset.asm line 49
80035D80 check_string_entry_2:                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 50
80035E18 return_2:                                                    ; src\renderText02\renderText_02_GetStringOffset.asm line 51
80035DD8 nextlinehandler_return:                                      ; src\renderText02\renderText_02_GetStringOffset.asm line 52
800521BC nextlinehandler_02:                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 56
800521BC    andi    a1,-0x1                                           ; src\renderText02\renderText_02_GetStringOffset.asm line 57
800521C0    ori     v1,r0,-0x92                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 58
800521C4    bne     v1,a1,0x800521E0                                  ; src\renderText02\renderText_02_GetStringOffset.asm line 59
800521C8    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 60
800521CC    sh      zero,0x24(s3)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 62
800521D0    lhu     v1,0x26(s3)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 64
800521D4    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 65
800521D8    addiu   v1,0x10                                           ; src\renderText02\renderText_02_GetStringOffset.asm line 66
800521DC    sh      v1,0x26(s3)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 67
800521E0 @return:                                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 69
800521E0    andi    v1,a1,-0x1000                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 70
800521E4    ori     v0,r0,-0x6000                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 71
800521E8    j       0x80035DD8                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 72
800521EC    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 73
800521F0 cleanup_02:                                                  ; src\renderText02\renderText_02_GetStringOffset.asm line 77
800521F0 @get_label_width:                                            ; src\renderText02\renderText_02_GetStringOffset.asm line 79
800521F0    lhu     v0,0x24(s3)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 80
800521F4    lhu     v1,0x54(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 81
800521F8    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 82
800521FC    subu    v1,v0,v1                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 83
80052200    sll     v1,0x2                                            ; src\renderText02\renderText_02_GetStringOffset.asm line 84
80052204 @cleanup:                                                    ; src\renderText02\renderText_02_GetStringOffset.asm line 86
80052204    lhu     v0,0x2(s2)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 87
80052208    lw      s6,0x4C(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 88
8005220C    lw      s7,0x50(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 89
80052210    j       0x80035E18                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 90
80052214    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 91
80052218 getstringoffset_02:                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 95
80052218    sh      a2,0x54(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 97
8005221C    sw      s6,0x4C(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 99
80052220    sw      s7,0x50(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 100
80052224    lw      s6,0x14(s3)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 102
80052228    ori     v0,r0,0x4                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 103
8005222C    addu    s7,s6,v0                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 104
80052230 @is_mdt_file:                                                ; src\renderText02\renderText_02_GetStringOffset.asm line 106
80052230    lui     v1,0x54                                           ; src\renderText02\renderText_02_GetStringOffset.asm line 107
80052234    addiu   v1,0x444D                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 107
80052238    lw      v0,0x0(s6)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 108
8005223C    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 109
80052240    bne     v0,v1,0x80052268                                  ; src\renderText02\renderText_02_GetStringOffset.asm line 110
80052244    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 111
80052248 @continue_mdt_mode:                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 113
80052248    ori     v0,r0,0x1                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 114
8005224C    sw      v0,0x28(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 115
80052250    lhu     a0,0x0(s2)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 117
80052254    lw      v0,0x1C(s3)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 118
80052258    lhu     v1,0x2(s2)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 119
8005225C    addu    s0,v0,a0                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 120
80052260    j       0x80035D80                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 122
80052264    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 123
80052268 @start_mdd_mode:                                             ; src\renderText02\renderText_02_GetStringOffset.asm line 127
80052268    sw      zero,0x28(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 128
8005226C    sw      zero,0x2C(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 129
80052270    sw      zero,0x30(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 130
80052274    sw      zero,0x34(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 131
80052278    sw      zero,0x38(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 132
8005227C    sw      zero,0x3C(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 133
80052280    sw      zero,0x40(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 134
80052284    sw      zero,0x44(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 135
80052288    sw      zero,0x48(sp)                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 136
8005228C @get_left_nodes_ptr:                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 140
8005228C    jal     0x80052314                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 141
80052290    ori     v0,r0,0x14                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 142
80052294    sw      v0,0x2C(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 143
80052298 @get_right_nodes_ptr:                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 147
80052298    jal     0x80052314                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 148
8005229C    ori     v0,r0,0x1C                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 149
800522A0    sw      v0,0x30(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 150
800522A4 @get_char_nodes_ptr:                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 154
800522A4    jal     0x80052314                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 155
800522A8    ori     v0,r0,0x24                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 156
800522AC    sw      v0,0x34(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 157
800522B0 @load_bit_count:                                             ; src\renderText02\renderText_02_GetStringOffset.asm line 161
800522B0    srl     v1,a1,0x2                                         ; src\renderText02\renderText_02_GetStringOffset.asm line 162
800522B4    lw      v0,0xC(s6)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 163
800522B8    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 164
800522BC    addu    v0,v0,s7                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 165
800522C0    addu    v0,v0,v1                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 166
800522C4    lbu     v0,0x0(v0)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 167
800522C8    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 168
800522CC    sb      v0,0x40(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 169
800522D0 @load_string_entry:                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 173
800522D0    lw      v0,0x8(s6)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 174
800522D4    lw      v1,0x10(s6)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 175
800522D8    addu    v0,s7                                             ; src\renderText02\renderText_02_GetStringOffset.asm line 176
800522DC    addu    s2,v0,a1                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 177
800522E0    addu    v0,v1,s7                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 179
800522E4    lhu     a0,0x0(s2)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 180
800522E8    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 181
800522EC    addu    s0,v0,a0                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 183
800522F0 @load_first_string_byte:                                     ; src\renderText02\renderText_02_GetStringOffset.asm line 187
800522F0    lbu     v1,0x0(s0)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 188
800522F4    addiu   s0,0x1                                            ; src\renderText02\renderText_02_GetStringOffset.asm line 189
800522F8    lbu     v0,0x40(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 191
800522FC    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 192
80052300    sllv    v1,v0                                             ; src\renderText02\renderText_02_GetStringOffset.asm line 193
80052304    sb      v1,0x3C(sp)                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 194
80052308    lhu     v1,0x2(s2)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 198
8005230C    j       0x80035D80                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 199
80052310    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 200
80052314 @get_mdd_offset_to_v0:                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 205
80052314    add     v0,v0,s6                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 206
80052318    lw      v1,0x0(v0)                                        ; src\renderText02\renderText_02_GetStringOffset.asm line 207
8005231C    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 208
80052320    addu    v0,s7,v1                                          ; src\renderText02\renderText_02_GetStringOffset.asm line 209
80052324    jr      ra                                                ; src\renderText02\renderText_02_GetStringOffset.asm line 210
80052328    nop                                                       ; src\renderText02\renderText_02_GetStringOffset.asm line 211
8005232C @rendertext_02_decompresscharacter:                          ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 100
80035D80 check_string_entry:                                          ; src\renderText02\renderText_02_DecompressCharacter.asm line 28
80035DD0 handle_character_02:                                         ; src\renderText02\renderText_02_DecompressCharacter.asm line 29
80035D90 continue_read_character_02:                                  ; src\renderText02\renderText_02_DecompressCharacter.asm line 31
8005232C decompresscharacter_02:                                      ; src\renderText02\renderText_02_DecompressCharacter.asm line 35
8005232C @is_mdt_mode_char:                                           ; src\renderText02\renderText_02_DecompressCharacter.asm line 37
8005232C    lhu     v0,0x28(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 38
80052330    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 39
80052334    beqz    v0,0x80052348                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 40
80052338    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 41
8005233C    lbu     a0,0x0(s0)                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 43
80052340    j       0x80035D90                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 44
80052344    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 45
80052348 @read_prev_char:                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 49
80052348    lbu     v0,0x48(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 50
8005234C    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 51
80052350    beqz    v0,0x8005236C                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 52
80052354    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 53
80052358    lhu     s1,0x44(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 55
8005235C    lbu     s2,0x44(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 56
80052360    sb      zero,0x48(sp)                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 57
80052364    j       0x80035DD0                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 59
80052368    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 60
8005236C @read_leaf:                                                  ; src\renderText02\renderText_02_DecompressCharacter.asm line 64
8005236C    lb      v0,0x40(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 65
80052370    ori     v1,r0,0x8                                         ; src\renderText02\renderText_02_DecompressCharacter.asm line 66
80052374    sltu    v0,v1                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 67
80052378    beqz    v0,0x80052414                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 68
8005237C    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 69
80052380    lb      v0,0x3C(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 71
80052384    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 72
80052388    andi    v1,v0,0x80                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 73
8005238C    sll     v0,0x1                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 74
80052390    sb      v0,0x3C(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 75
80052394    lbu     v0,0x40(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 77
80052398    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 78
8005239C    addiu   v0,0x1                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 79
800523A0    sb      v0,0x40(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 80
800523A4    ori     r1,r0,0x80                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 81
800523A8    beq     v1,r1,0x800523B8                                  ; src\renderText02\renderText_02_DecompressCharacter.asm line 81
800523AC    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 82
800523B0 @read_left_nodes:                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 86
800523B0    j       0x800523C0                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 87
800523B4    lw      v0,0x2C(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 88
800523B8 @read_right_nodes:                                           ; src\renderText02\renderText_02_DecompressCharacter.asm line 92
800523B8    j       0x800523C0                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 93
800523BC    lw      v0,0x30(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 94
800523C0 @load_node_offset:                                           ; src\renderText02\renderText_02_DecompressCharacter.asm line 98
800523C0    lhu     v1,0x38(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 99
800523C4    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 100
800523C8    sll     v1,0x1                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 102
800523CC    addu    v0,v1                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 103
800523D0    lhu     v0,0x0(v0)                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 104
800523D4    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 105
800523D8    sh      v0,0x38(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 107
800523DC @check_character_node:                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 111
800523DC    ori     v1,r0,-0x8000                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 112
800523E0    sltu    v0,v1                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 113
800523E4    bnez    v0,0x8005236C                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 114
800523E8    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 115
800523EC @read_character:                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 119
800523EC    lw      v0,0x34(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 120
800523F0    lhu     v1,0x38(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 121
800523F4    sh      zero,0x38(sp)                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 122
800523F8    subiu   v1,-0x8000                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 124
800523FC    sll     v1,0x1                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 125
80052400    addu    v0,v1                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 126
80052404    lhu     a1,0x0(v0)                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 128
80052408    lbu     a0,0x1(v0)                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 129
8005240C    j       0x80035DD0                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 135
80052410    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 136
80052414 @read_next_byte:                                             ; src\renderText02\renderText_02_DecompressCharacter.asm line 140
80052414    lbu     v1,0x0(s0)                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 141
80052418    addiu   s0,0x1                                            ; src\renderText02\renderText_02_DecompressCharacter.asm line 142
8005241C    sb      v1,0x3C(sp)                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 143
80052420    sb      zero,0x40(sp)                                     ; src\renderText02\renderText_02_DecompressCharacter.asm line 144
80052424    j       0x8005236C                                        ; src\renderText02\renderText_02_DecompressCharacter.asm line 146
80052428    nop                                                       ; src\renderText02\renderText_02_DecompressCharacter.asm line 147
8005242C @rendertext_02_renderchar_patches:                           ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 102
8005242C rendertextmap_renderchar_savecharacterentry:                 ; src\renderText02\renderText_02_renderChar_patches.asm line 7
8005242C    lbu     v1,0x7(a1)                                        ; src\renderText02\renderText_02_renderChar_patches.asm line 8
80052430    sw      a1,0x228(sp)                                      ; src\renderText02\renderText_02_renderChar_patches.asm line 9
80052434    jr      ra                                                ; src\renderText02\renderText_02_renderChar_patches.asm line 10
80052438    nop                                                       ; src\renderText02\renderText_02_renderChar_patches.asm line 11
8005243C rendertextmap_renderchar_getcharwidth:                       ; src\renderText02\renderText_02_renderChar_patches.asm line 15
8005243C    lw      v0,0x228(sp)                                      ; src\renderText02\renderText_02_renderChar_patches.asm line 16
80052440    nop                                                       ; src\renderText02\renderText_02_renderChar_patches.asm line 17
80052444    lbu     v0,0x5(v0)                                        ; src\renderText02\renderText_02_renderChar_patches.asm line 18
80052448    jr      ra                                                ; src\renderText02\renderText_02_renderChar_patches.asm line 19
8005244C    nop                                                       ; src\renderText02\renderText_02_renderChar_patches.asm line 20
80052450 rendertextmap_renderchar_getcharwidthoffset:                 ; src\renderText02\renderText_02_renderChar_patches.asm line 24
80052450    lw      a0,0x228(sp)                                      ; src\renderText02\renderText_02_renderChar_patches.asm line 25
80052454    nop                                                       ; src\renderText02\renderText_02_renderChar_patches.asm line 26
80052458    lbu     a0,0x5(a0)                                        ; src\renderText02\renderText_02_renderChar_patches.asm line 27
8005245C    jr      ra                                                ; src\renderText02\renderText_02_renderChar_patches.asm line 28
80052460    nop                                                       ; src\renderText02\renderText_02_renderChar_patches.asm line 29
80052464 .endarea                                                     ; src\renderText02\renderText_02_renderChar_patches.asm line 29
80052464 .org 0x80052550                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 109
80052550 .area 0x000003FC                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 110
80052550    jr      ra                                                ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 111
80052554    nop                                                       ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 112
80052558 @renderinventory_patches:                                    ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 114
80052558 inventory_setbaseoffset_setup:                               ; src\renderInventory_patches.asm line 2
80052558    j       0x80052564                                        ; src\renderInventory_patches.asm line 3
8005255C    move    v1,s0                                             ; src\renderInventory_patches.asm line 4
80052560 inventory_setbaseoffset_update:                              ; src\renderInventory_patches.asm line 6
80052560    move    v1,s1                                             ; src\renderInventory_patches.asm line 7
80052564 @setbaseoffset:                                              ; src\renderInventory_patches.asm line 9
80052564    lui     v0,-0x7FFB                                        ; src\renderInventory_patches.asm line 10
80052568    addiu   v0,0x2588                                         ; src\renderInventory_patches.asm line 10
8005256C    addu    v0,v1                                             ; src\renderInventory_patches.asm line 11
80052570    lbu     v0,0x0(v0)                                        ; src\renderInventory_patches.asm line 12
80052574    ori     v1,r0,0x130                                       ; src\renderInventory_patches.asm line 14
80052578    subu    v1,v0                                             ; src\renderInventory_patches.asm line 15
8005257C    srl     a3,v1,0x1                                         ; src\renderInventory_patches.asm line 16
80052580    jr      ra                                                ; src\renderInventory_patches.asm line 20
80052584    nop                                                       ; src\renderInventory_patches.asm line 21
80052588 @inventorywidths:                                            ; src\renderInventory_patches.asm line 25
80052588 .byte 0x50                                                   ; src\renderInventory_patches.asm line 26
80052589 .byte 0x48                                                   ; src\renderInventory_patches.asm line 27
8005258A .byte 0x40                                                   ; src\renderInventory_patches.asm line 28
8005258B .byte 0x1C                                                   ; src\renderInventory_patches.asm line 29
8005258C .byte 0x4E                                                   ; src\renderInventory_patches.asm line 30
8005258D .byte 0x2C                                                   ; src\renderInventory_patches.asm line 31
8005258E .byte 0x34                                                   ; src\renderInventory_patches.asm line 32
8005258F .byte 0x60                                                   ; src\renderInventory_patches.asm line 33
80052590 .byte 0x54                                                   ; src\renderInventory_patches.asm line 34
80052591 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 35
80052592 .byte 0x50                                                   ; src\renderInventory_patches.asm line 36
80052593 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 37
80052594 .byte 0x78                                                   ; src\renderInventory_patches.asm line 38
80052595 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 39
80052596 .byte 0x50                                                   ; src\renderInventory_patches.asm line 40
80052597 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 41
80052598 .byte 0x84                                                   ; src\renderInventory_patches.asm line 42
80052599 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 43
8005259A .byte 0xAC                                                   ; src\renderInventory_patches.asm line 44
8005259B .byte 0x70                                                   ; src\renderInventory_patches.asm line 45
8005259C .byte 0xF0                                                   ; src\renderInventory_patches.asm line 46
8005259D .byte 0xBC                                                   ; src\renderInventory_patches.asm line 47
8005259E .byte 0x7C                                                   ; src\renderInventory_patches.asm line 48
8005259F .byte 0xF0                                                   ; src\renderInventory_patches.asm line 49
800525A0 .byte 0x28                                                   ; src\renderInventory_patches.asm line 50
800525A1 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 51
800525A2 .byte 0xA4                                                   ; src\renderInventory_patches.asm line 52
800525A3 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 53
800525A4 .byte 0x5C                                                   ; src\renderInventory_patches.asm line 54
800525A5 .byte 0x78                                                   ; src\renderInventory_patches.asm line 55
800525A6 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 56
800525A7 .byte 0x4C                                                   ; src\renderInventory_patches.asm line 57
800525A8 .byte 0xF0                                                   ; src\renderInventory_patches.asm line 58
800525A9 .byte 0x48                                                   ; src\renderInventory_patches.asm line 59
800525AA .byte 0xDC                                                   ; src\renderInventory_patches.asm line 60
800525AB .byte 0x48                                                   ; src\renderInventory_patches.asm line 61
800525AC .byte 0xF0                                                   ; src\renderInventory_patches.asm line 62
800525AD .byte 0xF0                                                   ; src\renderInventory_patches.asm line 63
800525AE .byte 0xF0                                                   ; src\renderInventory_patches.asm line 64
800525AF .byte 0x00                                                   ; src\renderInventory_patches.asm line 65
800525B0 @rendernotebookcharacter_patches:                            ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 116
800525B0 clearnotebooktexture:                                        ; src\renderNotebookCharacter_patches.asm line 14
800525B0    addiu   sp,-0x24                                          ; src\renderNotebookCharacter_patches.asm line 15
800525B4    sw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 16
800525B8    sw      a0,0x14(sp)                                       ; src\renderNotebookCharacter_patches.asm line 17
800525BC    sw      a1,0x18(sp)                                       ; src\renderNotebookCharacter_patches.asm line 18
800525C0    sw      a2,0x1C(sp)                                       ; src\renderNotebookCharacter_patches.asm line 19
800525C4    sw      a3,0x20(sp)                                       ; src\renderNotebookCharacter_patches.asm line 20
800525C8    sh      a2,0x24(a0)                                       ; src\renderNotebookCharacter_patches.asm line 22
800525CC    sh      a3,0x26(a0)                                       ; src\renderNotebookCharacter_patches.asm line 23
800525D0 @loop:                                                       ; src\renderNotebookCharacter_patches.asm line 25
800525D0    lw      a0,0x14(sp)                                       ; src\renderNotebookCharacter_patches.asm line 26
800525D4    jal     0x80035460                                        ; src\renderNotebookCharacter_patches.asm line 27
800525D8    ori     a1,r0,-0x6000                                     ; src\renderNotebookCharacter_patches.asm line 28
800525DC    bnez    s5,0x800525D0                                     ; src\renderNotebookCharacter_patches.asm line 29
800525E0    addiu   s5,-0x1                                           ; src\renderNotebookCharacter_patches.asm line 30
800525E4    lw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 32
800525E8    lw      a0,0x14(sp)                                       ; src\renderNotebookCharacter_patches.asm line 33
800525EC    lw      a1,0x18(sp)                                       ; src\renderNotebookCharacter_patches.asm line 34
800525F0    lw      a2,0x1C(sp)                                       ; src\renderNotebookCharacter_patches.asm line 35
800525F4    lw      a3,0x20(sp)                                       ; src\renderNotebookCharacter_patches.asm line 36
800525F8    jr      ra                                                ; src\renderNotebookCharacter_patches.asm line 38
800525FC    addiu   sp,0x24                                           ; src\renderNotebookCharacter_patches.asm line 39
80052600 rendertextnotebookcharacter_00:                              ; src\renderNotebookCharacter_patches.asm line 42
80052600    addiu   sp,-0x18                                          ; src\renderNotebookCharacter_patches.asm line 43
80052604    sw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 44
80052608    sb      v0,0xA6(s1)                                       ; src\renderNotebookCharacter_patches.asm line 46
8005260C    jal     0x800525B0                                        ; src\renderNotebookCharacter_patches.asm line 47
80052610    ori     s5,r0,0xA0                                        ; src\renderNotebookCharacter_patches.asm line 48
80052614    jal     0x80035D38                                        ; src\renderNotebookCharacter_patches.asm line 50
80052618    nop                                                       ; src\renderNotebookCharacter_patches.asm line 51
8005261C    lw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 53
80052620    nop                                                       ; src\renderNotebookCharacter_patches.asm line 54
80052624    jr      ra                                                ; src\renderNotebookCharacter_patches.asm line 55
80052628    addiu   sp,0x18                                           ; src\renderNotebookCharacter_patches.asm line 56
8005262C rendertextnotebookcharacter_02:                              ; src\renderNotebookCharacter_patches.asm line 59
8005262C    addiu   sp,-0x18                                          ; src\renderNotebookCharacter_patches.asm line 60
80052630    sw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 61
80052634    move    a3,a2                                             ; src\renderNotebookCharacter_patches.asm line 63
80052638    jal     0x800525B0                                        ; src\renderNotebookCharacter_patches.asm line 64
8005263C    ori     s5,r0,0xA0                                        ; src\renderNotebookCharacter_patches.asm line 65
80052640    jal     0x80035D38                                        ; src\renderNotebookCharacter_patches.asm line 67
80052644    nop                                                       ; src\renderNotebookCharacter_patches.asm line 68
80052648    lw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 70
8005264C    nop                                                       ; src\renderNotebookCharacter_patches.asm line 71
80052650    jr      ra                                                ; src\renderNotebookCharacter_patches.asm line 72
80052654    addiu   sp,0x18                                           ; src\renderNotebookCharacter_patches.asm line 73
80052658 rendertextphonenumber_00:                                    ; src\renderNotebookCharacter_patches.asm line 75
80052658    addiu   sp,-0x18                                          ; src\renderNotebookCharacter_patches.asm line 76
8005265C    sw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 77
80052660    jal     0x800525B0                                        ; src\renderNotebookCharacter_patches.asm line 79
80052664    ori     s5,r0,0x20                                        ; src\renderNotebookCharacter_patches.asm line 80
80052668    jal     0x80035D38                                        ; src\renderNotebookCharacter_patches.asm line 82
8005266C    addiu   s1,0x1                                            ; src\renderNotebookCharacter_patches.asm line 83
80052670    lw      ra,0x10(sp)                                       ; src\renderNotebookCharacter_patches.asm line 85
80052674    nop                                                       ; src\renderNotebookCharacter_patches.asm line 86
80052678    jr      ra                                                ; src\renderNotebookCharacter_patches.asm line 87
8005267C    addiu   sp,0x18                                           ; src\renderNotebookCharacter_patches.asm line 88
80052680 setupnotebookcursor:                                         ; src\renderNotebookCharacter_patches.asm line 90
80052680    ori     s3,r0,0x20                                        ; src\renderNotebookCharacter_patches.asm line 91
80052684    sb      zero,0x355(s4)                                    ; src\renderNotebookCharacter_patches.asm line 92
80052688    sh      s3,0x35A(s4)                                      ; src\renderNotebookCharacter_patches.asm line 93
8005268C    j       0x8004EEA8                                        ; src\renderNotebookCharacter_patches.asm line 94
80052690    nop                                                       ; src\renderNotebookCharacter_patches.asm line 95
80052694 @memorymanagerallocpatches:                                  ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 119
80052694 .endarea                                                     ; src\memoryManagerAllocPatches.asm line 34
80052694 .org 0x80014B5C                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 124
80014B5C    nop                                                       ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 125
80014B60    nop                                                       ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 126
80014B64 .org 0x80014F8C                                              ; src\patches.asm line 4
80014F8C    addiu   a0,r0,-0x9C                                       ; src\patches.asm line 5
80014F90 .org 0x80014F9C                                              ; src\patches.asm line 6
80014F9C    addiu   v1,r0,-0x5C                                       ; src\patches.asm line 7
80014FA0 .org 0x8004EBA4                                              ; src\patches.asm line 11
8004EBA4    ori     a1,r0,0x30                                        ; src\patches.asm line 12
8004EBA8 .org 0x8004EA1C                                              ; src\patches.asm line 13
8004EA1C    addiu   s0,r0,-0x2A                                       ; src\patches.asm line 14
8004EA20 .org 0x8004EE88                                              ; src\patches.asm line 18
8004EE88    ori     v0,r0,0x6C                                        ; src\patches.asm line 19
8004EE8C .org 0x8004EE90                                              ; src\patches.asm line 20
8004EE90    addiu   v0,r0,-0x36                                       ; src\patches.asm line 21
8004EE94 .org 0x8004EDC0                                              ; src\patches.asm line 22
8004EDC0    ori     s3,r0,0x36                                        ; src\patches.asm line 23
8004EDC4 .org 0x8004EEA0                                              ; src\patches.asm line 24
8004EEA0    j       0x80052680                                        ; src\patches.asm line 25
8004EEA4    nop                                                       ; src\patches.asm line 26
8004EEA8 .org 0x800499B8                                              ; src\patches.asm line 33
800499B8    ori     s2,r0,0xA8                                        ; src\patches.asm line 34
800499BC .org 0x80049E84                                              ; src\patches.asm line 35
80049E84    ori     v0,r0,0x54                                        ; src\patches.asm line 36
80049E88 .org 0x80049FAC                                              ; src\patches.asm line 37
80049FAC    ori     v0,r0,0x54                                        ; src\patches.asm line 38
80049FB0 .org 0x8003D460                                              ; src\patches.asm line 47
8003D460    addiu   a1,r0,-0x98                                       ; src\patches.asm line 48
8003D464    ori     a2,r0,0x28                                        ; src\patches.asm line 49
8003D468    jal     0x80035BAC                                        ; src\patches.asm line 50
8003D46C    ori     a3,r0,0x130                                       ; src\patches.asm line 51
8003D470 .org 0x80033C58                                              ; src\patches.asm line 53
80033C58    addiu   a1,r0,-0x4F                                       ; src\patches.asm line 54
80033C5C    ori     a2,r0,0x28                                        ; src\patches.asm line 55
80033C60    lhu     v0,0x114(s0)                                      ; src\patches.asm line 56
80033C64    ori     a3,r0,0xF0                                        ; src\patches.asm line 57
80033C68 .org 0x80033B64                                              ; src\patches.asm line 59
80033B64    addiu   a1,r0,-0x70                                       ; src\patches.asm line 60
80033B68    ori     a2,r0,0x28                                        ; src\patches.asm line 61
80033B6C    ori     v0,v1,0x21                                        ; src\patches.asm line 62
80033B70    sh      v0,0x114(s0)                                      ; src\patches.asm line 63
80033B74    ori     v0,r0,0x30                                        ; src\patches.asm line 64
80033B78    ori     a3,r0,0xF0                                        ; src\patches.asm line 65
80033B7C .org 0x80033A9C                                              ; src\patches.asm line 67
80033A9C    addiu   a1,r0,-0x5F                                       ; src\patches.asm line 68
80033AA0    ori     a2,r0,0x28                                        ; src\patches.asm line 69
80033AA4    ori     v0,v1,0x21                                        ; src\patches.asm line 70
80033AA8    sh      v0,0x114(s0)                                      ; src\patches.asm line 71
80033AAC    ori     v0,r0,0x30                                        ; src\patches.asm line 72
80033AB0    ori     a3,r0,0xF0                                        ; src\patches.asm line 73
80033AB4 .org 0x80033930                                              ; src\patches.asm line 75
80033930    addiu   a1,r0,-0x5F                                       ; src\patches.asm line 76
80033934    ori     a2,r0,0x28                                        ; src\patches.asm line 77
80033938    ori     a3,r0,0xF0                                        ; src\patches.asm line 78
8003393C .org 0x80033488                                              ; src\patches.asm line 80
80033488    addiu   a1,r0,-0x5F                                       ; src\patches.asm line 81
8003348C    ori     a2,r0,0x28                                        ; src\patches.asm line 82
80033490    ori     v0,r0,0x30                                        ; src\patches.asm line 83
80033494    ori     a3,r0,0xF0                                        ; src\patches.asm line 84
80033498 .org 0x8004EAB4                                              ; src\patches.asm line 88
8004EAB4    jal     0x80052600                                        ; src\patches.asm line 89
8004EAB8    nop                                                       ; src\patches.asm line 90
8004EABC .org 0x8004EC8C                                              ; src\patches.asm line 92
8004EC8C    jal     0x8005262C                                        ; src\patches.asm line 93
8004EC90    nop                                                       ; src\patches.asm line 94
8004EC94 .org 0x8004E8C4                                              ; src\patches.asm line 96
8004E8C4    jal     0x80052658                                        ; src\patches.asm line 97
8004E8C8    nop                                                       ; src\patches.asm line 98
8004E8CC .org 0x80079FBC                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 135
80079FBC .area 0x00000118                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 136
80079FBC start:                                                       ; src\entryPoint.asm line 8
80079FBC    lui     v0,-0x7FF6                                        ; src\entryPoint.asm line 9
80079FC0    addiu   v0,0x3508                                         ; src\entryPoint.asm line 9
80079FC4    lui     v1,-0x7FF0                                        ; src\entryPoint.asm line 10
80079FC8    addiu   v1,0x1ED0                                         ; src\entryPoint.asm line 10
80079FCC loc_80079fcc:                                                ; src\entryPoint.asm line 12
80079FCC    sw      zero,0x0(v0)                                      ; src\entryPoint.asm line 13
80079FD0    addiu   v0,0x4                                            ; src\entryPoint.asm line 14
80079FD4    sltu    at,v0,v1                                          ; src\entryPoint.asm line 15
80079FD8    bnez    at,0x80079FCC                                     ; src\entryPoint.asm line 16
80079FDC    nop                                                       ; src\entryPoint.asm line 17
80079FE0    lui     v0,-0x7FF6                                        ; src\entryPoint.asm line 18
80079FE4    lw      v0,0x341C(v0)                                     ; src\entryPoint.asm line 18
80079FE8    nop                                                       ; src\entryPoint.asm line 19
80079FEC    addi    v0,-0x8                                           ; src\entryPoint.asm line 20
80079FF0    lui     t0,-0x8000                                        ; src\entryPoint.asm line 21
80079FF4    or      sp,v0,t0                                          ; src\entryPoint.asm line 22
80079FF8    lui     a0,-0x7FF0                                        ; src\entryPoint.asm line 23
80079FFC    addiu   a0,0x1ED0                                         ; src\entryPoint.asm line 23
8007A000    sll     a0,0x3                                            ; src\entryPoint.asm line 24
8007A004    srl     a0,0x3                                            ; src\entryPoint.asm line 25
8007A008    lui     v1,-0x7FF6                                        ; src\entryPoint.asm line 26
8007A00C    lw      v1,0x3420(v1)                                     ; src\entryPoint.asm line 26
8007A010    nop                                                       ; src\entryPoint.asm line 27
8007A014    subu    a1,v0,v1                                          ; src\entryPoint.asm line 28
8007A018    subu    a1,a0                                             ; src\entryPoint.asm line 29
8007A01C    lui     r1,-0x7FF6                                        ; src\entryPoint.asm line 30
8007A020    sw      a1,0x3300(r1)                                     ; src\entryPoint.asm line 30
8007A024    or      a0,t0                                             ; src\entryPoint.asm line 31
8007A028    lui     r1,-0x7FF6                                        ; src\entryPoint.asm line 32
8007A02C    sw      a0,0x32FC(r1)                                     ; src\entryPoint.asm line 32
8007A030    lui     r1,-0x7FF6                                        ; src\entryPoint.asm line 33
8007A034    sw      ra,0x39D0(r1)                                     ; src\entryPoint.asm line 33
8007A038    lui     gp,-0x7FF6                                        ; src\entryPoint.asm line 34
8007A03C    addiu   gp,0x341C                                         ; src\entryPoint.asm line 34
8007A040    move    fp,sp                                             ; src\entryPoint.asm line 35
8007A044    jal     0x8007A13C                                        ; src\entryPoint.asm line 36
8007A048    addi    a0,0x4                                            ; src\entryPoint.asm line 37
8007A04C    lui     ra,-0x7FF6                                        ; src\entryPoint.asm line 38
8007A050    lw      ra,0x39D0(ra)                                     ; src\entryPoint.asm line 38
8007A054    nop                                                       ; src\entryPoint.asm line 39
8007A058    jal     0x8004F480                                        ; src\entryPoint.asm line 40
8007A05C    nop                                                       ; src\entryPoint.asm line 41
8007A060    break   0x1                                               ; src\entryPoint.asm line 42
8007A064 __main:                                                      ; src\entryPoint.asm line 44
8007A064    lui     t0,-0x7FF6                                        ; src\entryPoint.asm line 45
8007A068    lw      t0,0x32F8(t0)                                     ; src\entryPoint.asm line 45
8007A06C    addiu   sp,-0x10                                          ; src\entryPoint.asm line 46
8007A070    sw      s0,0x4(sp)                                        ; src\entryPoint.asm line 47
8007A074    sw      s1,0x8(sp)                                        ; src\entryPoint.asm line 48
8007A078    sw      ra,0xC(sp)                                        ; src\entryPoint.asm line 49
8007A07C    bnez    t0,0x8007A0B4                                     ; src\entryPoint.asm line 50
8007A080    ori     t0,r0,0x1                                         ; src\entryPoint.asm line 51
8007A084    lui     r1,-0x7FF6                                        ; src\entryPoint.asm line 52
8007A088    sw      t0,0x32F8(r1)                                     ; src\entryPoint.asm line 52
8007A08C    lui     s0,-0x7FFF                                        ; src\entryPoint.asm line 53
8007A090    ori     s1,r0,0x0                                         ; src\entryPoint.asm line 54
8007A094    beqz    s1,0x8007A0B4                                     ; src\entryPoint.asm line 55
8007A098    nop                                                       ; src\entryPoint.asm line 56
8007A09C loc_8007a0a4:                                                ; src\entryPoint.asm line 58
8007A09C    lw      t0,0x0(s0)                                        ; src\entryPoint.asm line 59
8007A0A0    addiu   s0,0x4                                            ; src\entryPoint.asm line 60
8007A0A4    jalr    t0                                                ; src\entryPoint.asm line 61
8007A0A8    addiu   s1,-0x1                                           ; src\entryPoint.asm line 62
8007A0AC    bnez    s1,0x8007A09C                                     ; src\entryPoint.asm line 63
8007A0B0    nop                                                       ; src\entryPoint.asm line 64
8007A0B4 loc_8007a0bc:                                                ; src\entryPoint.asm line 66
8007A0B4    lw      ra,0xC(sp)                                        ; src\entryPoint.asm line 68
8007A0B8    lw      s1,0x8(sp)                                        ; src\entryPoint.asm line 69
8007A0BC    lw      s0,0x4(sp)                                        ; src\entryPoint.asm line 70
8007A0C0    addiu   sp,0x10                                           ; src\entryPoint.asm line 71
8007A0C4    jr      ra                                                ; src\entryPoint.asm line 72
8007A0C8    nop                                                       ; src\entryPoint.asm line 73
8007A0CC .endarea                                                     ; src\entryPoint.asm line 73
8007A0CC .org 0x8004F42C                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 140
8004F42C .area 0x00000054                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 141
8004F42C sub_8004f42c:                                                ; src\setupGame.asm line 6
8004F42C    addiu   sp,-0x18                                          ; src\setupGame.asm line 7
8004F430    sw      ra,0x10(sp)                                       ; src\setupGame.asm line 8
8004F434    jal     0x8007A14C                                        ; src\setupGame.asm line 9
8004F438    move    a0,zero                                           ; src\setupGame.asm line 10
8004F43C    jal     0x8007A198                                        ; src\setupGame.asm line 11
8004F440    nop                                                       ; src\setupGame.asm line 12
8004F444    jal     0x80038AD0                                        ; src\setupGame.asm line 13
8004F448    nop                                                       ; src\setupGame.asm line 14
8004F44C    jal     0x8004F674                                        ; src\setupGame.asm line 15
8004F450    nop                                                       ; src\setupGame.asm line 16
8004F454    jal     0x8004FB7C                                        ; src\setupGame.asm line 17
8004F458    nop                                                       ; src\setupGame.asm line 18
8004F45C    lui     a0,-0x7FF0                                        ; src\setupGame.asm line 20
8004F460    ori     a0,a0,-0x3400                                     ; src\setupGame.asm line 21
8004F464    lui     a1,0xF                                            ; src\setupGame.asm line 23
8004F468    jal     0x8004FC10                                        ; src\setupGame.asm line 24
8004F46C    ori     a1,a1,0x1400                                      ; src\setupGame.asm line 25
8004F470    lw      ra,0x10(sp)                                       ; src\setupGame.asm line 27
8004F474    nop                                                       ; src\setupGame.asm line 28
8004F478    jr      ra                                                ; src\setupGame.asm line 29
8004F47C    addiu   sp,0x18                                           ; src\setupGame.asm line 30
8004F480 .endarea                                                     ; src\setupGame.asm line 30
8004F480 .org 0x800338D0                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 145
800338D0 .area 0x000000F8                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 146
80035BAC sub_80035bac:                                                ; src\setupGameTextContext.asm line 12
80035BC4 sub_80035bc4:                                                ; src\setupGameTextContext.asm line 13
80035C14 sub_80035c14:                                                ; src\setupGameTextContext.asm line 14
80035C20 sub_80035c20:                                                ; src\setupGameTextContext.asm line 15
80035AB0 sub_80035ab0:                                                ; src\setupGameTextContext.asm line 16
800336AC sub_800336ac:                                                ; src\setupGameTextContext.asm line 17
80033588 sub_80033588:                                                ; src\setupGameTextContext.asm line 18
800338D0 sub_800338d0:                                                ; src\setupGameTextContext.asm line 20
800338D0    addiu   sp,-0x30                                          ; src\setupGameTextContext.asm line 21
800338D4    sw      s1,0x24(sp)                                       ; src\setupGameTextContext.asm line 22
800338D8    move    s1,a0                                             ; src\setupGameTextContext.asm line 23
800338DC    ori     a0,r0,0x118                                       ; src\setupGameTextContext.asm line 24
800338E0    sw      ra,0x28(sp)                                       ; src\setupGameTextContext.asm line 25
800338E4    jal     0x8004FC68                                        ; src\setupGameTextContext.asm line 26
800338E8    sw      s0,0x20(sp)                                       ; src\setupGameTextContext.asm line 27
800338EC    move    s0,v0                                             ; src\setupGameTextContext.asm line 28
800338F0    beqz    s0,0x800339B0                                     ; src\setupGameTextContext.asm line 29
800338F4    move    a0,s0                                             ; src\setupGameTextContext.asm line 30
800338F8    move    a1,s1                                             ; src\setupGameTextContext.asm line 31
800338FC    ori     a2,r0,0xF                                         ; src\setupGameTextContext.asm line 32
80033900    ori     a3,r0,0x1                                         ; src\setupGameTextContext.asm line 33
80033904    ori     v0,r0,0x3F0                                       ; src\setupGameTextContext.asm line 34
80033908    sw      v0,0x10(sp)                                       ; src\setupGameTextContext.asm line 35
8003390C    ori     v0,r0,0xF0                                        ; src\setupGameTextContext.asm line 36
80033910    sw      v0,0x14(sp)                                       ; src\setupGameTextContext.asm line 37
80033914    ori     v0,r0,0x80                                        ; src\setupGameTextContext.asm line 40
80033918    sw      s0,0x344(gp)                                      ; src\setupGameTextContext.asm line 45
8003391C    sw      v0,0x18(sp)                                       ; src\setupGameTextContext.asm line 46
80033920    jal     0x800342D8                                        ; src\setupGameTextContext.asm line 47
80033924    sw      v0,0x1C(sp)                                       ; src\setupGameTextContext.asm line 48
80033928    bnez    v0,0x800339A4                                     ; src\setupGameTextContext.asm line 49
8003392C    move    a0,s0                                             ; src\setupGameTextContext.asm line 50
80033930    addiu   a1,r0,-0x5F                                       ; src\setupGameTextContext.asm line 51
80033934    ori     a2,r0,0x28                                        ; src\setupGameTextContext.asm line 52
80033938    ori     a3,r0,0xF0                                        ; src\setupGameTextContext.asm line 53
8003393C    ori     v0,r0,0x30                                        ; src\setupGameTextContext.asm line 54
80033940    jal     0x80035BAC                                        ; src\setupGameTextContext.asm line 55
80033944    sw      v0,0x10(sp)                                       ; src\setupGameTextContext.asm line 56
80033948    move    a0,s0                                             ; src\setupGameTextContext.asm line 57
8003394C    move    a1,zero                                           ; src\setupGameTextContext.asm line 58
80033950    jal     0x80035BC4                                        ; src\setupGameTextContext.asm line 59
80033954    ori     a2,r0,0x91                                        ; src\setupGameTextContext.asm line 60
80033958    move    a0,s0                                             ; src\setupGameTextContext.asm line 61
8003395C    ori     a1,r0,0x4                                         ; src\setupGameTextContext.asm line 62
80033960    jal     0x80035C14                                        ; src\setupGameTextContext.asm line 63
80033964    ori     a2,r0,0x1                                         ; src\setupGameTextContext.asm line 64
80033968    move    a0,s0                                             ; src\setupGameTextContext.asm line 65
8003396C    ori     a1,r0,0xF                                         ; src\setupGameTextContext.asm line 66
80033970    jal     0x80035C20                                        ; src\setupGameTextContext.asm line 67
80033974    ori     a2,r0,0x10                                        ; src\setupGameTextContext.asm line 68
80033978    move    a0,s0                                             ; src\setupGameTextContext.asm line 69
8003397C    lui     a1,-0x7FFD                                        ; src\setupGameTextContext.asm line 70
80033980    jal     0x80035AB0                                        ; src\setupGameTextContext.asm line 71
80033984    addiu   a1,0x36AC                                         ; src\setupGameTextContext.asm line 72
80033988    sh      zero,0x114(s0)                                    ; src\setupGameTextContext.asm line 73
8003398C    sb      zero,0x110(s0)                                    ; src\setupGameTextContext.asm line 74
80033990    sb      zero,0x111(s0)                                    ; src\setupGameTextContext.asm line 75
80033994    jal     0x80033588                                        ; src\setupGameTextContext.asm line 76
80033998    sb      zero,0x112(s0)                                    ; src\setupGameTextContext.asm line 77
8003399C    j       0x800339B4                                        ; src\setupGameTextContext.asm line 78
800339A0    move    v0,zero                                           ; src\setupGameTextContext.asm line 79
800339A4 loc_800339a4:                                                ; src\setupGameTextContext.asm line 82
800339A4    lw      a0,0x344(gp)                                      ; src\setupGameTextContext.asm line 83
800339A8    jal     0x8004FD8C                                        ; src\setupGameTextContext.asm line 84
800339AC    nop                                                       ; src\setupGameTextContext.asm line 85
800339B0 loc_800339b0:                                                ; src\setupGameTextContext.asm line 87
800339B0    ori     v0,r0,0x1                                         ; src\setupGameTextContext.asm line 88
800339B4 loc_800339b4:                                                ; src\setupGameTextContext.asm line 90
800339B4    lw      ra,0x28(sp)                                       ; src\setupGameTextContext.asm line 91
800339B8    lw      s1,0x24(sp)                                       ; src\setupGameTextContext.asm line 92
800339BC    lw      s0,0x20(sp)                                       ; src\setupGameTextContext.asm line 93
800339C0    jr      ra                                                ; src\setupGameTextContext.asm line 94
800339C4    addiu   sp,0x30                                           ; src\setupGameTextContext.asm line 95
800339C8 .endarea                                                     ; src\setupGameTextContext.asm line 95
800339C8 .org 0x800349C4                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 150
800349C4 .area 0x0000043C                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 151
80034E00 renderchar_80034e00:                                         ; src\renderText01\renderText_01.asm line 1
80035ABC newline_80035ac0:                                            ; src\renderText01\renderText_01.asm line 2
800349C4 @rendertext01_800349c4:                                      ; src\renderText01\renderText_01.asm line 42
800349C4    addiu   sp,-0x44                                          ; src\renderText01\renderText_01.asm line 43
800349C8    sw      s0,0x10(sp)                                       ; src\renderText01\renderText_01.asm line 44
800349CC    move    s0,a0                                             ; src\renderText01\renderText_01.asm line 45
800349D0    sw      s3,0x1C(sp)                                       ; src\renderText01\renderText_01.asm line 46
800349D4    move    s3,a1                                             ; src\renderText01\renderText_01.asm line 47
800349D8    sw      ra,0x24(sp)                                       ; src\renderText01\renderText_01.asm line 48
800349DC    sw      s4,0x20(sp)                                       ; src\renderText01\renderText_01.asm line 49
800349E0    sw      s2,0x18(sp)                                       ; src\renderText01\renderText_01.asm line 50
800349E4    sw      s1,0x14(sp)                                       ; src\renderText01\renderText_01.asm line 51
800349E8    j       0x80051E9C                                        ; src\renderText01\renderText_01.asm line 54
800349EC @start_mdt_read:                                             ; src\renderText01\renderText_01.asm line 59
800349EC    lw      v0,0x8(s3)                                        ; src\renderText01\renderText_01.asm line 60
800349F0    sll     a1,a2,0x2                                         ; src\renderText01\renderText_01.asm line 61
800349F4    lw      v1,0x0(v0)                                        ; src\renderText01\renderText_01.asm line 62
800349F8    lw      a0,0x4(v0)                                        ; src\renderText01\renderText_01.asm line 63
800349FC    lw      v0,0x4(v1)                                        ; src\renderText01\renderText_01.asm line 64
80034A00    nop                                                       ; src\renderText01\renderText_01.asm line 65
80034A04 @check_string_index:                                         ; src\renderText01\renderText_01.asm line 67
80034A04    sltu    v0,a2                                             ; src\renderText01\renderText_01.asm line 68
80034A08    beqz    v0,0x80034A18                                     ; src\renderText01\renderText_01.asm line 69
80034A0C    addu    s4,a0,a1                                          ; src\renderText01\renderText_01.asm line 70
80034A10    j       0x80034DE0                                        ; src\renderText01\renderText_01.asm line 71
80034A14    move    v0,zero                                           ; src\renderText01\renderText_01.asm line 72
80034A18 @loc_80034a18:                                               ; src\renderText01\renderText_01.asm line 75
80034A18    lhu     v0,0x6(s3)                                        ; src\renderText01\renderText_01.asm line 76
80034A1C    nop                                                       ; src\renderText01\renderText_01.asm line 77
80034A20    andi    v0,0x2                                            ; src\renderText01\renderText_01.asm line 78
80034A24    beqz    v0,0x80034A58                                     ; src\renderText01\renderText_01.asm line 79
80034A28    nop                                                       ; src\renderText01\renderText_01.asm line 80
80034A2C    lhu     v0,0x2(s3)                                        ; src\renderText01\renderText_01.asm line 81
80034A30    sh      zero,0x60(s0)                                     ; src\renderText01\renderText_01.asm line 82
80034A34    sh      v0,0x5C(s0)                                       ; src\renderText01\renderText_01.asm line 83
80034A38    lhu     v0,0x4(s3)                                        ; src\renderText01\renderText_01.asm line 84
80034A3C    sh      zero,0x62(s0)                                     ; src\renderText01\renderText_01.asm line 85
80034A40    sh      v0,0x5E(s0)                                       ; src\renderText01\renderText_01.asm line 86
80034A44    lhu     v0,0x6(s3)                                        ; src\renderText01\renderText_01.asm line 87
80034A48    nop                                                       ; src\renderText01\renderText_01.asm line 88
80034A4C    andi    v0,-0x3                                           ; src\renderText01\renderText_01.asm line 89
80034A50    j       0x80034A60                                        ; src\renderText01\renderText_01.asm line 90
80034A54    sh      v0,0x6(s3)                                        ; src\renderText01\renderText_01.asm line 91
80034A58 @loc_80034a58:                                               ; src\renderText01\renderText_01.asm line 94
80034A58    sh      zero,0x5E(s0)                                     ; src\renderText01\renderText_01.asm line 95
80034A5C    sh      zero,0x5C(s0)                                     ; src\renderText01\renderText_01.asm line 96
80034A60 @loc_80034a60:                                               ; src\renderText01\renderText_01.asm line 98
80034A60    lhu     v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 99
80034A64    nop                                                       ; src\renderText01\renderText_01.asm line 100
80034A68    bnez    v0,0x80034A88                                     ; src\renderText01\renderText_01.asm line 101
80034A6C    sw      zero,0x6C(s0)                                     ; src\renderText01\renderText_01.asm line 102
80034A70    j       0x80051F4C                                        ; src\renderText01\renderText_01.asm line 105
80034A74 @load_mdt_offset:                                            ; src\renderText01\renderText_01.asm line 110
80034A74    lhu     v1,0x0(s4)                                        ; src\renderText01\renderText_01.asm line 111
80034A78    lw      v0,0x8(v0)                                        ; src\renderText01\renderText_01.asm line 112
80034A7C    nop                                                       ; src\renderText01\renderText_01.asm line 113
80034A80    addu    v0,v1                                             ; src\renderText01\renderText_01.asm line 114
80034A84    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 115
80034A88 @setup_mdt_render:                                           ; src\renderText01\renderText_01.asm line 117
80034A88 @loc_80034a88:                                               ; src\renderText01\renderText_01.asm line 118
80034A88    lh      v0,0x8A(s0)                                       ; src\renderText01\renderText_01.asm line 119
80034A8C    lw      v1,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 120
80034A90    lh      a0,0x8C(s0)                                       ; src\renderText01\renderText_01.asm line 121
80034A94    addu    v1,v0                                             ; src\renderText01\renderText_01.asm line 122
80034A98    sw      v1,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 123
80034A9C    slt     v1,a0                                             ; src\renderText01\renderText_01.asm line 124
80034AA0    bnez    v1,0x80034DA8                                     ; src\renderText01\renderText_01.asm line 125
80034AA4    nop                                                       ; src\renderText01\renderText_01.asm line 126
80034AA8 @loc_80034aa8:                                               ; src\renderText01\renderText_01.asm line 128
80034AA8    lhu     v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 129
80034AAC    lhu     v1,0x2(s4)                                        ; src\renderText01\renderText_01.asm line 130
80034AB0    nop                                                       ; src\renderText01\renderText_01.asm line 131
80034AB4    sltu    v0,v1                                             ; src\renderText01\renderText_01.asm line 132
80034AB8    beqz    v0,0x80034DD8                                     ; src\renderText01\renderText_01.asm line 133
80034ABC    move    v0,zero                                           ; src\renderText01\renderText_01.asm line 134
80034AC0 @prepare_mdt_render:                                         ; src\renderText01\renderText_01.asm line 136
80034AC0    lbu     v0,0x64(s0)                                       ; src\renderText01\renderText_01.asm line 137
80034AC4    lhu     v1,0x60(s0)                                       ; src\renderText01\renderText_01.asm line 138
80034AC8    lw      a0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 139
80034ACC    sb      zero,0x64(s0)                                     ; src\renderText01\renderText_01.asm line 140
80034AD0    addu    v1,v0                                             ; src\renderText01\renderText_01.asm line 141
80034AD4    sh      v1,0x60(s0)                                       ; src\renderText01\renderText_01.asm line 142
80034AD8 @read_character:                                             ; src\renderText01\renderText_01.asm line 144
80034AD8    j       0x80051FC0                                        ; src\renderText01\renderText_01.asm line 147
80034ADC    nop                                                       ; src\renderText01\renderText_01.asm line 148
80034AE0 @continue_read_character:                                    ; src\renderText01\renderText_01.asm line 154
80034AE0    andi    v0,s2,0x80                                        ; src\renderText01\renderText_01.asm line 155
80034AE4    beqz    v0,0x80034AF8                                     ; src\renderText01\renderText_01.asm line 156
80034AE8    sll     v0,s2,0x8                                         ; src\renderText01\renderText_01.asm line 157
80034AEC    lbu     v1,0x1(a0)                                        ; src\renderText01\renderText_01.asm line 158
80034AF0    j       0x80034B24                                        ; src\renderText01\renderText_01.asm line 159
80034AF4    or      s1,v0,v1                                          ; src\renderText01\renderText_01.asm line 160
80034AF8 @loc_80034af8:                                               ; src\renderText01\renderText_01.asm line 163
80034AF8    lw      v0,0x8(s3)                                        ; src\renderText01\renderText_01.asm line 164
80034AFC    nop                                                       ; src\renderText01\renderText_01.asm line 165
80034B00    lw      v1,0x0(v0)                                        ; src\renderText01\renderText_01.asm line 166
80034B04    sll     v0,s2,0x1                                         ; src\renderText01\renderText_01.asm line 167
80034B08    addiu   v0,0x8                                            ; src\renderText01\renderText_01.asm line 168
80034B0C    addu    v1,v0                                             ; src\renderText01\renderText_01.asm line 169
80034B10    lhu     s1,0x0(v1)                                        ; src\renderText01\renderText_01.asm line 170
80034B14    nop                                                       ; src\renderText01\renderText_01.asm line 171
80034B18    srl     v1,s1,0x8                                         ; src\renderText01\renderText_01.asm line 172
80034B1C    sll     v0,s1,0x8                                         ; src\renderText01\renderText_01.asm line 173
80034B20    or      s1,v0,v1                                          ; src\renderText01\renderText_01.asm line 174
80034B24 @handle_character:                                           ; src\renderText01\renderText_01.asm line 176
80034B24 @loc_80034b24:                                               ; src\renderText01\renderText_01.asm line 177
80034B24    andi    v1,s1,-0x1000                                     ; src\renderText01\renderText_01.asm line 178
80034B28    ori     v0,r0,-0x6000                                     ; src\renderText01\renderText_01.asm line 179
80034B2C    bne     v1,v0,0x80034B3C                                  ; src\renderText01\renderText_01.asm line 180
80034B30    andi    v1,s1,-0x100                                      ; src\renderText01\renderText_01.asm line 181
80034B34    addiu   s1,0x6000                                         ; src\renderText01\renderText_01.asm line 182
80034B38    andi    v1,s1,-0x100                                      ; src\renderText01\renderText_01.asm line 183
80034B3C @loc_80034b3c:                                               ; src\renderText01\renderText_01.asm line 185
80034B3C    ori     v0,r0,-0x100                                      ; src\renderText01\renderText_01.asm line 186
80034B40    beq     v1,v0,0x80034C50                                  ; src\renderText01\renderText_01.asm line 187
80034B44    nop                                                       ; src\renderText01\renderText_01.asm line 188
80034B48    lw      v0,0xB0(s0)                                       ; src\renderText01\renderText_01.asm line 189
80034B4C    nop                                                       ; src\renderText01\renderText_01.asm line 190
80034B50    andi    v0,0x40                                           ; src\renderText01\renderText_01.asm line 191
80034B54    bnez    v0,0x80034BA0                                     ; src\renderText01\renderText_01.asm line 192
80034B58    nop                                                       ; src\renderText01\renderText_01.asm line 193
80034B5C    lhu     v0,0x5C(s0)                                       ; src\renderText01\renderText_01.asm line 194
80034B60    lhu     v1,0x60(s0)                                       ; src\renderText01\renderText_01.asm line 195
80034B64    nop                                                       ; src\renderText01\renderText_01.asm line 196
80034B68    addu    v0,v1                                             ; src\renderText01\renderText_01.asm line 197
80034B6C    sll     v0,0x10                                           ; src\renderText01\renderText_01.asm line 198
80034B70    lh      v1,0x78(s0)                                       ; src\renderText01\renderText_01.asm line 199
80034B74    sra     v0,0x10                                           ; src\renderText01\renderText_01.asm line 200
80034B78    slt     v0,v1                                             ; src\renderText01\renderText_01.asm line 201
80034B7C    bnez    v0,0x80034BA0                                     ; src\renderText01\renderText_01.asm line 202
80034B80    nop                                                       ; src\renderText01\renderText_01.asm line 203
80034B84    lhu     v0,0x70(s0)                                       ; src\renderText01\renderText_01.asm line 204
80034B88    nop                                                       ; src\renderText01\renderText_01.asm line 205
80034B8C    andi    v0,0x20                                           ; src\renderText01\renderText_01.asm line 206
80034B90    bnez    v0,0x80034BA0                                     ; src\renderText01\renderText_01.asm line 207
80034B94    nop                                                       ; src\renderText01\renderText_01.asm line 208
80034B98    jal     0x80035ABC                                        ; src\renderText01\renderText_01.asm line 209
80034B9C    move    a0,s0                                             ; src\renderText01\renderText_01.asm line 210
80034BA0 @loc_80034ba0:                                               ; src\renderText01\renderText_01.asm line 212
80034BA0    lhu     v1,0x70(s0)                                       ; src\renderText01\renderText_01.asm line 213
80034BA4    nop                                                       ; src\renderText01\renderText_01.asm line 214
80034BA8    andi    v0,v1,-0x21                                       ; src\renderText01\renderText_01.asm line 215
80034BAC    andi    v1,0x2                                            ; src\renderText01\renderText_01.asm line 216
80034BB0    bnez    v1,0x80034DC8                                     ; src\renderText01\renderText_01.asm line 217
80034BB4    sh      v0,0x70(s0)                                       ; src\renderText01\renderText_01.asm line 218
80034BB8    lhu     v0,0x8E(s0)                                       ; src\renderText01\renderText_01.asm line 219
80034BBC    nop                                                       ; src\renderText01\renderText_01.asm line 220
80034BC0    andi    v0,0x1                                            ; src\renderText01\renderText_01.asm line 221
80034BC4    beqz    v0,0x80034BF8                                     ; src\renderText01\renderText_01.asm line 222
80034BC8    nop                                                       ; src\renderText01\renderText_01.asm line 223
80034BCC    lhu     v1,0x94(s0)                                       ; src\renderText01\renderText_01.asm line 224
80034BD0    lhu     v0,0x96(s0)                                       ; src\renderText01\renderText_01.asm line 225
80034BD4    nop                                                       ; src\renderText01\renderText_01.asm line 226
80034BD8    mult    v1,v0                                             ; src\renderText01\renderText_01.asm line 227
80034BDC    lw      v0,0x6C(s0)                                       ; src\renderText01\renderText_01.asm line 228
80034BE0    nop                                                       ; src\renderText01\renderText_01.asm line 229
80034BE4    addu    v0,v1                                             ; src\renderText01\renderText_01.asm line 230
80034BE8    mflo    a3                                                ; src\renderText01\renderText_01.asm line 231
80034BEC    sltu    v0,a3,v0                                          ; src\renderText01\renderText_01.asm line 232
80034BF0    bnez    v0,0x80034DC8                                     ; src\renderText01\renderText_01.asm line 233
80034BF4    nop                                                       ; src\renderText01\renderText_01.asm line 234
80034BF8 @loc_80034bf8:                                               ; src\renderText01\renderText_01.asm line 236
80034BF8    move    a0,s0                                             ; src\renderText01\renderText_01.asm line 237
80034BFC    andi    a1,s1,-0x1                                        ; src\renderText01\renderText_01.asm line 238
80034C00    jal     0x80034E00                                        ; src\renderText01\renderText_01.asm line 239
80034C04    move    a2,zero                                           ; src\renderText01\renderText_01.asm line 240
80034C08    lh      a0,0x8C(s0)                                       ; src\renderText01\renderText_01.asm line 241
80034C0C    lw      v0,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 242
80034C10    lhu     v1,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 243
80034C14    subu    v0,a0                                             ; src\renderText01\renderText_01.asm line 244
80034C18    addiu   v1,0x1                                            ; src\renderText01\renderText_01.asm line 245
80034C1C    sw      v0,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 246
80034C20    andi    v0,s2,0x80                                        ; src\renderText01\renderText_01.asm line 247
80034C24    j       0x800520F0                                        ; src\renderText01\renderText_01.asm line 250
80034C28    sh      v1,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 251
80034C2C @loc_80034c2c:                                               ; src\renderText01\renderText_01.asm line 257
80034C2C    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 258
80034C30    nop                                                       ; src\renderText01\renderText_01.asm line 259
80034C34    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 260
80034C38    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 261
80034C3C @loc_80034c3c:                                               ; src\renderText01\renderText_01.asm line 263
80034C3C    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 264
80034C40    nop                                                       ; src\renderText01\renderText_01.asm line 265
80034C44    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 266
80034C48    j       0x80034D90                                        ; src\renderText01\renderText_01.asm line 267
80034C4C    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 268
80034C50 @loc_80034c50:                                               ; src\renderText01\renderText_01.asm line 271
80034C50    lw      v0,0xA0(s0)                                       ; src\renderText01\renderText_01.asm line 272
80034C54    nop                                                       ; src\renderText01\renderText_01.asm line 273
80034C58    beqz    v0,0x80034CE8                                     ; src\renderText01\renderText_01.asm line 274
80034C5C    move    a0,s0                                             ; src\renderText01\renderText_01.asm line 275
80034C60    jalr    v0                                                ; src\renderText01\renderText_01.asm line 276
80034C64    andi    a1,s1,-0x1                                        ; src\renderText01\renderText_01.asm line 277
80034C68    move    a0,v0                                             ; src\renderText01\renderText_01.asm line 278
80034C6C    andi    v0,a0,0x2                                         ; src\renderText01\renderText_01.asm line 279
80034C70    beqz    v0,0x80034C90                                     ; src\renderText01\renderText_01.asm line 280
80034C74    andi    v0,a0,0x1                                         ; src\renderText01\renderText_01.asm line 281
80034C78    lh      v1,0x8C(s0)                                       ; src\renderText01\renderText_01.asm line 282
80034C7C    lw      v0,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 283
80034C80    nop                                                       ; src\renderText01\renderText_01.asm line 284
80034C84    subu    v0,v1                                             ; src\renderText01\renderText_01.asm line 285
80034C88    sw      v0,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 286
80034C8C    andi    v0,a0,0x1                                         ; src\renderText01\renderText_01.asm line 287
80034C90 @loc_80034c90:                                               ; src\renderText01\renderText_01.asm line 289
80034C90    beqz    v0,0x80034CD8                                     ; src\renderText01\renderText_01.asm line 290
80034C94    andi    v0,a0,0x4                                         ; src\renderText01\renderText_01.asm line 291
80034C98    lhu     v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 292
80034C9C    nop                                                       ; src\renderText01\renderText_01.asm line 293
80034CA0    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 294
80034CA4    sh      v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 295
80034CA8    andi    v0,s2,0x80                                        ; src\renderText01\renderText_01.asm line 296
80034CAC    j       0x80052124                                        ; src\renderText01\renderText_01.asm line 299
80034CB0    nop                                                       ; src\renderText01\renderText_01.asm line 300
80034CB4 @loc_80034cb4:                                               ; src\renderText01\renderText_01.asm line 306
80034CB4    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 307
80034CB8    nop                                                       ; src\renderText01\renderText_01.asm line 308
80034CBC    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 309
80034CC0    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 310
80034CC4 @loc_80034cc4:                                               ; src\renderText01\renderText_01.asm line 312
80034CC4    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 313
80034CC8    nop                                                       ; src\renderText01\renderText_01.asm line 314
80034CCC    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 315
80034CD0    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 316
80034CD4 @loc_80034cd4:                                               ; src\renderText01\renderText_01.asm line 318
80034CD4    andi    v0,a0,0x4                                         ; src\renderText01\renderText_01.asm line 319
80034CD8 @loc_80034cd8:                                               ; src\renderText01\renderText_01.asm line 321
80034CD8    beqz    v0,0x80034D24                                     ; src\renderText01\renderText_01.asm line 322
80034CDC    nop                                                       ; src\renderText01\renderText_01.asm line 323
80034CE0    j       0x80034DCC                                        ; src\renderText01\renderText_01.asm line 324
80034CE4    sw      zero,0x68(s0)                                     ; src\renderText01\renderText_01.asm line 325
80034CE8 @loc_80034ce8:                                               ; src\renderText01\renderText_01.asm line 328
80034CE8    lhu     v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 329
80034CEC    nop                                                       ; src\renderText01\renderText_01.asm line 330
80034CF0    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 331
80034CF4    sh      v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 332
80034CF8    andi    v0,s2,0x80                                        ; src\renderText01\renderText_01.asm line 333
80034CFC    j       0x80052158                                        ; src\renderText01\renderText_01.asm line 336
80034D00    nop                                                       ; src\renderText01\renderText_01.asm line 337
80034D04 @loc_80034d04:                                               ; src\renderText01\renderText_01.asm line 343
80034D04    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 344
80034D08    nop                                                       ; src\renderText01\renderText_01.asm line 345
80034D0C    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 346
80034D10    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 347
80034D14 @loc_80034d14:                                               ; src\renderText01\renderText_01.asm line 349
80034D14    lw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 350
80034D18    nop                                                       ; src\renderText01\renderText_01.asm line 351
80034D1C    addiu   v0,0x1                                            ; src\renderText01\renderText_01.asm line 352
80034D20    sw      v0,0x54(s0)                                       ; src\renderText01\renderText_01.asm line 353
80034D24 @loc_80034d24:                                               ; src\renderText01\renderText_01.asm line 355
80034D24    lw      v0,0xB0(s0)                                       ; src\renderText01\renderText_01.asm line 356
80034D28    nop                                                       ; src\renderText01\renderText_01.asm line 357
80034D2C    andi    v0,0x40                                           ; src\renderText01\renderText_01.asm line 358
80034D30    bnez    v0,0x80034D7C                                     ; src\renderText01\renderText_01.asm line 359
80034D34    nop                                                       ; src\renderText01\renderText_01.asm line 360
80034D38    lhu     v0,0x5C(s0)                                       ; src\renderText01\renderText_01.asm line 361
80034D3C    lhu     v1,0x60(s0)                                       ; src\renderText01\renderText_01.asm line 362
80034D40    nop                                                       ; src\renderText01\renderText_01.asm line 363
80034D44    addu    v0,v1                                             ; src\renderText01\renderText_01.asm line 364
80034D48    sll     v0,0x10                                           ; src\renderText01\renderText_01.asm line 365
80034D4C    lh      v1,0x78(s0)                                       ; src\renderText01\renderText_01.asm line 366
80034D50    sra     v0,0x10                                           ; src\renderText01\renderText_01.asm line 367
80034D54    slt     v0,v1                                             ; src\renderText01\renderText_01.asm line 368
80034D58    bnez    v0,0x80034D7C                                     ; src\renderText01\renderText_01.asm line 369
80034D5C    nop                                                       ; src\renderText01\renderText_01.asm line 370
80034D60    lhu     v0,0x70(s0)                                       ; src\renderText01\renderText_01.asm line 371
80034D64    nop                                                       ; src\renderText01\renderText_01.asm line 372
80034D68    andi    v0,0x20                                           ; src\renderText01\renderText_01.asm line 373
80034D6C    bnez    v0,0x80034D7C                                     ; src\renderText01\renderText_01.asm line 374
80034D70    nop                                                       ; src\renderText01\renderText_01.asm line 375
80034D74    jal     0x80035ABC                                        ; src\renderText01\renderText_01.asm line 376
80034D78    move    a0,s0                                             ; src\renderText01\renderText_01.asm line 377
80034D7C @loc_80034d7c:                                               ; src\renderText01\renderText_01.asm line 379
80034D7C    lhu     v0,0x70(s0)                                       ; src\renderText01\renderText_01.asm line 380
80034D80    nop                                                       ; src\renderText01\renderText_01.asm line 381
80034D84    andi    v0,0xA                                            ; src\renderText01\renderText_01.asm line 382
80034D88    bnez    v0,0x80034DC8                                     ; src\renderText01\renderText_01.asm line 383
80034D8C    nop                                                       ; src\renderText01\renderText_01.asm line 384
80034D90 @loc_80034d90:                                               ; src\renderText01\renderText_01.asm line 386
80034D90    lh      v1,0x8C(s0)                                       ; src\renderText01\renderText_01.asm line 387
80034D94    lw      v0,0x68(s0)                                       ; src\renderText01\renderText_01.asm line 388
80034D98    nop                                                       ; src\renderText01\renderText_01.asm line 389
80034D9C    slt     v0,v1                                             ; src\renderText01\renderText_01.asm line 390
80034DA0    beqz    v0,0x80034AA8                                     ; src\renderText01\renderText_01.asm line 391
80034DA4    nop                                                       ; src\renderText01\renderText_01.asm line 392
80034DA8 @loc_80034da8:                                               ; src\renderText01\renderText_01.asm line 394
80034DA8    lhu     v0,0x50(s0)                                       ; src\renderText01\renderText_01.asm line 395
80034DAC    lhu     v1,0x2(s4)                                        ; src\renderText01\renderText_01.asm line 396
80034DB0    nop                                                       ; src\renderText01\renderText_01.asm line 397
80034DB4    sltu    v0,v1                                             ; src\renderText01\renderText_01.asm line 398
80034DB8    beqz    v0,0x80034DD4                                     ; src\renderText01\renderText_01.asm line 399
80034DBC    addiu   v0,r0,-0x1                                        ; src\renderText01\renderText_01.asm line 400
80034DC0    j       0x80034DE0                                        ; src\renderText01\renderText_01.asm line 401
80034DC4    nop                                                       ; src\renderText01\renderText_01.asm line 402
80034DC8 @loc_80034dc8:                                               ; src\renderText01\renderText_01.asm line 405
80034DC8    sw      zero,0x68(s0)                                     ; src\renderText01\renderText_01.asm line 406
80034DCC @loc_80034dcc:                                               ; src\renderText01\renderText_01.asm line 408
80034DCC    j       0x80034DE0                                        ; src\renderText01\renderText_01.asm line 409
80034DD0    addiu   v0,r0,-0x1                                        ; src\renderText01\renderText_01.asm line 410
80034DD4 @loc_80034dd4:                                               ; src\renderText01\renderText_01.asm line 413
80034DD4    move    v0,zero                                           ; src\renderText01\renderText_01.asm line 414
80034DD8 @loc_80034dd8:                                               ; src\renderText01\renderText_01.asm line 416
80034DD8    sh      zero,0x50(s0)                                     ; src\renderText01\renderText_01.asm line 417
80034DDC    sw      zero,0x54(s0)                                     ; src\renderText01\renderText_01.asm line 418
80034DE0 @loc_80034de0:                                               ; src\renderText01\renderText_01.asm line 420
80034DE0    j       0x800520D8                                        ; src\renderText01\renderText_01.asm line 423
80034DE4    lw      s4,0x20(sp)                                       ; src\renderText01\renderText_01.asm line 428
80034DE8    lw      s3,0x1C(sp)                                       ; src\renderText01\renderText_01.asm line 429
80034DEC    lw      s2,0x18(sp)                                       ; src\renderText01\renderText_01.asm line 430
80034DF0    lw      s1,0x14(sp)                                       ; src\renderText01\renderText_01.asm line 431
80034DF4    lw      s0,0x10(sp)                                       ; src\renderText01\renderText_01.asm line 432
80034DF8    jr      ra                                                ; src\renderText01\renderText_01.asm line 433
80034DFC    addiu   sp,0x44                                           ; src\renderText01\renderText_01.asm line 434
80034E00 .endarea                                                     ; src\renderText01\renderText_01.asm line 434
80034E00 .org 0x80034E00                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 155
80034E00 .area 0x00000230                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 156
80034E00 rendertextcharacter01:                                       ; src\renderText01\renderText_01_renderChar.asm line 47
80034E00    addiu   sp,-0x248                                         ; src\renderText01\renderText_01_renderChar.asm line 48
80034E04    sw      s0,0x220(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 49
80034E08    move    s0,a0                                             ; src\renderText01\renderText_01_renderChar.asm line 50
80034E0C    sw      s1,0x224(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 51
80034E10    move    s1,a1                                             ; src\renderText01\renderText_01_renderChar.asm line 52
80034E14    sw      s6,0x238(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 53
80034E18    move    s6,a2                                             ; src\renderText01\renderText_01_renderChar.asm line 54
80034E1C    sw      ra,0x240(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 55
80034E20    sw      s7,0x23C(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 56
80034E24    sw      s5,0x234(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 57
80034E28    sw      s4,0x230(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 58
80034E2C    sw      s3,0x22C(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 59
80034E30    sw      s2,0x228(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 60
80034E34    lhu     v1,0x4E(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 62
80034E38    andi    a1,-0x8000                                        ; src\renderText01\renderText_01_renderChar.asm line 63
80034E3C    sll     v0,v1,0x1                                         ; src\renderText01\renderText_01_renderChar.asm line 64
80034E40    addu    v0,v1                                             ; src\renderText01\renderText_01_renderChar.asm line 65
80034E44    lw      v1,0x98(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 66
80034E48    sll     v0,0x5                                            ; src\renderText01\renderText_01_renderChar.asm line 67
80034E4C    beqz    a1,0x80034EE8                                     ; src\renderText01\renderText_01_renderChar.asm line 68
80034E50    addu    s7,v1,v0                                          ; src\renderText01\renderText_01_renderChar.asm line 69
80034E54 @renderbioscharacter:                                        ; src\renderText01\renderText_01_renderChar.asm line 73
80034E54    ori     s5,r0,0x4                                         ; src\renderText01\renderText_01_renderChar.asm line 74
80034E58    ori     a1,r0,0x4                                         ; src\renderText01\renderText_01_renderChar.asm line 75
80034E5C    jal     0x8003629C                                        ; src\renderText01\renderText_01_renderChar.asm line 76
80034E60    ori     a2,r0,0x1                                         ; src\renderText01\renderText_01_renderChar.asm line 77
80034E64    jal     0x80055C4C                                        ; src\renderText01\renderText_01_renderChar.asm line 78
80034E68    andi    a0,s1,-0x1                                        ; src\renderText01\renderText_01_renderChar.asm line 79
80034E6C    addiu   a0,sp,0x18                                        ; src\renderText01\renderText_01_renderChar.asm line 81
80034E70    move    a1,v0                                             ; src\renderText01\renderText_01_renderChar.asm line 82
80034E74    jal     0x80033EE4                                        ; src\renderText01\renderText_01_renderChar.asm line 83
80034E78    move    a2,zero                                           ; src\renderText01\renderText_01_renderChar.asm line 84
80034E7C    addiu   a0,sp,0x218                                       ; src\renderText01\renderText_01_renderChar.asm line 86
80034E80    lbu     v0,0x58(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 87
80034E84    lhu     a1,0x84(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 88
80034E88    lhu     v1,0x48(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 89
80034E8C    addu    a1,v0                                             ; src\renderText01\renderText_01_renderChar.asm line 90
80034E90    andi    a1,-0x1                                           ; src\renderText01\renderText_01_renderChar.asm line 91
80034E94    andi    v0,a1,0xF                                         ; src\renderText01\renderText_01_renderChar.asm line 92
80034E98    sll     v0,0x6                                            ; src\renderText01\renderText_01_renderChar.asm line 93
80034E9C    addu    v1,v0                                             ; src\renderText01\renderText_01_renderChar.asm line 94
80034EA0    ori     v0,r0,0x4                                         ; src\renderText01\renderText_01_renderChar.asm line 95
80034EA4    srlv    a1,v0                                             ; src\renderText01\renderText_01_renderChar.asm line 96
80034EA8    sh      v1,0x218(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 97
80034EAC    lhu     v1,0x4A(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 98
80034EB0    sll     a1,0x8                                            ; src\renderText01\renderText_01_renderChar.asm line 99
80034EB4    sh      v0,0x21C(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 100
80034EB8    addu    v1,a1                                             ; src\renderText01\renderText_01_renderChar.asm line 101
80034EBC    sh      v1,0x21A(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 102
80034EC0    lbu     v0,0x91(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 103
80034EC4    addiu   a1,sp,0x18                                        ; src\renderText01\renderText_01_renderChar.asm line 104
80034EC8    jal     0x80055790                                        ; src\renderText01\renderText_01_renderChar.asm line 105
80034ECC    sh      v0,0x21E(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 106
80034ED0    move    a0,s0                                             ; src\renderText01\renderText_01_renderChar.asm line 107
80034ED4    move    a1,s7                                             ; src\renderText01\renderText_01_renderChar.asm line 108
80034ED8    jal     0x80034138                                        ; src\renderText01\renderText_01_renderChar.asm line 109
80034EDC    ori     a2,r0,0x1                                         ; src\renderText01\renderText_01_renderChar.asm line 110
80034EE0    j       0x80034FA8                                        ; src\renderText01\renderText_01_renderChar.asm line 111
80034EE4    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 112
80034EE8 @rendermfocharacter:                                         ; src\renderText01\renderText_01_renderChar.asm line 116
80034EE8    andi    v0,s1,-0x1                                        ; src\renderText01\renderText_01_renderChar.asm line 117
80034EEC    lw      v1,0x4(s0)                                        ; src\renderText01\renderText_01_renderChar.asm line 118
80034EF0    sll     v0,0x3                                            ; src\renderText01\renderText_01_renderChar.asm line 119
80034EF4    addu    s3,v1,v0                                          ; src\renderText01\renderText_01_renderChar.asm line 120
80034EF8    jal     0x8005218C                                        ; src\renderText01\renderText_01_renderChar.asm line 123
80034EFC    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 124
80034F00    andi    v0,v1,0x1                                         ; src\renderText01\renderText_01_renderChar.asm line 130
80034F04    bnez    v0,0x80034F1C                                     ; src\renderText01\renderText_01_renderChar.asm line 131
80034F08    ori     s2,r0,0x4                                         ; src\renderText01\renderText_01_renderChar.asm line 132
80034F0C    andi    v0,v1,0x4                                         ; src\renderText01\renderText_01_renderChar.asm line 133
80034F10    beqz    v0,0x80034F1C                                     ; src\renderText01\renderText_01_renderChar.asm line 134
80034F14    ori     s2,r0,0x1                                         ; src\renderText01\renderText_01_renderChar.asm line 135
80034F18    ori     s2,r0,0x2                                         ; src\renderText01\renderText_01_renderChar.asm line 136
80034F1C @loadmfocharentrydata:                                       ; src\renderText01\renderText_01_renderChar.asm line 138
80034F1C    jal     0x8005219C                                        ; src\renderText01\renderText_01_renderChar.asm line 141
80034F20    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 142
80034F24    mult    v0,s1                                             ; src\renderText01\renderText_01_renderChar.asm line 148
80034F28    lw      v1,0xC(s0)                                        ; src\renderText01\renderText_01_renderChar.asm line 149
80034F2C    lw      v0,0x0(s3)                                        ; src\renderText01\renderText_01_renderChar.asm line 150
80034F30    mflo    a0                                                ; src\renderText01\renderText_01_renderChar.asm line 151
80034F34    bgez    a0,0x80034F40                                     ; src\renderText01\renderText_01_renderChar.asm line 152
80034F38    addu    s4,v1,v0                                          ; src\renderText01\renderText_01_renderChar.asm line 153
80034F3C    addiu   a0,0x3                                            ; src\renderText01\renderText_01_renderChar.asm line 154
80034F40 @setupclapmposition:                                         ; src\renderText01\renderText_01_renderChar.asm line 156
80034F40    srl     s5,a0,0x2                                         ; src\renderText01\renderText_01_renderChar.asm line 157
80034F44    move    a0,s0                                             ; src\renderText01\renderText_01_renderChar.asm line 158
80034F48    move    a1,s5                                             ; src\renderText01\renderText_01_renderChar.asm line 159
80034F4C    jal     0x8003629C                                        ; src\renderText01\renderText_01_renderChar.asm line 160
80034F50    move    a2,s1                                             ; src\renderText01\renderText_01_renderChar.asm line 161
80034F54    lbu     v0,0x7(s3)                                        ; src\renderText01\renderText_01_renderChar.asm line 162
80034F58    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 163
80034F5C    andi    v0,0x8                                            ; src\renderText01\renderText_01_renderChar.asm line 164
80034F60    beqz    v0,0x80034F78                                     ; src\renderText01\renderText_01_renderChar.asm line 165
80034F64    move    a0,s0                                             ; src\renderText01\renderText_01_renderChar.asm line 166
80034F68    move    a1,s4                                             ; src\renderText01\renderText_01_renderChar.asm line 167
80034F6C    move    a2,s1                                             ; src\renderText01\renderText_01_renderChar.asm line 168
80034F70    j       0x80034F84                                        ; src\renderText01\renderText_01_renderChar.asm line 169
80034F74    addiu   a3,r0,-0x1                                        ; src\renderText01\renderText_01_renderChar.asm line 170
80034F78 loc_80034f78:                                                ; src\renderText01\renderText_01_renderChar.asm line 172
80034F78    move    a1,s4                                             ; src\renderText01\renderText_01_renderChar.asm line 173
80034F7C    move    a2,s1                                             ; src\renderText01\renderText_01_renderChar.asm line 174
80034F80    move    a3,zero                                           ; src\renderText01\renderText_01_renderChar.asm line 175
80034F84 loc_80034f84:                                                ; src\renderText01\renderText_01_renderChar.asm line 177
80034F84    jal     0x80036354                                        ; src\renderText01\renderText_01_renderChar.asm line 178
80034F88    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 179
80034F8C    andi    v0,s6,-0x1                                        ; src\renderText01\renderText_01_renderChar.asm line 180
80034F90    sw      v0,0x10(sp)                                       ; src\renderText01\renderText_01_renderChar.asm line 181
80034F94    move    a0,s0                                             ; src\renderText01\renderText_01_renderChar.asm line 182
80034F98    move    a1,s3                                             ; src\renderText01\renderText_01_renderChar.asm line 183
80034F9C    move    a2,s7                                             ; src\renderText01\renderText_01_renderChar.asm line 184
80034FA0    jal     0x80035030                                        ; src\renderText01\renderText_01_renderChar.asm line 185
80034FA4    move    a3,s2                                             ; src\renderText01\renderText_01_renderChar.asm line 186
80034FA8 @addcharacterrect:                                           ; src\renderText01\renderText_01_renderChar.asm line 190
80034FA8    lhu     v0,0x48(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 191
80034FAC    lhu     v1,0x4E(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 192
80034FB0    addu    v0,s5                                             ; src\renderText01\renderText_01_renderChar.asm line 193
80034FB4    sh      v0,0x48(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 194
80034FB8    lhu     v0,0x88(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 195
80034FBC    addiu   v1,0x1                                            ; src\renderText01\renderText_01_renderChar.asm line 196
80034FC0    sh      v1,0x4E(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 197
80034FC4    andi    v1,-0x1                                           ; src\renderText01\renderText_01_renderChar.asm line 198
80034FC8    sltu    v1,v0                                             ; src\renderText01\renderText_01_renderChar.asm line 199
80034FCC    bnez    v1,0x80034FD8                                     ; src\renderText01\renderText_01_renderChar.asm line 200
80034FD0    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 201
80034FD4    sh      zero,0x4E(s0)                                     ; src\renderText01\renderText_01_renderChar.asm line 202
80034FD8 loc_80034fd8:                                                ; src\renderText01\renderText_01_renderChar.asm line 204
80034FD8    lhu     v0,0x4C(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 205
80034FDC    lhu     v1,0x88(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 206
80034FE0    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 207
80034FE4    sltu    v0,v1                                             ; src\renderText01\renderText_01_renderChar.asm line 208
80034FE8    bnez    v0,0x80034FF4                                     ; src\renderText01\renderText_01_renderChar.asm line 209
80034FEC    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 210
80034FF0    sh      zero,0x4C(s0)                                     ; src\renderText01\renderText_01_renderChar.asm line 211
80034FF4 loc_80034ff4:                                                ; src\renderText01\renderText_01_renderChar.asm line 213
80034FF4    lhu     v0,0x70(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 214
80034FF8    nop                                                       ; src\renderText01\renderText_01_renderChar.asm line 215
80034FFC    ori     v0,0x40                                           ; src\renderText01\renderText_01_renderChar.asm line 216
80035000    sh      v0,0x70(s0)                                       ; src\renderText01\renderText_01_renderChar.asm line 217
80035004 @return:                                                     ; src\renderText01\renderText_01_renderChar.asm line 219
80035004    lw      ra,0x240(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 220
80035008    lw      s7,0x23C(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 221
8003500C    lw      s6,0x238(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 222
80035010    lw      s5,0x234(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 223
80035014    lw      s4,0x230(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 224
80035018    lw      s3,0x22C(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 225
8003501C    lw      s2,0x228(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 226
80035020    lw      s1,0x224(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 227
80035024    lw      s0,0x220(sp)                                      ; src\renderText01\renderText_01_renderChar.asm line 228
80035028    jr      ra                                                ; src\renderText01\renderText_01_renderChar.asm line 229
8003502C    addiu   sp,0x248                                          ; src\renderText01\renderText_01_renderChar.asm line 230
80035030 .endarea                                                     ; src\renderText01\renderText_01_renderChar.asm line 230
80035030 .org 0x8003629C                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 160
8003629C .area 0x000000B8                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 161
8003629C rendertext_clampposition:                                    ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 17
8003629C    move    a3,a0                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 18
800362A0    andi    a1,-0x1                                           ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 19
800362A4    lhu     a0,0x48(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 20
800362A8    ori     v0,r0,0x40                                        ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 21
800362AC    subu    v0,a0                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 22
800362B0    slt     a1,v0                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 23
800362B4    bnez    a1,0x8003634C                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 24
800362B8    nop                                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 25
800362BC    lbu     v0,0x58(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 26
800362C0    lhu     v1,0x86(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 27
800362C4    addiu   v0,0x1                                            ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 28
800362C8    slt     v0,v1                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 29
800362CC    beqz    v0,0x8003630C                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 30
800362D0    sltiu   v0,a0,0x40                                        ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 31
800362D4    bnez    v0,0x800362F4                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 32
800362D8    andi    v1,a2,0xFF                                        ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 33
800362DC    lbu     v0,0x58(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 34
800362E0    addiu   v1,a0,-0x40                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 35
800362E4    sh      v1,0x48(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 36
800362E8 loc_800362e8:                                                ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 38
800362E8    addiu   v0,0x1                                            ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 39
800362EC    jr      ra                                                ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 40
800362F0    sb      v0,0x58(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 41
800362F4 loc_800362f4:                                                ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 43
800362F4    ori     v0,r0,0x1                                         ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 44
800362F8    bne     v1,v0,0x8003634C                                  ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 45
800362FC    nop                                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 46
80036300    lbu     v0,0x58(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 47
80036304    j       0x800362E8                                        ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 48
80036308    sh      zero,0x48(a3)                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 49
8003630C loc_8003630c:                                                ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 51
8003630C    lbu     v1,0x91(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 52
80036310    lhu     v0,0x4A(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 53
80036314    lhu     a0,0x82(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 54
80036318    addu    v0,v1                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 55
8003631C    lbu     v1,0x91(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 56
80036320    sb      zero,0x58(a3)                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 57
80036324    sh      zero,0x48(a3)                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 58
80036328    sh      v0,0x4A(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 59
8003632C    andi    v0,-0x1                                           ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 60
80036330    addu    v0,v1                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 61
80036334    slt     v0,a0                                             ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 62
80036338    bnez    v0,0x8003634C                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 63
8003633C    nop                                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 64
80036340    lhu     v0,0x80(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 65
80036344    nop                                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 66
80036348    sh      v0,0x4A(a3)                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 67
8003634C @return:                                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 69
8003634C    jr      ra                                                ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 70
80036350    nop                                                       ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 71
80036354 .endarea                                                     ; src\renderText01\renderText_01_renderChar_clampPosition.asm line 71
80036354 .org 0x80036354                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 165
80036354 .area 0x00000088                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 166
80036354 rendertext_loadimage:                                        ; src\renderText01\renderText_01_renderChar_loadImage.asm line 23
80036354    addiu   sp,-0x20                                          ; src\renderText01\renderText_01_renderChar_loadImage.asm line 24
80036358    move    a3,a0                                             ; src\renderText01\renderText_01_renderChar_loadImage.asm line 25
8003635C    sw      ra,0x18(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 26
80036360    lbu     v1,0x58(a3)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 28
80036364    lhu     v0,0x84(a3)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 29
80036368    lhu     a0,0x48(a3)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 30
8003636C    addu    v0,v1                                             ; src\renderText01\renderText_01_renderChar_loadImage.asm line 31
80036370    andi    v0,-0x1                                           ; src\renderText01\renderText_01_renderChar_loadImage.asm line 32
80036374    andi    v1,v0,0xF                                         ; src\renderText01\renderText_01_renderChar_loadImage.asm line 33
80036378    sll     v1,0x6                                            ; src\renderText01\renderText_01_renderChar_loadImage.asm line 34
8003637C    addu    a0,v1                                             ; src\renderText01\renderText_01_renderChar_loadImage.asm line 35
80036380    srl     v0,0x4                                            ; src\renderText01\renderText_01_renderChar_loadImage.asm line 36
80036384    sh      a0,0x10(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 37
80036388    lhu     v1,0x4A(a3)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 38
8003638C    sll     v0,0x8                                            ; src\renderText01\renderText_01_renderChar_loadImage.asm line 39
80036390    addu    v1,v0                                             ; src\renderText01\renderText_01_renderChar_loadImage.asm line 40
80036394    sh      v1,0x12(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 41
80036398    jal     0x800521AC                                        ; src\renderText01\renderText_01_renderChar_loadImage.asm line 44
8003639C    nop                                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 45
800363A0    mult    v0,a2                                             ; src\renderText01\renderText_01_renderChar_loadImage.asm line 51
800363A4    mflo    v0                                                ; src\renderText01\renderText_01_renderChar_loadImage.asm line 52
800363A8    bgez    v0,0x800363B4                                     ; src\renderText01\renderText_01_renderChar_loadImage.asm line 53
800363AC    nop                                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 54
800363B0    addiu   v0,0x3                                            ; src\renderText01\renderText_01_renderChar_loadImage.asm line 55
800363B4 loc_800363b4:                                                ; src\renderText01\renderText_01_renderChar_loadImage.asm line 57
800363B4    sra     v0,0x2                                            ; src\renderText01\renderText_01_renderChar_loadImage.asm line 58
800363B8    sh      v0,0x14(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 59
800363BC    lbu     v0,0x91(a3)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 60
800363C0    addiu   a0,sp,0x10                                        ; src\renderText01\renderText_01_renderChar_loadImage.asm line 61
800363C4    jal     0x80053214                                        ; src\renderText01\renderText_01_renderChar_loadImage.asm line 62
800363C8    sh      v0,0x16(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 63
800363CC    lw      ra,0x18(sp)                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 64
800363D0    nop                                                       ; src\renderText01\renderText_01_renderChar_loadImage.asm line 65
800363D4    jr      ra                                                ; src\renderText01\renderText_01_renderChar_loadImage.asm line 66
800363D8    addiu   sp,0x20                                           ; src\renderText01\renderText_01_renderChar_loadImage.asm line 67
800363DC .endarea                                                     ; src\renderText01\renderText_01_renderChar_loadImage.asm line 67
800363DC .org 0x80035030                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 170
80035030 .area 0x00000238                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 171
80035030 rendertextsub01_04:                                          ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 10
80035030    addiu   sp,-0x28                                          ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 11
80035034    sw      s1,0x14(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 12
80035038    move    s1,a0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 13
8003503C    sw      ra,0x20(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 14
80035040    sw      s3,0x1C(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 15
80035044    sw      s2,0x18(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 16
80035048    sw      s0,0x10(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 17
8003504C    lhu     v0,0x5C(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 18
80035050    lhu     v1,0x60(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 19
80035054    move    s0,a2                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 20
80035058    addu    v0,v1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 21
8003505C    sh      v0,0x56(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 22
80035060    lhu     v0,0x38(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 23
80035064    lhu     v1,0x5E(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 24
80035068    lhu     a0,0x62(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 25
8003506C    move    s3,a1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 26
80035070    sh      zero,0x50(s0)                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 27
80035074    sh      zero,0x52(s0)                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 28
80035078    sh      zero,0x54(s0)                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 29
8003507C    ori     v0,0x3                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 30
80035080    addu    v1,a0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 31
80035084    sb      v0,0x5C(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 32
80035088    sh      v1,0x58(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 33
8003508C    lw      v0,0xB0(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 34
80035090    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 35
80035094    andi    v0,0x10                                           ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 36
80035098    bnez    v0,0x800350AC                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 39
8003509C    addiu   s2,s0,0x28                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 40
800350A0    lbu     v0,0x5(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 46
800350A4    j       0x800350B8                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 47
800350A8    sb      v0,0x64(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 48
800350AC loc_800350ac:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 51
800350AC    lbu     v0,0x92(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 52
800350B0    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 53
800350B4    sb      v0,0x64(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 54
800350B8 loc_800350b8:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 56
800350B8    lw      v0,0xB0(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 57
800350BC    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 58
800350C0    andi    v0,0x20                                           ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 59
800350C4    beqz    v0,0x800350D8                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 60
800350C8    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 61
800350CC    lbu     v0,0x6(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 62
800350D0    j       0x800350E4                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 63
800350D4    sb      v0,0x65(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 64
800350D8 loc_800350d8:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 67
800350D8    lbu     v0,0x93(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 68
800350DC    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 69
800350E0    sb      v0,0x65(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 70
800350E4 loc_800350e4:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 72
800350E4    lw      v0,0xB0(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 73
800350E8    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 74
800350EC    andi    v0,0x4                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 75
800350F0    beqz    v0,0x80035110                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 78
800350F4    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 79
800350F8    lbu     v0,0x90(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 85
800350FC    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 86
80035100    sb      v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 87
80035104    lbu     v0,0x91(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 88
80035108    j       0x80035128                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 89
8003510C    sb      v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 90
80035110 loc_80035110:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 93
80035110    lbu     v0,0x5(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 94
80035114    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 95
80035118    sb      v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 96
8003511C    lbu     v0,0x6(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 97
80035120    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 98
80035124    sb      v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 99
80035128 loc_80035128:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 101
80035128    lhu     v0,0x48(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 102
8003512C    andi    a0,a3,0xFF                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 103
80035130    sll     v0,0x2                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 104
80035134    div     v0,a0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 105
80035138    mflo    v0                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 106
8003513C    lhu     a3,0x4A(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 107
80035140    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 108
80035144    sb      a3,0xD(s0)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 109
80035148    move    t0,v0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 110
8003514C    sb      t0,0xC(s0)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 111
80035150    lbu     v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 112
80035154    move    v1,t0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 113
80035158    sb      a3,0x15(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 114
8003515C    sb      t0,0x1C(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 115
80035160    addu    v0,v1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 116
80035164    sb      v0,0x14(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 117
80035168    lbu     v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 118
8003516C    move    a1,a3                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 119
80035170    addu    v0,a1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 120
80035174    sb      v0,0x1D(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 121
80035178    lbu     v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 122
8003517C    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 123
80035180    addu    v0,v1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 124
80035184    sb      v0,0x24(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 125
80035188    lbu     v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 126
8003518C    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 127
80035190    addu    v0,a1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 128
80035194    sb      v0,0x25(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 129
80035198    sb      t0,0xC(s2)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 130
8003519C    sb      a3,0xD(s2)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 131
800351A0    lbu     v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 132
800351A4    sb      a3,0x15(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 133
800351A8    sb      t0,0x1C(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 134
800351AC    addu    v0,v1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 135
800351B0    sb      v0,0x14(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 136
800351B4    lbu     v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 137
800351B8    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 138
800351BC    addu    v0,a1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 139
800351C0    sb      v0,0x1D(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 140
800351C4    lbu     v0,0x5A(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 141
800351C8    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 142
800351CC    addu    v0,v1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 143
800351D0    sb      v0,0x24(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 144
800351D4    lbu     v0,0x5B(a2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 145
800351D8    srl     a0,0x1                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 146
800351DC    addu    v0,a1                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 147
800351E0    sb      v0,0x25(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 148
800351E4    lbu     v0,0x58(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 149
800351E8    lhu     a2,0x84(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 150
800351EC    move    a1,zero                                           ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 151
800351F0    addu    a2,v0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 152
800351F4    andi    a2,-0x1                                           ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 153
800351F8    srl     v0,a2,0x4                                         ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 154
800351FC    sll     a3,v0,0x8                                         ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 155
80035200    andi    a2,0xF                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 156
80035204    sll     a2,0x6                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 157
80035208    jal     0x800563AC                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 158
8003520C    andi    a3,-0x100                                         ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 159
80035210    sh      v0,0x16(s2)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 160
80035214    sh      v0,0x16(s0)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 161
80035218    lbu     v0,0x7(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 162
8003521C    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 163
80035220    andi    v0,0x1                                            ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 164
80035224    bnez    v0,0x8003524C                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 165
80035228    nop                                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 166
8003522C    lhu     a3,0x7E(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 167
80035230    lbu     v0,0x4(s3)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 168
80035234    lhu     a0,0x7C(s1)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 169
80035238    addu    a3,v0                                             ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 170
8003523C    jal     0x800563EC                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 171
80035240    andi    a1,a3,-0x1                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 172
80035244    sh      v0,0xE(s2)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 173
80035248    sh      v0,0xE(s0)                                        ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 174
8003524C loc_8003524c:                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 176
8003524C    lw      ra,0x20(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 177
80035250    lw      s3,0x1C(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 178
80035254    lw      s2,0x18(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 179
80035258    lw      s1,0x14(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 180
8003525C    lw      s0,0x10(sp)                                       ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 181
80035260    jr      ra                                                ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 182
80035264    addiu   sp,0x28                                           ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 183
80035268 .endarea                                                     ; src\renderText01\renderText_01_setUvPolyFt4_MfoFonts.asm line 183
80035268 .org 0x80035D38                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 175
80035D38 .area 0x000000FC                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 176
80035460 rendertext02_renderchar:                                     ; src\renderText02\renderText_02.asm line 9
80035D38 rendertext02_80035d38:                                       ; src\renderText02\renderText_02.asm line 53
80035D38    addiu   sp,-0x58                                          ; src\renderText02\renderText_02.asm line 54
80035D3C    sw      s3,0x1C(sp)                                       ; src\renderText02\renderText_02.asm line 55
80035D40    move    s3,a0                                             ; src\renderText02\renderText_02.asm line 56
80035D44    sw      s1,0x14(sp)                                       ; src\renderText02\renderText_02.asm line 57
80035D48    move    s1,zero                                           ; src\renderText02\renderText_02.asm line 58
80035D4C    andi    a1,-0x1                                           ; src\renderText02\renderText_02.asm line 59
80035D50    sw      ra,0x20(sp)                                       ; src\renderText02\renderText_02.asm line 60
80035D54    sw      s2,0x18(sp)                                       ; src\renderText02\renderText_02.asm line 61
80035D58    sw      s0,0x10(sp)                                       ; src\renderText02\renderText_02.asm line 62
80035D5C @get_string_entry:                                           ; src\renderText02\renderText_02.asm line 64
80035D5C    lw      v0,0x18(s3)                                       ; src\renderText02\renderText_02.asm line 65
80035D60    sll     a1,0x2                                            ; src\renderText02\renderText_02.asm line 66
80035D64    sh      a2,0x24(s3)                                       ; src\renderText02\renderText_02.asm line 67
80035D68    sh      a3,0x26(s3)                                       ; src\renderText02\renderText_02.asm line 68
80035D6C    addu    s2,v0,a1                                          ; src\renderText02\renderText_02.asm line 69
80035D70    j       0x80052218                                        ; src\renderText02\renderText_02.asm line 72
80035D74    lw      v0,0x1C(s3)                                       ; src\renderText02\renderText_02.asm line 77
80035D78    lhu     v1,0x2(s2)                                        ; src\renderText02\renderText_02.asm line 78
80035D7C    nop                                                       ; src\renderText02\renderText_02.asm line 79
80035D80 @check_string_entry:                                         ; src\renderText02\renderText_02.asm line 81
80035D80    beqz    v1,0x80035E14                                     ; src\renderText02\renderText_02.asm line 82
80035D84    nop                                                       ; src\renderText02\renderText_02.asm line 83
80035D88 @readcharacter_80035d88:                                     ; src\renderText02\renderText_02.asm line 85
80035D88    j       0x8005232C                                        ; src\renderText02\renderText_02.asm line 88
80035D8C    nop                                                       ; src\renderText02\renderText_02.asm line 93
80035D90    andi    v0,a0,0x80                                        ; src\renderText02\renderText_02.asm line 94
80035D94    beqz    v0,0x80035DAC                                     ; src\renderText02\renderText_02.asm line 95
80035D98    addiu   s0,0x1                                            ; src\renderText02\renderText_02.asm line 96
80035D9C    lbu     v1,0x0(s0)                                        ; src\renderText02\renderText_02.asm line 98
80035DA0    addiu   s0,0x1                                            ; src\renderText02\renderText_02.asm line 99
80035DA4    j       0x80035DCC                                        ; src\renderText02\renderText_02.asm line 100
80035DA8    sll     v0,a0,0x8                                         ; src\renderText02\renderText_02.asm line 101
80035DAC @readtablecharacter_80035dac:                                ; src\renderText02\renderText_02.asm line 103
80035DAC    sll     v0,a0,0x1                                         ; src\renderText02\renderText_02.asm line 104
80035DB0    lw      v1,0x14(s3)                                       ; src\renderText02\renderText_02.asm line 105
80035DB4    addiu   v0,0x8                                            ; src\renderText02\renderText_02.asm line 106
80035DB8    addu    v1,v0                                             ; src\renderText02\renderText_02.asm line 107
80035DBC    lhu     a1,0x0(v1)                                        ; src\renderText02\renderText_02.asm line 108
80035DC0    nop                                                       ; src\renderText02\renderText_02.asm line 109
80035DC4    srl     v1,a1,0x8                                         ; src\renderText02\renderText_02.asm line 110
80035DC8    sll     v0,a1,0x8                                         ; src\renderText02\renderText_02.asm line 111
80035DCC @checkcharactercode_80035dcc:                                ; src\renderText02\renderText_02.asm line 113
80035DCC    or      a1,v0,v1                                          ; src\renderText02\renderText_02.asm line 114
80035DD0 @handle_character_02:                                        ; src\renderText02\renderText_02.asm line 116
80035DD0    j       0x800521BC                                        ; src\renderText02\renderText_02.asm line 118
80035DD4    nop                                                       ; src\renderText02\renderText_02.asm line 119
80035DD8    bne     v1,v0,0x80035DE8                                  ; src\renderText02\renderText_02.asm line 125
80035DDC    andi    v1,a1,-0x100                                      ; src\renderText02\renderText_02.asm line 126
80035DE0    addiu   a1,0x6000                                         ; src\renderText02\renderText_02.asm line 127
80035DE4    andi    v1,a1,-0x100                                      ; src\renderText02\renderText_02.asm line 128
80035DE8 @tryrendercharacter_80035de8:                                ; src\renderText02\renderText_02.asm line 130
80035DE8    ori     v0,r0,-0x100                                      ; src\renderText02\renderText_02.asm line 131
80035DEC    beq     v1,v0,0x80035E00                                  ; src\renderText02\renderText_02.asm line 132
80035DF0    move    a0,s3                                             ; src\renderText02\renderText_02.asm line 133
80035DF4    andi    a1,-0x1                                           ; src\renderText02\renderText_02.asm line 134
80035DF8    jal     0x80035460                                        ; src\renderText02\renderText_02.asm line 135
80035DFC    move    a2,zero                                           ; src\renderText02\renderText_02.asm line 136
80035E00 @checkisstringend_80035e00:                                  ; src\renderText02\renderText_02.asm line 138
80035E00    lhu     v0,0x2(s2)                                        ; src\renderText02\renderText_02.asm line 139
80035E04    addiu   s1,0x1                                            ; src\renderText02\renderText_02.asm line 140
80035E08    slt     v0,s1,v0                                          ; src\renderText02\renderText_02.asm line 141
80035E0C    bnez    v0,0x80035D88                                     ; src\renderText02\renderText_02.asm line 142
80035E10    nop                                                       ; src\renderText02\renderText_02.asm line 143
80035E14 @return_80035e14:                                            ; src\renderText02\renderText_02.asm line 145
80035E14    j       0x800521F0                                        ; src\renderText02\renderText_02.asm line 148
80035E18    lw      ra,0x20(sp)                                       ; src\renderText02\renderText_02.asm line 154
80035E1C    lw      s3,0x1C(sp)                                       ; src\renderText02\renderText_02.asm line 155
80035E20    lw      s2,0x18(sp)                                       ; src\renderText02\renderText_02.asm line 156
80035E24    lw      s1,0x14(sp)                                       ; src\renderText02\renderText_02.asm line 157
80035E28    lw      s0,0x10(sp)                                       ; src\renderText02\renderText_02.asm line 158
80035E2C    jr      ra                                                ; src\renderText02\renderText_02.asm line 159
80035E30    addiu   sp,0x58                                           ; src\renderText02\renderText_02.asm line 160
80035E34 .endarea                                                     ; src\renderText02\renderText_02.asm line 160
80035E34 .org 0x80035460                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 180
80035460 .area 0x000001F0                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 181
80035460 rendertextmap_renderchar:                                    ; src\renderText02\renderText_02_renderChar.asm line 34
80035460    addiu   sp,-0x22C                                         ; src\renderText02\renderText_02_renderChar.asm line 35
80035464    sw      s1,0x21C(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 36
80035468    move    s1,a0                                             ; src\renderText02\renderText_02_renderChar.asm line 37
8003546C    move    a0,a1                                             ; src\renderText02\renderText_02_renderChar.asm line 38
80035470    andi    a1,-0x8000                                        ; src\renderText02\renderText_02_renderChar.asm line 39
80035474    sw      ra,0x224(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 40
80035478    sw      s2,0x220(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 41
8003547C    beqz    a1,0x80035540                                     ; src\renderText02\renderText_02_renderChar.asm line 42
80035480    sw      s0,0x218(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 43
80035484    ori     s0,r0,0x1                                         ; src\renderText02\renderText_02_renderChar.asm line 44
80035488    lh      v1,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 45
8003548C    ori     v0,r0,0x40                                        ; src\renderText02\renderText_02_renderChar.asm line 46
80035490    subu    v0,v1                                             ; src\renderText02\renderText_02_renderChar.asm line 47
80035494    slti    v0,0x4                                            ; src\renderText02\renderText_02_renderChar.asm line 48
80035498    beqz    v0,0x800354B4                                     ; src\renderText02\renderText_02_renderChar.asm line 49
8003549C    ori     s2,r0,0x4                                         ; src\renderText02\renderText_02_renderChar.asm line 50
800354A0    lbu     v1,0x21(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 51
800354A4    lhu     v0,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 52
800354A8    sh      zero,0x24(s1)                                     ; src\renderText02\renderText_02_renderChar.asm line 53
800354AC    addu    v0,v1                                             ; src\renderText02\renderText_02_renderChar.asm line 54
800354B0    sh      v0,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 55
800354B4 @renderbioscharacter:                                        ; src\renderText02\renderText_02_renderChar.asm line 59
800354B4    ori     a1,r0,0xFF                                        ; src\renderText02\renderText_02_renderChar.asm line 60
800354B8    ori     v1,r0,0xFF                                        ; src\renderText02\renderText_02_renderChar.asm line 61
800354BC    addiu   v0,sp,0x20E                                       ; src\renderText02\renderText_02_renderChar.asm line 62
800354C0 loc_800354c0:                                                ; src\renderText02\renderText_02_renderChar.asm line 64
800354C0    sh      a1,0x0(v0)                                        ; src\renderText02\renderText_02_renderChar.asm line 65
800354C4    addiu   v1,-0x1                                           ; src\renderText02\renderText_02_renderChar.asm line 66
800354C8    bgez    v1,0x800354C0                                     ; src\renderText02\renderText_02_renderChar.asm line 67
800354CC    addiu   v0,-0x2                                           ; src\renderText02\renderText_02_renderChar.asm line 68
800354D0    jal     0x80055C4C                                        ; src\renderText02\renderText_02_renderChar.asm line 69
800354D4    andi    a0,-0x1                                           ; src\renderText02\renderText_02_renderChar.asm line 70
800354D8    addiu   a0,sp,0x10                                        ; src\renderText02\renderText_02_renderChar.asm line 71
800354DC    move    a1,v0                                             ; src\renderText02\renderText_02_renderChar.asm line 72
800354E0    andi    s0,0xFF                                           ; src\renderText02\renderText_02_renderChar.asm line 73
800354E4    jal     0x80033EE4                                        ; src\renderText02\renderText_02_renderChar.asm line 74
800354E8    srl     a2,s0,0x1                                         ; src\renderText02\renderText_02_renderChar.asm line 75
800354EC    addiu   a0,sp,0x210                                       ; src\renderText02\renderText_02_renderChar.asm line 76
800354F0    lbu     v1,0x22(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 77
800354F4    lhu     v0,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 78
800354F8    andi    v1,0xF                                            ; src\renderText02\renderText_02_renderChar.asm line 79
800354FC    sll     v1,0x6                                            ; src\renderText02\renderText_02_renderChar.asm line 80
80035500    addu    v0,v1                                             ; src\renderText02\renderText_02_renderChar.asm line 81
80035504    sh      v0,0x210(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 82
80035508    lbu     v0,0x22(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 83
8003550C    lhu     v1,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 84
80035510    sll     s0,0x2                                            ; src\renderText02\renderText_02_renderChar.asm line 85
80035514    sh      s0,0x214(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 86
80035518    srl     v0,0x4                                            ; src\renderText02\renderText_02_renderChar.asm line 87
8003551C    sll     v0,0x8                                            ; src\renderText02\renderText_02_renderChar.asm line 88
80035520    addu    v1,v0                                             ; src\renderText02\renderText_02_renderChar.asm line 89
80035524    sh      v1,0x212(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 90
80035528    lbu     v0,0x21(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 91
8003552C    addiu   a1,sp,0x10                                        ; src\renderText02\renderText_02_renderChar.asm line 92
80035530    jal     0x80055790                                        ; src\renderText02\renderText_02_renderChar.asm line 93
80035534    sh      v0,0x216(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 94
80035538    j       0x80035628                                        ; src\renderText02\renderText_02_renderChar.asm line 95
8003553C    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 96
80035540 @rendertexturecharacter:                                     ; src\renderText02\renderText_02_renderChar.asm line 100
80035540    andi    v0,a0,-0x1                                        ; src\renderText02\renderText_02_renderChar.asm line 101
80035544    lw      v1,0x4(s1)                                        ; src\renderText02\renderText_02_renderChar.asm line 102
80035548    sll     v0,0x3                                            ; src\renderText02\renderText_02_renderChar.asm line 103
8003554C    addu    a1,v1,v0                                          ; src\renderText02\renderText_02_renderChar.asm line 104
80035550    jal     0x8005242C                                        ; src\renderText02\renderText_02_renderChar.asm line 107
80035554    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 112
80035558    andi    v0,v1,0x1                                         ; src\renderText02\renderText_02_renderChar.asm line 113
8003555C    bnez    v0,0x80035574                                     ; src\renderText02\renderText_02_renderChar.asm line 114
80035560    ori     s0,r0,0x4                                         ; src\renderText02\renderText_02_renderChar.asm line 115
80035564    andi    v0,v1,0x4                                         ; src\renderText02\renderText_02_renderChar.asm line 116
80035568    beqz    v0,0x80035574                                     ; src\renderText02\renderText_02_renderChar.asm line 117
8003556C    ori     s0,r0,0x1                                         ; src\renderText02\renderText_02_renderChar.asm line 118
80035570    ori     s0,r0,0x2                                         ; src\renderText02\renderText_02_renderChar.asm line 119
80035574 @loc_80035574:                                               ; src\renderText02\renderText_02_renderChar.asm line 121
80035574    jal     0x8005243C                                        ; src\renderText02\renderText_02_renderChar.asm line 124
80035578    andi    s0,0xFF                                           ; src\renderText02\renderText_02_renderChar.asm line 129
8003557C    mult    v0,s0                                             ; src\renderText02\renderText_02_renderChar.asm line 130
80035580    lw      v1,0xC(s1)                                        ; src\renderText02\renderText_02_renderChar.asm line 131
80035584    lw      v0,0x0(a1)                                        ; src\renderText02\renderText_02_renderChar.asm line 132
80035588    mflo    a0                                                ; src\renderText02\renderText_02_renderChar.asm line 133
8003558C    bgez    a0,0x80035598                                     ; src\renderText02\renderText_02_renderChar.asm line 134
80035590    addu    a1,v1,v0                                          ; src\renderText02\renderText_02_renderChar.asm line 135
80035594    addiu   a0,0x3                                            ; src\renderText02\renderText_02_renderChar.asm line 136
80035598 loc_80035598:                                                ; src\renderText02\renderText_02_renderChar.asm line 138
80035598    srl     s2,a0,0x2                                         ; src\renderText02\renderText_02_renderChar.asm line 139
8003559C    lh      v1,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 140
800355A0    ori     v0,r0,0x40                                        ; src\renderText02\renderText_02_renderChar.asm line 141
800355A4    subu    v0,v1                                             ; src\renderText02\renderText_02_renderChar.asm line 142
800355A8    slt     v0,s2                                             ; src\renderText02\renderText_02_renderChar.asm line 143
800355AC    beqz    v0,0x800355C8                                     ; src\renderText02\renderText_02_renderChar.asm line 144
800355B0    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 145
800355B4 @movetonewline:                                              ; src\renderText02\renderText_02_renderChar.asm line 147
800355B4    lbu     v1,0x21(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 148
800355B8    lhu     v0,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 149
800355BC    sh      zero,0x24(s1)                                     ; src\renderText02\renderText_02_renderChar.asm line 150
800355C0    addu    v0,v1                                             ; src\renderText02\renderText_02_renderChar.asm line 151
800355C4    sh      v0,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 152
800355C8 @set_rect_x:                                                 ; src\renderText02\renderText_02_renderChar.asm line 154
800355C8    lbu     a0,0x22(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 155
800355CC    lhu     v1,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 156
800355D0    andi    v0,a0,0xF                                         ; src\renderText02\renderText_02_renderChar.asm line 157
800355D4    sll     v0,0x6                                            ; src\renderText02\renderText_02_renderChar.asm line 158
800355D8    addu    v1,v0                                             ; src\renderText02\renderText_02_renderChar.asm line 159
800355DC    srl     a0,0x4                                            ; src\renderText02\renderText_02_renderChar.asm line 160
800355E0    sh      v1,0x10(sp)                                       ; src\renderText02\renderText_02_renderChar.asm line 161
800355E4 @set_rect_y:                                                 ; src\renderText02\renderText_02_renderChar.asm line 163
800355E4    lhu     v0,0x26(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 164
800355E8    sll     a0,0x8                                            ; src\renderText02\renderText_02_renderChar.asm line 165
800355EC    addu    v0,a0                                             ; src\renderText02\renderText_02_renderChar.asm line 166
800355F0    sh      v0,0x12(sp)                                       ; src\renderText02\renderText_02_renderChar.asm line 167
800355F4    jal     0x8005243C                                        ; src\renderText02\renderText_02_renderChar.asm line 170
800355F8    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 175
800355FC    mult    v0,s0                                             ; src\renderText02\renderText_02_renderChar.asm line 176
80035600    mflo    v0                                                ; src\renderText02\renderText_02_renderChar.asm line 177
80035604    bgez    v0,0x80035610                                     ; src\renderText02\renderText_02_renderChar.asm line 178
80035608    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 179
8003560C    addiu   v0,0x3                                            ; src\renderText02\renderText_02_renderChar.asm line 180
80035610 loc_80035610:                                                ; src\renderText02\renderText_02_renderChar.asm line 182
80035610    sra     v0,0x2                                            ; src\renderText02\renderText_02_renderChar.asm line 183
80035614    sh      v0,0x14(sp)                                       ; src\renderText02\renderText_02_renderChar.asm line 184
80035618    lbu     v0,0x21(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 185
8003561C    addiu   a0,sp,0x10                                        ; src\renderText02\renderText_02_renderChar.asm line 186
80035620    jal     0x80053214                                        ; src\renderText02\renderText_02_renderChar.asm line 187
80035624    sh      v0,0x16(sp)                                       ; src\renderText02\renderText_02_renderChar.asm line 188
80035628 @return:                                                     ; src\renderText02\renderText_02_renderChar.asm line 192
80035628    lhu     v0,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 193
8003562C    nop                                                       ; src\renderText02\renderText_02_renderChar.asm line 194
80035630    addu    v0,s2                                             ; src\renderText02\renderText_02_renderChar.asm line 195
80035634    sh      v0,0x24(s1)                                       ; src\renderText02\renderText_02_renderChar.asm line 196
80035638    lw      ra,0x224(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 197
8003563C    lw      s2,0x220(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 198
80035640    lw      s1,0x21C(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 199
80035644    lw      s0,0x218(sp)                                      ; src\renderText02\renderText_02_renderChar.asm line 200
80035648    jr      ra                                                ; src\renderText02\renderText_02_renderChar.asm line 201
8003564C    addiu   sp,0x22C                                          ; src\renderText02\renderText_02_renderChar.asm line 202
80035650 .endarea                                                     ; src\renderText02\renderText_02_renderChar.asm line 202
80035650 .org 0x8003D904                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 185
8003D904 .area 0x0000035C                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 186
8003D904 sub_8003d904:                                                ; src\renderInventory.asm line 12
8003D904    addiu   sp,-0x38                                          ; src\renderInventory.asm line 13
8003D908    sw      s4,0x28(sp)                                       ; src\renderInventory.asm line 14
8003D90C    move    s4,a0                                             ; src\renderInventory.asm line 15
8003D910    sw      ra,0x34(sp)                                       ; src\renderInventory.asm line 16
8003D914    sw      s6,0x30(sp)                                       ; src\renderInventory.asm line 17
8003D918    sw      s5,0x2C(sp)                                       ; src\renderInventory.asm line 18
8003D91C    sw      s3,0x24(sp)                                       ; src\renderInventory.asm line 19
8003D920    sw      s2,0x20(sp)                                       ; src\renderInventory.asm line 20
8003D924    sw      s1,0x1C(sp)                                       ; src\renderInventory.asm line 21
8003D928    jal     0x80056B6C                                        ; src\renderInventory.asm line 22
8003D92C    sw      s0,0x18(sp)                                       ; src\renderInventory.asm line 23
8003D930    move    s6,v0                                             ; src\renderInventory.asm line 24
8003D934    lbu     v1,0x1A(s4)                                       ; src\renderInventory.asm line 25
8003D938    ori     v0,r0,0x1                                         ; src\renderInventory.asm line 26
8003D93C    beq     v1,v0,0x8003D9FC                                  ; src\renderInventory.asm line 27
8003D940    slti    v0,v1,0x2                                         ; src\renderInventory.asm line 28
8003D944    beqz    v0,0x8003D95C                                     ; src\renderInventory.asm line 29
8003D948    ori     v0,r0,0x2                                         ; src\renderInventory.asm line 30
8003D94C    beqz    v1,0x8003D974                                     ; src\renderInventory.asm line 31
8003D950    nop                                                       ; src\renderInventory.asm line 32
8003D954    j       0x8003DC2C                                        ; src\renderInventory.asm line 33
8003D958    nop                                                       ; src\renderInventory.asm line 34
8003D95C loc_8003d95c:                                                ; src\renderInventory.asm line 37
8003D95C    beq     v1,v0,0x8003DBD0                                  ; src\renderInventory.asm line 38
8003D960    ori     v0,r0,0x3                                         ; src\renderInventory.asm line 39
8003D964    beq     v1,v0,0x8003DBD8                                  ; src\renderInventory.asm line 40
8003D968    nop                                                       ; src\renderInventory.asm line 41
8003D96C    j       0x8003DC2C                                        ; src\renderInventory.asm line 42
8003D970    nop                                                       ; src\renderInventory.asm line 43
8003D974 loc_8003d974:                                                ; src\renderInventory.asm line 46
8003D974    jal     0x80023154                                        ; src\renderInventory.asm line 47
8003D978    nop                                                       ; src\renderInventory.asm line 48
8003D97C    jal     0x8003D3B0                                        ; src\renderInventory.asm line 49
8003D980    move    a0,s4                                             ; src\renderInventory.asm line 50
8003D984    bnez    v0,0x8003DC38                                     ; src\renderInventory.asm line 51
8003D988    ori     v0,r0,0x1                                         ; src\renderInventory.asm line 52
8003D98C    lbu     v0,0x1A(s4)                                       ; src\renderInventory.asm line 53
8003D990    lw      v1,0x8(s4)                                        ; src\renderInventory.asm line 54
8003D994    addiu   v0,0x1                                            ; src\renderInventory.asm line 55
8003D998    sb      v0,0x1A(s4)                                       ; src\renderInventory.asm line 56
8003D99C    sb      zero,0xB01(v1)                                    ; src\renderInventory.asm line 57
8003D9A0    lbu     v0,0x1B(s4)                                       ; src\renderInventory.asm line 58
8003D9A4    lw      v1,0x8(s4)                                        ; src\renderInventory.asm line 59
8003D9A8    sw      zero,0x1C(s4)                                     ; src\renderInventory.asm line 60
8003D9AC    andi    v0,0xFE                                           ; src\renderInventory.asm line 61
8003D9B0    ori     v0,0x2                                            ; src\renderInventory.asm line 62
8003D9B4    sb      v0,0x1B(s4)                                       ; src\renderInventory.asm line 63
8003D9B8    lbu     v0,0xB00(v1)                                      ; src\renderInventory.asm line 64
8003D9BC    lbu     a1,0xAFE(v1)                                      ; src\renderInventory.asm line 65
8003D9C0    move    a0,s4                                             ; src\renderInventory.asm line 66
8003D9C4    sh      v0,0xAFA(v1)                                      ; src\renderInventory.asm line 67
8003D9C8    jal     0x8003E32C                                        ; src\renderInventory.asm line 68
8003D9CC    sb      a1,0xAFD(v1)                                      ; src\renderInventory.asm line 69
8003D9D0    lui     a0,-0x7FF3                                        ; src\renderInventory.asm line 70
8003D9D4    jal     0x80025E58                                        ; src\renderInventory.asm line 71
8003D9D8    subiu   a0,0x3A60                                         ; src\renderInventory.asm line 72
8003D9DC    jal     0x8003E81C                                        ; src\renderInventory.asm line 73
8003D9E0    move    a0,s4                                             ; src\renderInventory.asm line 74
8003D9E4    jal     0x8003D6E0                                        ; src\renderInventory.asm line 75
8003D9E8    move    a0,s4                                             ; src\renderInventory.asm line 76
8003D9EC    jal     0x80048564                                        ; src\renderInventory.asm line 77
8003D9F0    nop                                                       ; src\renderInventory.asm line 78
8003D9F4    j       0x8003DC2C                                        ; src\renderInventory.asm line 79
8003D9F8    nop                                                       ; src\renderInventory.asm line 80
8003D9FC loc_8003d9fc:                                                ; src\renderInventory.asm line 83
8003D9FC    lbu     v1,0x1B(s4)                                       ; src\renderInventory.asm line 84
8003DA00    lw      s5,0x8(s4)                                        ; src\renderInventory.asm line 85
8003DA04    andi    v0,v1,0x2                                         ; src\renderInventory.asm line 86
8003DA08    beqz    v0,0x8003DABC                                     ; src\renderInventory.asm line 87
8003DA0C    andi    v0,v1,0x4                                         ; src\renderInventory.asm line 88
8003DA10    beqz    v0,0x8003DA28                                     ; src\renderInventory.asm line 89
8003DA14    move    s2,s5                                             ; src\renderInventory.asm line 90
8003DA18    move    s0,zero                                           ; src\renderInventory.asm line 91
8003DA1C    xori    v0,v1,0x4                                         ; src\renderInventory.asm line 92
8003DA20    j       0x8003DA74                                        ; src\renderInventory.asm line 93
8003DA24    sb      v0,0x1B(s4)                                       ; src\renderInventory.asm line 94
8003DA28 loc_8003da28:                                                ; src\renderInventory.asm line 97
8003DA28    andi    v0,v1,0x1                                         ; src\renderInventory.asm line 98
8003DA2C    beqz    v0,0x8003DA58                                     ; src\renderInventory.asm line 99
8003DA30    addiu   s1,s4,0xC                                         ; src\renderInventory.asm line 100
8003DA34    lh      v1,0xAFA(s5)                                      ; src\renderInventory.asm line 101
8003DA38    nop                                                       ; src\renderInventory.asm line 102
8003DA3C    sll     v0,v1,0x1                                         ; src\renderInventory.asm line 103
8003DA40    addu    v0,v1                                             ; src\renderInventory.asm line 104
8003DA44    sll     v0,0x1                                            ; src\renderInventory.asm line 105
8003DA48    addu    v0,s5,v0                                          ; src\renderInventory.asm line 106
8003DA4C    lh      s0,0x1AA(v0)                                      ; src\renderInventory.asm line 107
8003DA50    j       0x8003DA7C                                        ; src\renderInventory.asm line 108
8003DA54    move    a0,s1                                             ; src\renderInventory.asm line 109
8003DA58 loc_8003da58:                                                ; src\renderInventory.asm line 112
8003DA58    lh      v1,0xAFA(s5)                                      ; src\renderInventory.asm line 113
8003DA5C    nop                                                       ; src\renderInventory.asm line 114
8003DA60    sll     v0,v1,0x1                                         ; src\renderInventory.asm line 115
8003DA64    addu    v0,v1                                             ; src\renderInventory.asm line 116
8003DA68    sll     v0,0x1                                            ; src\renderInventory.asm line 117
8003DA6C    addu    v0,s5,v0                                          ; src\renderInventory.asm line 118
8003DA70    lh      s0,0x17A(v0)                                      ; src\renderInventory.asm line 119
8003DA74 loc_8003da74:                                                ; src\renderInventory.asm line 121
8003DA74    addiu   s1,s4,0xC                                         ; src\renderInventory.asm line 122
8003DA78    move    a0,s1                                             ; src\renderInventory.asm line 123
8003DA7C setuptextcontext_8003da7c:                                   ; src\renderInventory.asm line 125
8003DA7C    andi    s0,-0x1                                           ; src\renderInventory.asm line 126
8003DA80    jal     0x80035864                                        ; src\renderInventory.asm line 127
8003DA84    move    a1,s0                                             ; src\renderInventory.asm line 128
8003DA88    sw      zero,0x10(sp)                                     ; src\renderInventory.asm line 129
8003DA8C    addiu   a0,s2,0x38                                        ; src\renderInventory.asm line 130
8003DA90    move    a1,s1                                             ; src\renderInventory.asm line 131
8003DA94    move    a2,s0                                             ; src\renderInventory.asm line 132
8003DA98 @settextcontext:                                             ; src\renderInventory.asm line 134
8003DA98    jal     0x80052558                                        ; src\renderInventory.asm line 136
8003DA9C    nop                                                       ; src\renderInventory.asm line 137
8003DAA0    nop                                                       ; src\renderInventory.asm line 138
8003DAA4    nop                                                       ; src\renderInventory.asm line 139
8003DAA8    nop                                                       ; src\renderInventory.asm line 140
8003DAAC    nop                                                       ; src\renderInventory.asm line 141
8003DAB0    sll     a3,0x10                                           ; src\renderInventory.asm line 151
8003DAB4    jal     0x80035CC0                                        ; src\renderInventory.asm line 152
8003DAB8    sra     a3,0x10                                           ; src\renderInventory.asm line 153
8003DABC loc_8003dabc:                                                ; src\renderInventory.asm line 155
8003DABC    jal     0x80057E4C                                        ; src\renderInventory.asm line 156
8003DAC0    addiu   a0,s5,0x238                                       ; src\renderInventory.asm line 157
8003DAC4    jal     0x8005743C                                        ; src\renderInventory.asm line 158
8003DAC8    ori     a0,r0,0x190                                       ; src\renderInventory.asm line 159
8003DACC    jal     0x8003DC60                                        ; src\renderInventory.asm line 160
8003DAD0    move    a0,s4                                             ; src\renderInventory.asm line 161
8003DAD4    jal     0x8003E4A0                                        ; src\renderInventory.asm line 162
8003DAD8    move    a0,s4                                             ; src\renderInventory.asm line 163
8003DADC    lw      s2,0x8(s4)                                        ; src\renderInventory.asm line 164
8003DAE0    jal     0x80056B6C                                        ; src\renderInventory.asm line 165
8003DAE4    nop                                                       ; src\renderInventory.asm line 166
8003DAE8    jal     0x8001A770                                        ; src\renderInventory.asm line 167
8003DAEC    move    s0,v0                                             ; src\renderInventory.asm line 168
8003DAF0    ori     a0,r0,0xD                                         ; src\renderInventory.asm line 169
8003DAF4    sll     v1,s0,0x2                                         ; src\renderInventory.asm line 170
8003DAF8    addu    v1,s0                                             ; src\renderInventory.asm line 171
8003DAFC    sll     v1,0x2                                            ; src\renderInventory.asm line 172
8003DB00    jal     0x8001A77C                                        ; src\renderInventory.asm line 173
8003DB04    addu    s3,v0,v1                                          ; src\renderInventory.asm line 174
8003DB08    move    a0,v0                                             ; src\renderInventory.asm line 175
8003DB0C    jal     0x8005640C                                        ; src\renderInventory.asm line 176
8003DB10    addiu   a1,s2,0x14C                                       ; src\renderInventory.asm line 177
8003DB14    addiu   a1,s2,0xEC                                        ; src\renderInventory.asm line 178
8003DB18    sll     s1,s0,0x1                                         ; src\renderInventory.asm line 179
8003DB1C    addu    s1,s0                                             ; src\renderInventory.asm line 180
8003DB20    sll     s1,0x3                                            ; src\renderInventory.asm line 181
8003DB24    lw      a0,0x4(s3)                                        ; src\renderInventory.asm line 182
8003DB28    addu    a1,s1                                             ; src\renderInventory.asm line 183
8003DB2C    jal     0x8005640C                                        ; src\renderInventory.asm line 184
8003DB30    addiu   a0,0x3C                                           ; src\renderInventory.asm line 185
8003DB34    sll     s0,0x3                                            ; src\renderInventory.asm line 186
8003DB38    addiu   s0,0x2C0                                          ; src\renderInventory.asm line 187
8003DB3C    lw      a0,0x4(s3)                                        ; src\renderInventory.asm line 188
8003DB40    addu    a1,s2,s0                                          ; src\renderInventory.asm line 189
8003DB44    jal     0x8005640C                                        ; src\renderInventory.asm line 190
8003DB48    addiu   a0,0x3C                                           ; src\renderInventory.asm line 191
8003DB4C    addiu   s2,0x11C                                          ; src\renderInventory.asm line 192
8003DB50    lw      a0,0x4(s3)                                        ; src\renderInventory.asm line 193
8003DB54    addu    a1,s2,s1                                          ; src\renderInventory.asm line 194
8003DB58    jal     0x8005640C                                        ; src\renderInventory.asm line 195
8003DB5C    addiu   a0,0x34                                           ; src\renderInventory.asm line 196
8003DB60    lbu     v1,0x1B(s4)                                       ; src\renderInventory.asm line 197
8003DB64    nop                                                       ; src\renderInventory.asm line 198
8003DB68    andi    v0,v1,0x2                                         ; src\renderInventory.asm line 199
8003DB6C    bnez    v0,0x8003DB84                                     ; src\renderInventory.asm line 200
8003DB70    xori    v0,v1,0x2                                         ; src\renderInventory.asm line 201
8003DB74    jal     0x8003DED8                                        ; src\renderInventory.asm line 202
8003DB78    move    a0,s4                                             ; src\renderInventory.asm line 203
8003DB7C    j       0x8003DB88                                        ; src\renderInventory.asm line 204
8003DB80    nop                                                       ; src\renderInventory.asm line 205
8003DB84 loc_8003db84:                                                ; src\renderInventory.asm line 208
8003DB84    sb      v0,0x1B(s4)                                       ; src\renderInventory.asm line 209
8003DB88 loc_8003db88:                                                ; src\renderInventory.asm line 211
8003DB88    lbu     v0,0x1B(s4)                                       ; src\renderInventory.asm line 212
8003DB8C    nop                                                       ; src\renderInventory.asm line 213
8003DB90    andi    v0,0x20                                           ; src\renderInventory.asm line 214
8003DB94    bnez    v0,0x8003DBB0                                     ; src\renderInventory.asm line 215
8003DB98    nop                                                       ; src\renderInventory.asm line 216
8003DB9C    jal     0x8001A77C                                        ; src\renderInventory.asm line 217
8003DBA0    ori     a0,r0,0xD                                         ; src\renderInventory.asm line 218
8003DBA4    move    a0,s5                                             ; src\renderInventory.asm line 219
8003DBA8    jal     0x8003EB58                                        ; src\renderInventory.asm line 220
8003DBAC    move    a1,v0                                             ; src\renderInventory.asm line 221
8003DBB0 loc_8003dbb0:                                                ; src\renderInventory.asm line 223
8003DBB0    jal     0x8001A77C                                        ; src\renderInventory.asm line 224
8003DBB4    ori     a0,r0,0xC                                         ; src\renderInventory.asm line 225
8003DBB8    addiu   a0,s5,0x38                                        ; src\renderInventory.asm line 226
8003DBBC    move    a1,v0                                             ; src\renderInventory.asm line 227
8003DBC0    jal     0x80035928                                        ; src\renderInventory.asm line 228
8003DBC4    move    a2,s6                                             ; src\renderInventory.asm line 229
8003DBC8    j       0x8003DC2C                                        ; src\renderInventory.asm line 230
8003DBCC    nop                                                       ; src\renderInventory.asm line 231
8003DBD0 loc_8003dbd0:                                                ; src\renderInventory.asm line 234
8003DBD0    j       0x8003DC2C                                        ; src\renderInventory.asm line 235
8003DBD4    sb      v0,0x1A(s4)                                       ; src\renderInventory.asm line 236
8003DBD8 loc_8003dbd8:                                                ; src\renderInventory.asm line 239
8003DBD8    jal     0x80048574                                        ; src\renderInventory.asm line 240
8003DBDC    nop                                                       ; src\renderInventory.asm line 241
8003DBE0    lw      s0,0x8(s4)                                        ; src\renderInventory.asm line 242
8003DBE4    nop                                                       ; src\renderInventory.asm line 243
8003DBE8    lw      a0,0x174(s0)                                      ; src\renderInventory.asm line 244
8003DBEC    jal     0x8004FD8C                                        ; src\renderInventory.asm line 245
8003DBF0    nop                                                       ; src\renderInventory.asm line 246
8003DBF4    jal     0x800358DC                                        ; src\renderInventory.asm line 247
8003DBF8    addiu   a0,s0,0x38                                        ; src\renderInventory.asm line 248
8003DBFC    lw      a0,0x98(gp)                                       ; src\renderInventory.asm line 249
8003DC00    jal     0x8004FD8C                                        ; src\renderInventory.asm line 250
8003DC04    nop                                                       ; src\renderInventory.asm line 251
8003DC08    lw      a0,0x46C(gp)                                      ; src\renderInventory.asm line 252
8003DC0C    jal     0x8004FD8C                                        ; src\renderInventory.asm line 253
8003DC10    nop                                                       ; src\renderInventory.asm line 254
8003DC14    lui     a0,-0x7FF3                                        ; src\renderInventory.asm line 255
8003DC18    subiu   a0,0x3A60                                         ; src\renderInventory.asm line 256
8003DC1C    jal     0x80025E64                                        ; src\renderInventory.asm line 257
8003DC20    sb      zero,0x1A(s4)                                     ; src\renderInventory.asm line 258
8003DC24    j       0x8003DC38                                        ; src\renderInventory.asm line 259
8003DC28    ori     v0,r0,0x1                                         ; src\renderInventory.asm line 260
8003DC2C loc_8003dc2c:                                                ; src\renderInventory.asm line 263
8003DC2C    jal     0x80019F0C                                        ; src\renderInventory.asm line 264
8003DC30    nop                                                       ; src\renderInventory.asm line 265
8003DC34    move    v0,zero                                           ; src\renderInventory.asm line 266
8003DC38 loc_8003dc38:                                                ; src\renderInventory.asm line 268
8003DC38    lw      ra,0x34(sp)                                       ; src\renderInventory.asm line 269
8003DC3C    lw      s6,0x30(sp)                                       ; src\renderInventory.asm line 270
8003DC40    lw      s5,0x2C(sp)                                       ; src\renderInventory.asm line 271
8003DC44    lw      s4,0x28(sp)                                       ; src\renderInventory.asm line 272
8003DC48    lw      s3,0x24(sp)                                       ; src\renderInventory.asm line 273
8003DC4C    lw      s2,0x20(sp)                                       ; src\renderInventory.asm line 274
8003DC50    lw      s1,0x1C(sp)                                       ; src\renderInventory.asm line 275
8003DC54    lw      s0,0x18(sp)                                       ; src\renderInventory.asm line 276
8003DC58    jr      ra                                                ; src\renderInventory.asm line 277
8003DC5C    addiu   sp,0x38                                           ; src\renderInventory.asm line 278
8003DC60 .endarea                                                     ; src\renderInventory.asm line 278
8003DC60 .org 0x8003DC60                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 190
8003DC60 .area 0x00000278                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 191
8003DC60 sub_8003dc60:                                                ; src\updateInventory.asm line 10
8003DC60    addiu   sp,-0x38                                          ; src\updateInventory.asm line 11
8003DC64    sw      s4,0x28(sp)                                       ; src\updateInventory.asm line 12
8003DC68    move    s4,a0                                             ; src\updateInventory.asm line 13
8003DC6C    sw      ra,0x30(sp)                                       ; src\updateInventory.asm line 14
8003DC70    sw      s5,0x2C(sp)                                       ; src\updateInventory.asm line 15
8003DC74    sw      s3,0x24(sp)                                       ; src\updateInventory.asm line 16
8003DC78    sw      s2,0x20(sp)                                       ; src\updateInventory.asm line 17
8003DC7C    sw      s1,0x1C(sp)                                       ; src\updateInventory.asm line 18
8003DC80    sw      s0,0x18(sp)                                       ; src\updateInventory.asm line 19
8003DC84    lw      s2,0x8(s4)                                        ; src\updateInventory.asm line 20
8003DC88    nop                                                       ; src\updateInventory.asm line 21
8003DC8C    lhu     v1,0xAF8(s2)                                      ; src\updateInventory.asm line 22
8003DC90    lhu     v0,0xAFA(s2)                                      ; src\updateInventory.asm line 23
8003DC94    nop                                                       ; src\updateInventory.asm line 24
8003DC98    mult    v1,v0                                             ; src\updateInventory.asm line 25
8003DC9C    lbu     v0,0x1B(s4)                                       ; src\updateInventory.asm line 26
8003DCA0    nop                                                       ; src\updateInventory.asm line 27
8003DCA4    andi    v0,0x18                                           ; src\updateInventory.asm line 28
8003DCA8    mflo    t0                                                ; src\updateInventory.asm line 29
8003DCAC    addiu   a1,t0,0x400                                       ; src\updateInventory.asm line 30
8003DCB0    beqz    v0,0x8003DDF0                                     ; src\updateInventory.asm line 31
8003DCB4    move    s5,a1                                             ; src\updateInventory.asm line 32
8003DCB8    lbu     v0,0xB01(s2)                                      ; src\updateInventory.asm line 33
8003DCBC    nop                                                       ; src\updateInventory.asm line 34
8003DCC0    addiu   v0,-0x1                                           ; src\updateInventory.asm line 35
8003DCC4    sb      v0,0xB01(s2)                                      ; src\updateInventory.asm line 36
8003DCC8    andi    v0,0xFF                                           ; src\updateInventory.asm line 37
8003DCCC    bnez    v0,0x8003DDA4                                     ; src\updateInventory.asm line 38
8003DCD0    nop                                                       ; src\updateInventory.asm line 39
8003DCD4    lbu     v1,0x1B(s4)                                       ; src\updateInventory.asm line 40
8003DCD8    lw      s3,0x8(s4)                                        ; src\updateInventory.asm line 41
8003DCDC    andi    v0,v1,0x4                                         ; src\updateInventory.asm line 42
8003DCE0    beqz    v0,0x8003DCF4                                     ; src\updateInventory.asm line 43
8003DCE4    move    s1,zero                                           ; src\updateInventory.asm line 44
8003DCE8    xori    v0,v1,0x4                                         ; src\updateInventory.asm line 45
8003DCEC    j       0x8003DD40                                        ; src\updateInventory.asm line 46
8003DCF0    sb      v0,0x1B(s4)                                       ; src\updateInventory.asm line 47
8003DCF4 loc_8003dcf4:                                                ; src\updateInventory.asm line 50
8003DCF4    andi    v0,v1,0x1                                         ; src\updateInventory.asm line 51
8003DCF8    beqz    v0,0x8003DD24                                     ; src\updateInventory.asm line 52
8003DCFC    addiu   s0,s4,0xC                                         ; src\updateInventory.asm line 53
8003DD00    lh      v1,0xAFA(s3)                                      ; src\updateInventory.asm line 54
8003DD04    nop                                                       ; src\updateInventory.asm line 55
8003DD08    sll     v0,v1,0x1                                         ; src\updateInventory.asm line 56
8003DD0C    addu    v0,v1                                             ; src\updateInventory.asm line 57
8003DD10    sll     v0,0x1                                            ; src\updateInventory.asm line 58
8003DD14    addu    v0,s3,v0                                          ; src\updateInventory.asm line 59
8003DD18    lh      s1,0x1AA(v0)                                      ; src\updateInventory.asm line 60
8003DD1C    j       0x8003DD48                                        ; src\updateInventory.asm line 61
8003DD20    move    a0,s0                                             ; src\updateInventory.asm line 62
8003DD24 loc_8003dd24:                                                ; src\updateInventory.asm line 65
8003DD24    lh      v1,0xAFA(s3)                                      ; src\updateInventory.asm line 66
8003DD28    nop                                                       ; src\updateInventory.asm line 67
8003DD2C    sll     v0,v1,0x1                                         ; src\updateInventory.asm line 68
8003DD30    addu    v0,v1                                             ; src\updateInventory.asm line 69
8003DD34    sll     v0,0x1                                            ; src\updateInventory.asm line 70
8003DD38    addu    v0,s3,v0                                          ; src\updateInventory.asm line 71
8003DD3C    lh      s1,0x17A(v0)                                      ; src\updateInventory.asm line 72
8003DD40 loc_8003dd40:                                                ; src\updateInventory.asm line 74
8003DD40    addiu   s0,s4,0xC                                         ; src\updateInventory.asm line 75
8003DD44    move    a0,s0                                             ; src\updateInventory.asm line 76
8003DD48 setuptextcontext_8003dd48:                                   ; src\updateInventory.asm line 78
8003DD48    andi    s1,-0x1                                           ; src\updateInventory.asm line 79
8003DD4C    jal     0x80035864                                        ; src\updateInventory.asm line 80
8003DD50    move    a1,s1                                             ; src\updateInventory.asm line 81
8003DD54    addiu   a0,s3,0x38                                        ; src\updateInventory.asm line 82
8003DD58    move    a1,s0                                             ; src\updateInventory.asm line 83
8003DD5C @settextcontext:                                             ; src\updateInventory.asm line 85
8003DD5C    jal     0x80052560                                        ; src\updateInventory.asm line 88
8003DD60    nop                                                       ; src\updateInventory.asm line 89
8003DD64    nop                                                       ; src\updateInventory.asm line 90
8003DD68    nop                                                       ; src\updateInventory.asm line 91
8003DD6C    nop                                                       ; src\updateInventory.asm line 92
8003DD70    nop                                                       ; src\updateInventory.asm line 93
8003DD74    sll     a3,0x10                                           ; src\updateInventory.asm line 103
8003DD78    move    a2,s1                                             ; src\updateInventory.asm line 104
8003DD7C    sra     a3,0x10                                           ; src\updateInventory.asm line 105
8003DD80    jal     0x80035CC0                                        ; src\updateInventory.asm line 106
8003DD84    sw      zero,0x10(sp)                                     ; src\updateInventory.asm line 107
8003DD88    lbu     v0,0x1B(s4)                                       ; src\updateInventory.asm line 108
8003DD8C    nop                                                       ; src\updateInventory.asm line 109
8003DD90    ori     v0,0x2                                            ; src\updateInventory.asm line 110
8003DD94    andi    v0,0xE7                                           ; src\updateInventory.asm line 111
8003DD98    sb      v0,0x1B(s4)                                       ; src\updateInventory.asm line 112
8003DD9C    j       0x8003DEAC                                        ; src\updateInventory.asm line 113
8003DDA0    sh      s5,0x2BA(s2)                                      ; src\updateInventory.asm line 114
8003DDA4 loc_8003dda4:                                                ; src\updateInventory.asm line 117
8003DDA4    lh      a0,0xAF8(s2)                                      ; src\updateInventory.asm line 118
8003DDA8    nop                                                       ; src\updateInventory.asm line 119
8003DDAC    bgez    a0,0x8003DDB8                                     ; src\updateInventory.asm line 120
8003DDB0    nop                                                       ; src\updateInventory.asm line 121
8003DDB4    addiu   a0,0x3                                            ; src\updateInventory.asm line 122
8003DDB8 loc_8003ddb8:                                                ; src\updateInventory.asm line 124
8003DDB8    lbu     v1,0xB01(s2)                                      ; src\updateInventory.asm line 125
8003DDBC    sra     a0,0x2                                            ; src\updateInventory.asm line 126
8003DDC0    mult    a0,v1                                             ; src\updateInventory.asm line 127
8003DDC4    lbu     v0,0x1B(s4)                                       ; src\updateInventory.asm line 128
8003DDC8    nop                                                       ; src\updateInventory.asm line 129
8003DDCC    andi    v0,0x10                                           ; src\updateInventory.asm line 130
8003DDD0    mflo    a0                                                ; src\updateInventory.asm line 131
8003DDD4    beqz    v0,0x8003DDE4                                     ; src\updateInventory.asm line 132
8003DDD8    subu    v0,a1,a0                                          ; src\updateInventory.asm line 133
8003DDDC    j       0x8003DEAC                                        ; src\updateInventory.asm line 134
8003DDE0    sh      v0,0x2BA(s2)                                      ; src\updateInventory.asm line 135
8003DDE4 loc_8003dde4:                                                ; src\updateInventory.asm line 138
8003DDE4    addu    v0,a1,a0                                          ; src\updateInventory.asm line 139
8003DDE8    j       0x8003DEAC                                        ; src\updateInventory.asm line 140
8003DDEC    sh      v0,0x2BA(s2)                                      ; src\updateInventory.asm line 141
8003DDF0 loc_8003ddf0:                                                ; src\updateInventory.asm line 144
8003DDF0    lbu     v1,0xAFD(s2)                                      ; src\updateInventory.asm line 145
8003DDF4    ori     v0,r0,0x1                                         ; src\updateInventory.asm line 146
8003DDF8    beq     v1,v0,0x8003DEAC                                  ; src\updateInventory.asm line 147
8003DDFC    sh      a1,0x2BA(s2)                                      ; src\updateInventory.asm line 148
8003DE00    lui     v0,-0x7FF3                                        ; src\updateInventory.asm line 149
8003DE04    lw      v1,-0x3A5C(v0)                                    ; src\updateInventory.asm line 150
8003DE08    nop                                                       ; src\updateInventory.asm line 151
8003DE0C    andi    v0,v1,0x40                                        ; src\updateInventory.asm line 152
8003DE10    beqz    v0,0x8003DE60                                     ; src\updateInventory.asm line 153
8003DE14    andi    v0,v1,0x20                                        ; src\updateInventory.asm line 154
8003DE18    lhu     v0,0xAFA(s2)                                      ; src\updateInventory.asm line 155
8003DE1C    nop                                                       ; src\updateInventory.asm line 156
8003DE20    addiu   v0,-0x1                                           ; src\updateInventory.asm line 157
8003DE24    sh      v0,0xAFA(s2)                                      ; src\updateInventory.asm line 158
8003DE28    sll     v0,0x10                                           ; src\updateInventory.asm line 159
8003DE2C    bgez    v0,0x8003DE44                                     ; src\updateInventory.asm line 160
8003DE30    nop                                                       ; src\updateInventory.asm line 161
8003DE34    lbu     v0,0xAFD(s2)                                      ; src\updateInventory.asm line 162
8003DE38    nop                                                       ; src\updateInventory.asm line 163
8003DE3C    addiu   v0,-0x1                                           ; src\updateInventory.asm line 164
8003DE40    sh      v0,0xAFA(s2)                                      ; src\updateInventory.asm line 165
8003DE44 loc_8003de44:                                                ; src\updateInventory.asm line 167
8003DE44    lbu     v0,0x1B(s4)                                       ; src\updateInventory.asm line 168
8003DE48    addiu   a0,s2,0x38                                        ; src\updateInventory.asm line 169
8003DE4C    ori     v0,0x8                                            ; src\updateInventory.asm line 170
8003DE50    sb      v0,0x1B(s4)                                       ; src\updateInventory.asm line 171
8003DE54    ori     v0,r0,0x4                                         ; src\updateInventory.asm line 172
8003DE58    j       0x8003DEA4                                        ; src\updateInventory.asm line 173
8003DE5C    sb      v0,0xB01(s2)                                      ; src\updateInventory.asm line 174
8003DE60 loc_8003de60:                                                ; src\updateInventory.asm line 177
8003DE60    beqz    v0,0x8003DEAC                                     ; src\updateInventory.asm line 178
8003DE64    nop                                                       ; src\updateInventory.asm line 179
8003DE68    lhu     v0,0xAFA(s2)                                      ; src\updateInventory.asm line 180
8003DE6C    lbu     v1,0xAFD(s2)                                      ; src\updateInventory.asm line 181
8003DE70    addiu   v0,0x1                                            ; src\updateInventory.asm line 182
8003DE74    sh      v0,0xAFA(s2)                                      ; src\updateInventory.asm line 183
8003DE78    sll     v0,0x10                                           ; src\updateInventory.asm line 184
8003DE7C    sra     v0,0x10                                           ; src\updateInventory.asm line 185
8003DE80    slt     v0,v1                                             ; src\updateInventory.asm line 186
8003DE84    bnez    v0,0x8003DE90                                     ; src\updateInventory.asm line 187
8003DE88    ori     v0,r0,0x4                                         ; src\updateInventory.asm line 188
8003DE8C    sh      zero,0xAFA(s2)                                    ; src\updateInventory.asm line 189
8003DE90 loc_8003de90:                                                ; src\updateInventory.asm line 191
8003DE90    sb      v0,0xB01(s2)                                      ; src\updateInventory.asm line 192
8003DE94    lbu     v0,0x1B(s4)                                       ; src\updateInventory.asm line 193
8003DE98    addiu   a0,s2,0x38                                        ; src\updateInventory.asm line 194
8003DE9C    ori     v0,0x10                                           ; src\updateInventory.asm line 195
8003DEA0    sb      v0,0x1B(s4)                                       ; src\updateInventory.asm line 196
8003DEA4 loc_8003dea4:                                                ; src\updateInventory.asm line 198
8003DEA4    jal     0x80035B30                                        ; src\updateInventory.asm line 199
8003DEA8    nop                                                       ; src\updateInventory.asm line 200
8003DEAC loc_8003deac:                                                ; src\updateInventory.asm line 202
8003DEAC    jal     0x8003E81C                                        ; src\updateInventory.asm line 203
8003DEB0    move    a0,s4                                             ; src\updateInventory.asm line 204
8003DEB4    lw      ra,0x30(sp)                                       ; src\updateInventory.asm line 205
8003DEB8    lw      s5,0x2C(sp)                                       ; src\updateInventory.asm line 206
8003DEBC    lw      s4,0x28(sp)                                       ; src\updateInventory.asm line 207
8003DEC0    lw      s3,0x24(sp)                                       ; src\updateInventory.asm line 208
8003DEC4    lw      s2,0x20(sp)                                       ; src\updateInventory.asm line 209
8003DEC8    lw      s1,0x1C(sp)                                       ; src\updateInventory.asm line 210
8003DECC    lw      s0,0x18(sp)                                       ; src\updateInventory.asm line 211
8003DED0    jr      ra                                                ; src\updateInventory.asm line 212
8003DED4    addiu   sp,0x38                                           ; src\updateInventory.asm line 213
8003DED8 .endarea                                                     ; src\updateInventory.asm line 213
8003DED8 .org 0x8004D0B8                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 195
8004D0B8 .area 0x00000280                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 196
8004C9FC sub_8004c9fc:                                                ; src\renderMap.asm line 10
8004CB38 sub_8004cb38:                                                ; src\renderMap.asm line 11
8003EB58 sub_8003eb58:                                                ; src\renderMap.asm line 12
8004D0B8 rendermap:                                                   ; src\renderMap.asm line 15
8004D0B8    addiu   sp,-0x28                                          ; src\renderMap.asm line 17
8004D0BC    sw      s1,0x14(sp)                                       ; src\renderMap.asm line 18
8004D0C0    move    s1,a0                                             ; src\renderMap.asm line 19
8004D0C4    sw      ra,0x24(sp)                                       ; src\renderMap.asm line 20
8004D0C8    sw      s4,0x20(sp)                                       ; src\renderMap.asm line 21
8004D0CC    sw      s3,0x1C(sp)                                       ; src\renderMap.asm line 22
8004D0D0    sw      s2,0x18(sp)                                       ; src\renderMap.asm line 23
8004D0D4    sw      s0,0x10(sp)                                       ; src\renderMap.asm line 24
8004D0D8    lw      s3,0x4(s1)                                        ; src\renderMap.asm line 25
8004D0DC    nop                                                       ; src\renderMap.asm line 26
8004D0E0    lbu     a1,0x5E0(s3)                                      ; src\renderMap.asm line 27
8004D0E4    nop                                                       ; src\renderMap.asm line 28
8004D0E8    beqz    a1,0x8004D174                                     ; src\renderMap.asm line 29
8004D0EC    addiu   a0,s3,0x2C                                        ; src\renderMap.asm line 30
8004D0F0    addiu   a1,-0x1                                           ; src\renderMap.asm line 31
8004D0F4    andi    a1,-0x1                                           ; src\renderMap.asm line 32
8004D0F8    move    a2,zero                                           ; src\renderMap.asm line 33
8004D0FC    jal     0x80035D38                                        ; src\renderMap.asm line 34
8004D100    ori     a3,r0,0x90                                        ; src\renderMap.asm line 35
8004D104    ori     a0,r0,0xF                                         ; src\renderMap.asm line 36
8004D108 @width:                                                      ; src\renderMap.asm line 39
8004D108    sh      v1,0x28(s3)                                       ; src\renderMap.asm line 40
8004D10C @height:                                                     ; src\renderMap.asm line 41
8004D10C    ori     v0,r0,0x10                                        ; src\renderMap.asm line 42
8004D110    sh      v0,0x2A(s3)                                       ; src\renderMap.asm line 43
8004D114 @x0:                                                         ; src\renderMap.asm line 44
8004D114    lh      v0,0xC(s3)                                        ; src\renderMap.asm line 45
8004D118    nop                                                       ; src\renderMap.asm line 46
8004D11C    subu    v0,v1                                             ; src\renderMap.asm line 47
8004D120    srl     v0,0x1                                            ; src\renderMap.asm line 48
8004D124    subiu   v0,0x8                                            ; src\renderMap.asm line 49
8004D128    sh      v0,0x20(s3)                                       ; src\renderMap.asm line 50
8004D12C @y0:                                                         ; src\renderMap.asm line 51
8004D12C    ori     v0,r0,0x42                                        ; src\renderMap.asm line 52
8004D130    nop                                                       ; src\renderMap.asm line 53
8004D134    nop                                                       ; src\renderMap.asm line 54
8004D138 @getlocationnamesprite_y0:                                   ; src\renderMap.asm line 75
8004D138    jal     0x8001A77C                                        ; src\renderMap.asm line 76
8004D13C    sh      v0,0x22(s3)                                       ; src\renderMap.asm line 77
8004D140    move    a0,v0                                             ; src\renderMap.asm line 79
8004D144    jal     0x8005640C                                        ; src\renderMap.asm line 80
8004D148    addiu   a1,s3,0x18                                        ; src\renderMap.asm line 81
8004D14C    jal     0x8001A77C                                        ; src\renderMap.asm line 82
8004D150    ori     a0,r0,0xF                                         ; src\renderMap.asm line 83
8004D154    move    a0,v0                                             ; src\renderMap.asm line 84
8004D158    jal     0x8005640C                                        ; src\renderMap.asm line 85
8004D15C    addiu   a1,s3,0x10                                        ; src\renderMap.asm line 86
8004D160    jal     0x8001A77C                                        ; src\renderMap.asm line 87
8004D164    ori     a0,r0,0xF                                         ; src\renderMap.asm line 88
8004D168    move    a0,v0                                             ; src\renderMap.asm line 89
8004D16C    jal     0x8005640C                                        ; src\renderMap.asm line 90
8004D170    move    a1,s3                                             ; src\renderMap.asm line 91
8004D174 loc_8004d174:                                                ; src\renderMap.asm line 93
8004D174    addiu   s0,s3,0xB8                                        ; src\renderMap.asm line 94
8004D178    jal     0x8004C9FC                                        ; src\renderMap.asm line 95
8004D17C    move    a0,s0                                             ; src\renderMap.asm line 96
8004D180    move    a1,zero                                           ; src\renderMap.asm line 97
8004D184    lhu     v0,0x8(s0)                                        ; src\renderMap.asm line 98
8004D188    lbu     a0,0x513(s0)                                      ; src\renderMap.asm line 99
8004D18C    lhu     v1,0xA(s0)                                        ; src\renderMap.asm line 100
8004D190    beqz    a0,0x8004D20C                                     ; src\renderMap.asm line 101
8004D194    addiu   t0,s3,0xE4                                        ; src\renderMap.asm line 102
8004D198    sll     v0,0x10                                           ; src\renderMap.asm line 103
8004D19C    sra     a3,v0,0x10                                        ; src\renderMap.asm line 104
8004D1A0    sll     v0,v1,0x10                                        ; src\renderMap.asm line 105
8004D1A4    sra     a2,v0,0x10                                        ; src\renderMap.asm line 106
8004D1A8    move    t1,a0                                             ; src\renderMap.asm line 107
8004D1AC    move    a0,t0                                             ; src\renderMap.asm line 108
8004D1B0 loc_8004d1b0:                                                ; src\renderMap.asm line 110
8004D1B0    lh      v1,0x1C(a0)                                       ; src\renderMap.asm line 111
8004D1B4    nop                                                       ; src\renderMap.asm line 112
8004D1B8    slt     v0,a3,v1                                          ; src\renderMap.asm line 113
8004D1BC    bnez    v0,0x8004D1FC                                     ; src\renderMap.asm line 114
8004D1C0    addiu   v0,v1,0x10                                        ; src\renderMap.asm line 115
8004D1C4    slt     v0,a3,v0                                          ; src\renderMap.asm line 116
8004D1C8    beqz    v0,0x8004D1FC                                     ; src\renderMap.asm line 117
8004D1CC    nop                                                       ; src\renderMap.asm line 118
8004D1D0    lh      v1,0x1E(a0)                                       ; src\renderMap.asm line 119
8004D1D4    nop                                                       ; src\renderMap.asm line 120
8004D1D8    slt     v0,a2,v1                                          ; src\renderMap.asm line 121
8004D1DC    bnez    v0,0x8004D1FC                                     ; src\renderMap.asm line 122
8004D1E0    addiu   v0,v1,0x10                                        ; src\renderMap.asm line 123
8004D1E4    slt     v0,a2,v0                                          ; src\renderMap.asm line 124
8004D1E8    beqz    v0,0x8004D1FC                                     ; src\renderMap.asm line 125
8004D1EC    addu    v0,s0,a1                                          ; src\renderMap.asm line 126
8004D1F0    lbu     v0,0x4FC(v0)                                      ; src\renderMap.asm line 127
8004D1F4    j       0x8004D210                                        ; src\renderMap.asm line 128
8004D1F8    addiu   v0,0x1                                            ; src\renderMap.asm line 129
8004D1FC loc_8004d1fc:                                                ; src\renderMap.asm line 132
8004D1FC    addiu   a1,0x1                                            ; src\renderMap.asm line 134
8004D200    slt     v0,a1,t1                                          ; src\renderMap.asm line 135
8004D204    bnez    v0,0x8004D1B0                                     ; src\renderMap.asm line 136
8004D208    addiu   a0,0x38                                           ; src\renderMap.asm line 137
8004D20C loc_8004d20c:                                                ; src\renderMap.asm line 139
8004D20C    move    v0,zero                                           ; src\renderMap.asm line 140
8004D210 loc_8004d210:                                                ; src\renderMap.asm line 142
8004D210    move    a0,s1                                             ; src\renderMap.asm line 143
8004D214    jal     0x8004CB38                                        ; src\renderMap.asm line 144
8004D218    sb      v0,0x5E0(s3)                                      ; src\renderMap.asm line 145
8004D21C    move    s0,zero                                           ; src\renderMap.asm line 146
8004D220    addiu   s2,s3,0xB8                                        ; src\renderMap.asm line 147
8004D224    lbu     v0,0x513(s2)                                      ; src\renderMap.asm line 148
8004D228    nop                                                       ; src\renderMap.asm line 149
8004D22C    beqz    v0,0x8004D274                                     ; src\renderMap.asm line 150
8004D230    addiu   s4,s3,0xE4                                        ; src\renderMap.asm line 151
8004D234    move    s1,s4                                             ; src\renderMap.asm line 152
8004D238 loc_8004d238:                                                ; src\renderMap.asm line 154
8004D238    jal     0x8001A77C                                        ; src\renderMap.asm line 155
8004D23C    ori     a0,r0,0xF                                         ; src\renderMap.asm line 156
8004D240    move    a0,v0                                             ; src\renderMap.asm line 157
8004D244    jal     0x8005640C                                        ; src\renderMap.asm line 158
8004D248    addiu   a1,s1,0x14                                        ; src\renderMap.asm line 159
8004D24C    jal     0x8001A77C                                        ; src\renderMap.asm line 160
8004D250    ori     a0,r0,0xF                                         ; src\renderMap.asm line 161
8004D254    move    a0,v0                                             ; src\renderMap.asm line 162
8004D258    jal     0x8005640C                                        ; src\renderMap.asm line 163
8004D25C    addiu   a1,s1,0x28                                        ; src\renderMap.asm line 164
8004D260    lbu     v0,0x513(s2)                                      ; src\renderMap.asm line 165
8004D264    addiu   s0,0x1                                            ; src\renderMap.asm line 166
8004D268    slt     v0,s0,v0                                          ; src\renderMap.asm line 167
8004D26C    bnez    v0,0x8004D238                                     ; src\renderMap.asm line 168
8004D270    addiu   s1,0x38                                           ; src\renderMap.asm line 169
8004D274 loc_8004d274:                                                ; src\renderMap.asm line 171
8004D274    jal     0x8001A77C                                        ; src\renderMap.asm line 172
8004D278    ori     a0,r0,0xF                                         ; src\renderMap.asm line 173
8004D27C    move    a0,v0                                             ; src\renderMap.asm line 174
8004D280    jal     0x8005640C                                        ; src\renderMap.asm line 175
8004D284    addiu   a1,s2,0x14                                        ; src\renderMap.asm line 176
8004D288    lbu     v0,0x513(s2)                                      ; src\renderMap.asm line 177
8004D28C    nop                                                       ; src\renderMap.asm line 178
8004D290    beqz    v0,0x8004D2C4                                     ; src\renderMap.asm line 179
8004D294    move    s0,zero                                           ; src\renderMap.asm line 180
8004D298    move    s1,s4                                             ; src\renderMap.asm line 181
8004D29C loc_8004d29c:                                                ; src\renderMap.asm line 183
8004D29C    jal     0x8001A77C                                        ; src\renderMap.asm line 184
8004D2A0    ori     a0,r0,0xF                                         ; src\renderMap.asm line 185
8004D2A4    move    a0,v0                                             ; src\renderMap.asm line 186
8004D2A8    jal     0x8005640C                                        ; src\renderMap.asm line 187
8004D2AC    move    a1,s1                                             ; src\renderMap.asm line 188
8004D2B0    lbu     v0,0x513(s2)                                      ; src\renderMap.asm line 189
8004D2B4    addiu   s0,0x1                                            ; src\renderMap.asm line 190
8004D2B8    slt     v0,s0,v0                                          ; src\renderMap.asm line 191
8004D2BC    bnez    v0,0x8004D29C                                     ; src\renderMap.asm line 192
8004D2C0    addiu   s1,0x38                                           ; src\renderMap.asm line 193
8004D2C4 loc_8004d2c4:                                                ; src\renderMap.asm line 195
8004D2C4    jal     0x8001A77C                                        ; src\renderMap.asm line 196
8004D2C8    ori     a0,r0,0xF                                         ; src\renderMap.asm line 197
8004D2CC    move    a0,v0                                             ; src\renderMap.asm line 198
8004D2D0    jal     0x8005640C                                        ; src\renderMap.asm line 199
8004D2D4    addiu   a1,s2,0x24                                        ; src\renderMap.asm line 200
8004D2D8    jal     0x8001A77C                                        ; src\renderMap.asm line 201
8004D2DC    ori     a0,r0,0xF                                         ; src\renderMap.asm line 202
8004D2E0    addiu   a0,s3,0x80                                        ; src\renderMap.asm line 203
8004D2E4    jal     0x8003EB58                                        ; src\renderMap.asm line 204
8004D2E8    move    a1,v0                                             ; src\renderMap.asm line 205
8004D2EC    jal     0x8001A77C                                        ; src\renderMap.asm line 206
8004D2F0    ori     a0,r0,0xF                                         ; src\renderMap.asm line 207
8004D2F4    move    a0,v0                                             ; src\renderMap.asm line 208
8004D2F8    jal     0x8005640C                                        ; src\renderMap.asm line 209
8004D2FC    addiu   a1,s3,0x58                                        ; src\renderMap.asm line 210
8004D300    lui     v0,-0x7FF3                                        ; src\renderMap.asm line 211
8004D304    lui     v1,0x8                                            ; src\renderMap.asm line 212
8004D308    lw      v0,-0x3A5C(v0)                                    ; src\renderMap.asm line 213
8004D30C    lw      ra,0x24(sp)                                       ; src\renderMap.asm line 214
8004D310    lw      s4,0x20(sp)                                       ; src\renderMap.asm line 215
8004D314    lw      s3,0x1C(sp)                                       ; src\renderMap.asm line 216
8004D318    lw      s2,0x18(sp)                                       ; src\renderMap.asm line 217
8004D31C    lw      s1,0x14(sp)                                       ; src\renderMap.asm line 218
8004D320    lw      s0,0x10(sp)                                       ; src\renderMap.asm line 219
8004D324    and     v0,v1                                             ; src\renderMap.asm line 220
8004D328    sltu    v0,zero,v0                                        ; src\renderMap.asm line 221
8004D32C    jr      ra                                                ; src\renderMap.asm line 222
8004D330    addiu   sp,0x28                                           ; src\renderMap.asm line 223
8004D334 .endarea                                                     ; src\renderMap.asm line 223
8004D334 .org 0x8004D850                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 200
8004D850 .area 0x000000B4                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 201
80035D38 rendertextmap_readmdt:                                       ; src\renderMapTextPoliceStation.asm line 6
8004D850 sub_8004d850:                                                ; src\renderMapTextPoliceStation.asm line 8
8004D850    addiu   sp,-0x18                                          ; src\renderMapTextPoliceStation.asm line 10
8004D854    sw      s0,0x10(sp)                                       ; src\renderMapTextPoliceStation.asm line 11
8004D858    move    s0,a0                                             ; src\renderMapTextPoliceStation.asm line 12
8004D85C    andi    v0,a1,0xFF                                        ; src\renderMapTextPoliceStation.asm line 13
8004D860    beqz    v0,0x8004D8F4                                     ; src\renderMapTextPoliceStation.asm line 14
8004D864    sw      ra,0x14(sp)                                       ; src\renderMapTextPoliceStation.asm line 15
8004D868    addiu   a0,s0,0x2C                                        ; src\renderMapTextPoliceStation.asm line 16
8004D86C    andi    a1,0xFF                                           ; src\renderMapTextPoliceStation.asm line 17
8004D870    addiu   a1,-0x1                                           ; src\renderMapTextPoliceStation.asm line 18
8004D874    andi    a1,-0x1                                           ; src\renderMapTextPoliceStation.asm line 19
8004D878    move    a2,zero                                           ; src\renderMapTextPoliceStation.asm line 20
8004D87C    jal     0x80035D38                                        ; src\renderMapTextPoliceStation.asm line 21
8004D880    ori     a3,r0,0x90                                        ; src\renderMapTextPoliceStation.asm line 22
8004D884    ori     a0,r0,0xF                                         ; src\renderMapTextPoliceStation.asm line 23
8004D888 @width:                                                      ; src\renderMapTextPoliceStation.asm line 26
8004D888    sh      v1,0x28(s0)                                       ; src\renderMapTextPoliceStation.asm line 27
8004D88C @height:                                                     ; src\renderMapTextPoliceStation.asm line 28
8004D88C    ori     v0,r0,0x10                                        ; src\renderMapTextPoliceStation.asm line 29
8004D890    sh      v0,0x2A(s0)                                       ; src\renderMapTextPoliceStation.asm line 30
8004D894 @x0:                                                         ; src\renderMapTextPoliceStation.asm line 31
8004D894    lh      v0,0xC(s0)                                        ; src\renderMapTextPoliceStation.asm line 32
8004D898    nop                                                       ; src\renderMapTextPoliceStation.asm line 33
8004D89C    subu    v0,v1                                             ; src\renderMapTextPoliceStation.asm line 34
8004D8A0    srl     v0,0x1                                            ; src\renderMapTextPoliceStation.asm line 35
8004D8A4    subiu   v0,0x18                                           ; src\renderMapTextPoliceStation.asm line 36
8004D8A8    sh      v0,0x20(s0)                                       ; src\renderMapTextPoliceStation.asm line 37
8004D8AC @y0:                                                         ; src\renderMapTextPoliceStation.asm line 38
8004D8AC    nop                                                       ; src\renderMapTextPoliceStation.asm line 43
8004D8B0    nop                                                       ; src\renderMapTextPoliceStation.asm line 44
8004D8B4    ori     v0,r0,0x42                                        ; src\renderMapTextPoliceStation.asm line 45
8004D8B8    jal     0x8001A77C                                        ; src\renderMapTextPoliceStation.asm line 66
8004D8BC    sh      v0,0x22(s0)                                       ; src\renderMapTextPoliceStation.asm line 67
8004D8C0    move    a0,v0                                             ; src\renderMapTextPoliceStation.asm line 68
8004D8C4    jal     0x8005640C                                        ; src\renderMapTextPoliceStation.asm line 69
8004D8C8    addiu   a1,s0,0x18                                        ; src\renderMapTextPoliceStation.asm line 70
8004D8CC    jal     0x8001A77C                                        ; src\renderMapTextPoliceStation.asm line 71
8004D8D0    ori     a0,r0,0xF                                         ; src\renderMapTextPoliceStation.asm line 72
8004D8D4    move    a0,v0                                             ; src\renderMapTextPoliceStation.asm line 73
8004D8D8    jal     0x8005640C                                        ; src\renderMapTextPoliceStation.asm line 74
8004D8DC    addiu   a1,s0,0x10                                        ; src\renderMapTextPoliceStation.asm line 75
8004D8E0    jal     0x8001A77C                                        ; src\renderMapTextPoliceStation.asm line 76
8004D8E4    ori     a0,r0,0xF                                         ; src\renderMapTextPoliceStation.asm line 77
8004D8E8    move    a0,v0                                             ; src\renderMapTextPoliceStation.asm line 78
8004D8EC    jal     0x8005640C                                        ; src\renderMapTextPoliceStation.asm line 79
8004D8F0    move    a1,s0                                             ; src\renderMapTextPoliceStation.asm line 80
8004D8F4 loc_8004d8f4:                                                ; src\renderMapTextPoliceStation.asm line 82
8004D8F4    lw      ra,0x14(sp)                                       ; src\renderMapTextPoliceStation.asm line 83
8004D8F8    lw      s0,0x10(sp)                                       ; src\renderMapTextPoliceStation.asm line 84
8004D8FC    jr      ra                                                ; src\renderMapTextPoliceStation.asm line 85
8004D900    addiu   sp,0x18                                           ; src\renderMapTextPoliceStation.asm line 86
8004D904 .endarea                                                     ; src\renderMapTextPoliceStation.asm line 86
8004D904 .org 0x8004FC68                                              ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 205
8004FC68 .area 0x00000124                                             ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 206
8004FC68 mm_alloc_ng_code:                                            ; src\memoryManagerAlloc.asm line 7
8004FC68    addiu   sp,-0x18                                          ; src\memoryManagerAlloc.asm line 8
8004FC6C    lui     v0,-0x7FF0                                        ; src\memoryManagerAlloc.asm line 9
8004FC70    addiu   v1,v0,-0x7D60                                     ; src\memoryManagerAlloc.asm line 10
8004FC74    addiu   a0,0x3                                            ; src\memoryManagerAlloc.asm line 11
8004FC78    addiu   v0,r0,-0x4                                        ; src\memoryManagerAlloc.asm line 12
8004FC7C    and     a0,v0                                             ; src\memoryManagerAlloc.asm line 13
8004FC80    sltiu   v0,a0,0x4                                         ; src\memoryManagerAlloc.asm line 14
8004FC84    sw      ra,0x10(sp)                                       ; src\memoryManagerAlloc.asm line 15
8004FC88    lw      a1,0xC(v1)                                        ; src\memoryManagerAlloc.asm line 16
8004FC8C    beqz    v0,0x8004FC98                                     ; src\memoryManagerAlloc.asm line 17
8004FC90    nop                                                       ; src\memoryManagerAlloc.asm line 18
8004FC94    ori     a0,r0,0x4                                         ; src\memoryManagerAlloc.asm line 19
8004FC98 loc_8004fc98:                                                ; src\memoryManagerAlloc.asm line 21
8004FC98    beq     a1,v1,0x8004FD60                                  ; src\memoryManagerAlloc.asm line 22
8004FC9C    addiu   a2,a0,0xC                                         ; src\memoryManagerAlloc.asm line 23
8004FCA0    addiu   a3,a0,0x1C                                        ; src\memoryManagerAlloc.asm line 24
8004FCA4    ori     t1,r0,0xFF                                        ; src\memoryManagerAlloc.asm line 25
8004FCA8    move    t0,v1                                             ; src\memoryManagerAlloc.asm line 26
8004FCAC loc_8004fcac:                                                ; src\memoryManagerAlloc.asm line 28
8004FCAC    lw      v0,0x4(a1)                                        ; src\memoryManagerAlloc.asm line 29
8004FCB0    nop                                                       ; src\memoryManagerAlloc.asm line 30
8004FCB4    subu    v1,v0,a1                                          ; src\memoryManagerAlloc.asm line 31
8004FCB8    sltu    v0,v1,a2                                          ; src\memoryManagerAlloc.asm line 32
8004FCBC    bnez    v0,0x8004FD40                                     ; src\memoryManagerAlloc.asm line 33
8004FCC0    sltu    v0,v1,a3                                          ; src\memoryManagerAlloc.asm line 34
8004FCC4    bnez    v0,0x8004FD18                                     ; src\memoryManagerAlloc.asm line 35
8004FCC8    addu    v1,a1,a0                                          ; src\memoryManagerAlloc.asm line 36
8004FCCC    sw      a1,0xC(v1)                                        ; src\memoryManagerAlloc.asm line 37
8004FCD0    lw      v0,0x4(a1)                                        ; src\memoryManagerAlloc.asm line 38
8004FCD4    addiu   v1,0xC                                            ; src\memoryManagerAlloc.asm line 39
8004FCD8    sw      v0,0x4(v1)                                        ; src\memoryManagerAlloc.asm line 40
8004FCDC    lw      v0,0x8(a1)                                        ; src\memoryManagerAlloc.asm line 41
8004FCE0    nop                                                       ; src\memoryManagerAlloc.asm line 42
8004FCE4    sw      v0,0x8(v1)                                        ; src\memoryManagerAlloc.asm line 43
8004FCE8    lw      v0,0xC(a1)                                        ; src\memoryManagerAlloc.asm line 44
8004FCEC    sb      zero,0x3(v1)                                      ; src\memoryManagerAlloc.asm line 45
8004FCF0    sw      v0,0xC(v1)                                        ; src\memoryManagerAlloc.asm line 46
8004FCF4    lw      v0,0x4(a1)                                        ; src\memoryManagerAlloc.asm line 47
8004FCF8    nop                                                       ; src\memoryManagerAlloc.asm line 48
8004FCFC    sw      v1,0x0(v0)                                        ; src\memoryManagerAlloc.asm line 49
8004FD00    lw      v0,0x8(a1)                                        ; src\memoryManagerAlloc.asm line 50
8004FD04    sw      v1,0x4(a1)                                        ; src\memoryManagerAlloc.asm line 51
8004FD08    sw      v1,0xC(v0)                                        ; src\memoryManagerAlloc.asm line 52
8004FD0C    lw      v0,0xC(a1)                                        ; src\memoryManagerAlloc.asm line 53
8004FD10    j       0x8004FD38                                        ; src\memoryManagerAlloc.asm line 54
8004FD14    sw      v1,0x8(v0)                                        ; src\memoryManagerAlloc.asm line 55
8004FD18 loc_8004fd18:                                                ; src\memoryManagerAlloc.asm line 58
8004FD18    lw      v1,0x8(a1)                                        ; src\memoryManagerAlloc.asm line 59
8004FD1C    lw      v0,0xC(a1)                                        ; src\memoryManagerAlloc.asm line 60
8004FD20    nop                                                       ; src\memoryManagerAlloc.asm line 61
8004FD24    sw      v0,0xC(v1)                                        ; src\memoryManagerAlloc.asm line 62
8004FD28    lw      v1,0xC(a1)                                        ; src\memoryManagerAlloc.asm line 63
8004FD2C    lw      v0,0x8(a1)                                        ; src\memoryManagerAlloc.asm line 64
8004FD30    nop                                                       ; src\memoryManagerAlloc.asm line 65
8004FD34    sw      v0,0x8(v1)                                        ; src\memoryManagerAlloc.asm line 66
8004FD38 loc_8004fd38:                                                ; src\memoryManagerAlloc.asm line 68
8004FD38    j       0x8004FD50                                        ; src\memoryManagerAlloc.asm line 69
8004FD3C    sb      t1,0x3(a1)                                        ; src\memoryManagerAlloc.asm line 70
8004FD40 loc_8004fd40:                                                ; src\memoryManagerAlloc.asm line 73
8004FD40    lw      a1,0xC(a1)                                        ; src\memoryManagerAlloc.asm line 74
8004FD44    nop                                                       ; src\memoryManagerAlloc.asm line 75
8004FD48    bne     a1,t0,0x8004FCAC                                  ; src\memoryManagerAlloc.asm line 76
8004FD4C    nop                                                       ; src\memoryManagerAlloc.asm line 77
8004FD50 loc_8004fd50:                                                ; src\memoryManagerAlloc.asm line 79
8004FD50    lui     v0,-0x7FF0                                        ; src\memoryManagerAlloc.asm line 81
8004FD54    addiu   v0,v0,-0x7D60                                     ; src\memoryManagerAlloc.asm line 82
8004FD58    bne     a1,v0,0x8004FD7C                                  ; src\memoryManagerAlloc.asm line 83
8004FD5C    addiu   v0,a1,0xC                                         ; src\memoryManagerAlloc.asm line 84
8004FD60 loc_8004fd60:                                                ; src\memoryManagerAlloc.asm line 86
8004FD60    jal     0x8004FFFC                                        ; src\memoryManagerAlloc.asm line 87
8004FD64    nop                                                       ; src\memoryManagerAlloc.asm line 88
8004FD68    lui     a0,-0x7FFF                                        ; src\memoryManagerAlloc.asm line 91
8004FD6C    addiu   a0,a0,0x351C                                      ; src\memoryManagerAlloc.asm line 92
8004FD70    jal     0x8005143C                                        ; src\memoryManagerAlloc.asm line 94
8004FD74    move    a1,v0                                             ; src\memoryManagerAlloc.asm line 95
8004FD78    move    v0,zero                                           ; src\memoryManagerAlloc.asm line 96
8004FD7C loc_8004fd7c:                                                ; src\memoryManagerAlloc.asm line 98
8004FD7C    lw      ra,0x10(sp)                                       ; src\memoryManagerAlloc.asm line 104
8004FD80    nop                                                       ; src\memoryManagerAlloc.asm line 105
8004FD84    jr      ra                                                ; src\memoryManagerAlloc.asm line 108
8004FD88    addiu   sp,0x18                                           ; src\memoryManagerAlloc.asm line 109
8004FD8C .endarea                                                     ; src\memoryManagerAlloc.asm line 109
8004FD8C .close                                                       ; G:\HackingProjects\MizzurnaFallsEditor_PSX\Assets\TextCompression/main.asm line 212

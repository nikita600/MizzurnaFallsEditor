;TEXT:80034E00
;TEXT:8003502C  ; End of function renderTextCharacter01

; ---------------------------------------------------------------------------

@stack_size		equ 0x248
	
@var_238        equ @stack_size+-0x238($sp)
@var_230        equ @stack_size+-0x230
@var_30         equ @stack_size+-0x30
	
@var_2E         equ @stack_size+-0x2E($sp)
@var_2C         equ @stack_size+-0x2C($sp)
@var_2A         equ @stack_size+-0x2A($sp)
	
@reg_s0         equ @stack_size+-0x28($sp)
@reg_s1         equ @stack_size+-0x24($sp)
@reg_s2         equ @stack_size+-0x20($sp)
@reg_s3         equ @stack_size+-0x1C($sp)
@reg_s4         equ @stack_size+-0x18($sp)
@reg_s5         equ @stack_size+-0x14($sp)
@reg_s6         equ @stack_size+-0x10($sp)
@reg_s7         equ @stack_size+-0x0C($sp)
@reg_ra         equ @stack_size+-0x08($sp)

@textContext					equ ($s0)
@textContext.mfoCharDatPtr		equ 0x04@textContext
@textContext.mfoPixelDatPtr		equ 0x0C@textContext
@textContext.xOffsetDefault		equ 0x48@textContext
@textContext.yOffsetDefault		equ 0x4A@textContext
@textContext.field_4C			equ 0x4C@textContext
@textContext.field_4E			equ 0x4E@textContext
@textContext.field_58			equ 0x58@textContext
@textContext.field_70			equ 0x70@textContext
@textContext.pixelCharWidth		equ 0x84@textContext
@textContext.field_88			equ 0x88@textContext
@textContext.charWidthDefault	equ 0x90@textContext
@textContext.charHeightDefault	equ 0x91@textContext
@textContext.field_98			equ 0x98@textContext

@mfoCharEntry					equ ($s3)
@mfoCharEntry.charPixelsOffset	equ 0x00@mfoCharEntry
@mfoCharEntry.bppMode			equ 0x07@mfoCharEntry

; ---------------------------------------------------------------------------

renderTextCharacter01:
                addiu   $sp, -@stack_size
                sw      $s0, @reg_s0
                move    $s0, $a0
                sw      $s1, @reg_s1
                move    $s1, $a1
                sw      $s6, @reg_s6
                move    $s6, $a2
                sw      $ra, @reg_ra
                sw      $s7, @reg_s7
                sw      $s5, @reg_s5
                sw      $s4, @reg_s4
                sw      $s3, @reg_s3
                sw      $s2, @reg_s2
				
                lhu     $v1, @textContext.field_4E
                andi    $a1, 0x8000
                sll     $v0, $v1, 1
                addu    $v0, $v1
                lw      $v1, @textContext.field_98
                sll     $v0, 5
                beqz    $a1, @renderMfoCharacter
                addu    $s7, $v1, $v0

; ---------------------------------------------------------------------------			

@renderBiosCharacter:
                li      $s5, 4
                li      $a1, 4
                jal     renderText_clampPosition
                li      $a2, 1
                jal     Krom2RawAdd2
                andi    $a0, $s1, 0xFFFF
				
                addiu   $a0, $sp, @var_230
                move    $a1, $v0
                jal     renderText_copyImageToBuffer
                move    $a2, $zero
				
                addiu   $a0, $sp, @var_30
                lbu     $v0, @textContext.field_58
                lhu     $a1, @textContext.pixelCharWidth
                lhu     $v1, @textContext.xOffsetDefault
                addu    $a1, $v0
                andi    $a1, 0xFFFF
                andi    $v0, $a1, 0xF
                sll     $v0, 6
                addu    $v1, $v0
                li      $v0, 4
                srlv    $a1, $v0
                sh      $v1, @var_30($sp)
                lhu     $v1, @textContext.yOffsetDefault
                sll     $a1, 8
                sh      $v0, @var_2C
                addu    $v1, $a1
                sh      $v1, @var_2E
                lbu     $v0, @textContext.charHeightDefault
                addiu   $a1, $sp, @var_230
                jal     LoadImage2
                sh      $v0, @var_2A
                move    $a0, $s0
                move    $a1, $s7
                jal     renderTextSub01_05
                li      $a2, 1
                j       @addCharacterRect
                nop

; ---------------------------------------------------------------------------

@renderMfoCharacter:
                andi    $v0, $s1, 0xFFFF
                lw      $v1, @textContext.mfoCharDatPtr
                sll     $v0, 3
                addu    $s3, $v1, $v0
				
			.ifdef USE_VWF
				jal		renderTextCharacter01_save_mfoEntry
				nop
			.else
				lbu     $v1, @mfoCharEntry.bppMode
                nop
			.endif
				
                andi    $v0, $v1, 1
                bnez    $v0, @loadMfoCharEntryData
                li      $s2, 4
                andi    $v0, $v1, 4
                beqz    $v0, @loadMfoCharEntryData
                li      $s2, 1
                li      $s2, 2

@loadMfoCharEntryData:

			.ifdef USE_VWF
				jal		renderTextCharacter01_patchCharWidth
				nop
			.else
				lbu     $v0, @textContext.charWidthDefault
                andi    $s1, $s2, 0xFF
			.endif
				
                mult    $v0, $s1
                lw      $v1, @textContext.mfoPixelDatPtr
                lw      $v0, @mfoCharEntry.charPixelsOffset
                mflo    $a0
                bgez    $a0, @setupClapmPosition
                addu    $s4, $v1, $v0
                addiu   $a0, 3

@setupClapmPosition:
                srl     $s5, $a0, 2 ; s5 = charWidth
                move    $a0, $s0
                move    $a1, $s5
                jal     renderText_clampPosition
                move    $a2, $s1
                lbu     $v0, @mfoCharEntry.bppMode
                nop
                andi    $v0, 8
                beqz    $v0, loc_80034F78
                move    $a0, $s0
                move    $a1, $s4
                move    $a2, $s1
                j       loc_80034F84
                li      $a3, 0xFFFFFFFF
				
loc_80034F78:
                move    $a1, $s4
                move    $a2, $s1
                move    $a3, $zero

loc_80034F84:
                jal     renderText_loadImage
                nop
                andi    $v0, $s6, 0xFFFF
                sw      $v0, @var_238
                move    $a0, $s0
                move    $a1, $s3
                move    $a2, $s7
                jal     renderTextSub01_04
                move    $a3, $s2

; ---------------------------------------------------------------------------

@addCharacterRect:
                lhu     $v0, @textContext.xOffsetDefault
                lhu     $v1, @textContext.field_4E
                addu    $v0, $s5
                sh      $v0, @textContext.xOffsetDefault
                lhu     $v0, @textContext.field_88
                addiu   $v1, 1
                sh      $v1, @textContext.field_4E
                andi    $v1, 0xFFFF
                sltu    $v1, $v0
                bnez    $v1, loc_80034FD8
                nop
                sh      $zero, @textContext.field_4E

loc_80034FD8:
                lhu     $v0, @textContext.field_4C
                lhu     $v1, @textContext.field_88
                nop
                sltu    $v0, $v1
                bnez    $v0, loc_80034FF4
                nop
                sh      $zero, @textContext.field_4C

loc_80034FF4:
                lhu     $v0, @textContext.field_70
                nop
                ori     $v0, 0x40  ; '@'
                sh      $v0, @textContext.field_70

@return:		
                lw      $ra, @reg_ra
                lw      $s7, @reg_s7
                lw      $s6, @reg_s6
                lw      $s5, @reg_s5
                lw      $s4, @reg_s4
                lw      $s3, @reg_s3
                lw      $s2, @reg_s2
                lw      $s1, @reg_s1
                lw      $s0, @reg_s0
                jr      $ra
                addiu   $sp, @stack_size
				
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

@stack_size	equ 0x22C

@rect_x		equ 0x10
@rect_y		equ 0x12
@rect_width		equ 0x14
@rect_height	equ 0x16
@var_1A			equ 0x20E
@var_18			equ 0x210
@var_16			equ 0x212
@var_14			equ 0x214
@var_12			equ 0x216
@reg_s0			equ 0x218($sp)
@reg_s1			equ 0x21C($sp)
@reg_s2			equ 0x220($sp)
@reg_ra			equ 0x224($sp)
@mfoCharEntry	equ 0x228($sp)

@textContext 					equ ($s1)
@textContext.mfoCharDatPtr		equ 0x04@textContext
@textContext.mfoPixelDatPtr		equ 0x0C@textContext
@textContext.charWidth			equ 0x20@textContext
@textContext.charHeight			equ 0x21@textContext
@textContext.charWidthOffset	equ 0x22@textContext
@textContext.xOffset			equ 0x24@textContext
@textContext.yOffset			equ 0x26@textContext



; ---------------------------------------------------------------------------

;TEXT:80035460
renderTextMap_renderChar:
                addiu   $sp, -@stack_size
                sw      $s1, @reg_s1
                move    $s1, $a0
                move    $a0, $a1
                andi    $a1, 0x8000
                sw      $ra, @reg_ra
                sw      $s2, @reg_s2
                beqz    $a1, @renderTextureCharacter
                sw      $s0, @reg_s0
                li      $s0, 1
                lh      $v1, @textContext.xOffset
                li      $v0, 0x40  ; '@'
                subu    $v0, $v1
                slti    $v0, 4
                beqz    $v0, @renderBiosCharacter
                li      $s2, 4
                lbu     $v1, @textContext.charHeight
                lhu     $v0, @textContext.yOffset
                sh      $zero, @textContext.xOffset
                addu    $v0, $v1
                sh      $v0, @textContext.yOffset

; ---------------------------------------------------------------------------

@renderBiosCharacter:
                li      $a1, 0xFF
                li      $v1, 0xFF
                addiu   $v0, $sp, @var_1A

loc_800354C0:
                sh      $a1, 0($v0)
                addiu   $v1, -1
                bgez    $v1, loc_800354C0
                addiu   $v0, -2
                jal     Krom2RawAdd2
                andi    $a0, 0xFFFF
                addiu   $a0, $sp, @rect_x
                move    $a1, $v0
                andi    $s0, 0xFF
                jal     renderText_copyImageToBuffer
                srl     $a2, $s0, 1
                addiu   $a0, $sp, @var_18
                lbu     $v1, @textContext.charWidthOffset
                lhu     $v0, @textContext.xOffset
                andi    $v1, 0xF
                sll     $v1, 6
                addu    $v0, $v1
                sh      $v0, @var_18($sp)
                lbu     $v0, @textContext.charWidthOffset
                lhu     $v1, @textContext.yOffset
                sll     $s0, 2
                sh      $s0, @var_14($sp)
                srl     $v0, 4
                sll     $v0, 8
                addu    $v1, $v0
                sh      $v1, @var_16($sp)
                lbu     $v0, @textContext.charHeight
                addiu   $a1, $sp, @rect_x
                jal     LoadImage2
                sh      $v0, @var_12($sp)
                j       @return
                nop
				
; ---------------------------------------------------------------------------

@renderTextureCharacter:
                andi    $v0, $a0, 0xFFFF
                lw      $v1, @textContext.mfoCharDatPtr
                sll     $v0, 3
                addu    $a1, $v1, $v0	; characterEntry
				
			.ifdef USE_VWF
				jal		renderTextMap_renderChar_saveCharacterEntry
			.else
				lbu     $v1, 7($a1) ; load bppMode
			.endif
                
                nop
                andi    $v0, $v1, 1
                bnez    $v0, @loc_80035574
                li      $s0, 4
                andi    $v0, $v1, 4
                beqz    $v0, @loc_80035574
                li      $s0, 1
                li      $s0, 2

@loc_80035574:
				
			.ifdef USE_VWF 
				jal		renderTextMap_renderChar_getCharWidth
			.else
				lbu     $v0, @textContext.charWidth
			.endif
                
                andi    $s0, 0xFF
                mult    $v0, $s0
                lw      $v1, @textContext.mfoPixelDatPtr
                lw      $v0, 0($a1) ; load charPixelsOffset
                mflo    $a0
                bgez    $a0, loc_80035598
                addu    $a1, $v1, $v0
                addiu   $a0, 3

loc_80035598:
                srl     $s2, $a0, 2
                lh      $v1, @textContext.xOffset
                li      $v0, 0x40  ; '@'
                subu    $v0, $v1
                slt     $v0, $s2
                beqz    $v0, @set_rect_x ; if (0x40 - @textContext.xOffset < $s2)
                nop
				
@moveToNewLine:
                lbu     $v1, @textContext.charHeight
                lhu     $v0, @textContext.yOffset
                sh      $zero, @textContext.xOffset
                addu    $v0, $v1
                sh      $v0, @textContext.yOffset

@set_rect_x:
				lbu     $a0, @textContext.charWidthOffset
                lhu     $v1, @textContext.xOffset
                andi    $v0, $a0, 0xF
                sll     $v0, 6 ; charWidthOffset * 64
                addu    $v1, $v0
                srl     $a0, 4 ; charWidthOffset / 16
                sh      $v1, @rect_x($sp)
				
@set_rect_y:
                lhu     $v0, @textContext.yOffset
                sll     $a0, 8 ; (charWidthOffset / 16) * 256
                addu    $v0, $a0
                sh      $v0, @rect_y($sp)
				
			.ifdef USE_VWF 
				jal		renderTextMap_renderChar_getCharWidth
			.else
				lbu     $v0, @textContext.charWidth
			.endif
			
                nop
                mult    $v0, $s0
                mflo    $v0
                bgez    $v0, loc_80035610
                nop
                addiu   $v0, 3

loc_80035610:
                sra     $v0, 2
                sh      $v0, @rect_width($sp)
                lbu     $v0, @textContext.charHeight
                addiu   $a0, $sp, @rect_x
                jal     LoadImage
                sh      $v0, @rect_height($sp)

; ---------------------------------------------------------------------------

@return:
                lhu     $v0, @textContext.xOffset
                nop
                addu    $v0, $s2
                sh      $v0, @textContext.xOffset
                lw      $ra, @reg_ra
                lw      $s2, @reg_s2
                lw      $s1, @reg_s1
                lw      $s0, @reg_s0
                jr      $ra
                addiu   $sp, @stack_size
				
 ; ---------------------------------------------------------------------------
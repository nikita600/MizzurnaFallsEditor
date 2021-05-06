;TEXT:80035D38
; $a0 - textContext
; $a1 - stringIndex
; $a2 - xOffset
; $a3 - yOffset

; -----------------------------------------------------------------------------

.definelabel renderText02_renderChar, 0x80035460

; -----------------------------------------------------------------------------

@stack_size 	equ 0x58 ;0x28
@reg_s0			equ 0x10($sp)
@reg_s1			equ 0x14($sp)
@reg_s2			equ 0x18($sp)
@reg_s3 		equ 0x1C($sp)
@reg_ra 		equ 0x20($sp)

@mddContext						equ ($sp)
@mddContext.mdtMode				equ 0x28@mddContext
@mddContext.left_nodes_ptr		equ	0x2C@mddContext
@mddContext.right_nodes_ptr		equ 0x30@mddContext
@mddContext.char_nodes_ptr		equ	0x34@mddContext

@mddContext.node_offset 		equ 0x38@mddContext	
@mddContext.current_byte 		equ 0x3C@mddContext	
@mddContext.bit_count 			equ 0x40@mddContext	

@mddContext.prev_char			equ 0x44@mddContext	
@mddContext.prev_char_mode		equ 0x48@mddContext	
@mddContext.reg_s6				equ 0x4C@mddContext
@mddContext.reg_s7				equ 0x50@mddContext

@stringPosition					equ $s0
@currentCharacter				equ 0x00(@stringPosition)

@renderedCharCount				equ $s1

@stringEntry 					equ ($s2)
@stringEntry.Offset				equ 0x00@stringEntry
@stringEntry.Length				equ 0x02@stringEntry

@textContext					equ ($s3)
@textContext.mdtFilePtr			equ 0x14@textContext
@textContext.mdtTablePtr		equ 0x18@textContext
@textContext.mdtStringsPtr		equ 0x1C@textContext
@textContext.xOffset			equ 0x24@textContext
@textContext.yOffset			equ 0x26@textContext

; -----------------------------------------------------------------------------

renderText02_80035D38:
                addiu   $sp, -@stack_size
                sw      $s3, @reg_s3
                move    $s3, $a0
                sw      $s1, @reg_s1
                move    @renderedCharCount, $zero
                andi    $a1, 0xFFFF
                sw      $ra, @reg_ra
                sw      $s2, @reg_s2
                sw      $s0, @reg_s0

@get_string_entry:
                lw      $v0, @textContext.mdtTablePtr
                sll     $a1, 2	; stringIndex * 4 (4 = sizeof(stringeEntry))
                sh      $a2, @textContext.xOffset
                sh      $a3, @textContext.yOffset
                addu    $s2, $v0, $a1
				
			.ifdef USE_MDD
				j		GetStringOffset_02
			.else
				lhu     $a0, @stringEntry.Offset
			.endif
                
                lw      $v0, @textContext.mdtStringsPtr
                lhu     $v1, @stringEntry.Length
                nop
				
@check_string_entry:
                beqz    $v1, @return_80035E14 ; if (stringSize == 0)
                nop ;addu    @stringPosition, $v0, $a0

@readCharacter_80035D88:
				
			.ifdef USE_MDD
				j		DecompressCharacter_02
			.else
				lbu     $a0, @currentCharacter      ; load firstChar
			.endif
				
                nop
                andi    $v0, $a0, 0x80
                beqz    $v0, @readTableCharacter_80035DAC ; if (currentCharacter < 0x80)
                addiu   @stringPosition, 1

                lbu     $v1, @currentCharacter
                addiu   @stringPosition, 1
                j       @checkCharacterCode_80035DCC
                sll     $v0, $a0, 8
				
@readTableCharacter_80035DAC:
                sll     $v0, $a0, 1
                lw      $v1, @textContext.mdtFilePtr
                addiu   $v0, 8
                addu    $v1, $v0
                lhu     $a1, 0($v1)
                nop
                srl     $v1, $a1, 8
                sll     $v0, $a1, 8

@checkCharacterCode_80035DCC:
                or      $a1, $v0, $v1
				
@handle_character_02:
			.ifdef USE_MDD
				j		NextLineHandler_02
				nop
			.else
				andi    $v1, $a1, 0xF000
                li      $v0, 0xA000
			.endif
                
                bne     $v1, $v0, @tryRenderCharacter_80035DE8
                andi    $v1, $a1, 0xFF00
                addiu   $a1, 0x6000
                andi    $v1, $a1, 0xFF00

@tryRenderCharacter_80035DE8:
                li      $v0, 0xFF00
                beq     $v1, $v0, @checkIsStringEnd_80035E00
                move    $a0, $s3
                andi    $a1, 0xFFFF
                jal     renderText02_renderChar
                move    $a2, $zero

@checkIsStringEnd_80035E00:
                lhu     $v0, @stringEntry.Length
                addiu   @renderedCharCount, 1
                slt     $v0, @renderedCharCount, $v0
                bnez    $v0, @readCharacter_80035D88  
                nop

@return_80035E14:
				
			.ifdef USE_MDD
				j		CleanUp_02
			.else
				lhu     $v0, @stringEntry.Length
			.endif
				
				
                lw      $ra, @reg_ra
                lw      $s3, @reg_s3
                lw      $s2, @reg_s2
                lw      $s1, @reg_s1
                lw      $s0, @reg_s0
                jr      $ra
                addiu   $sp, @stack_size
				
; -----------------------------------------------------------------------------
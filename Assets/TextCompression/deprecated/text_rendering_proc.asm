.psx
.Open "SLPS017.83", 0x8000F800

; ---------------------------------------------------------------------------
;
;var_18          = -0x18
;var_14          = -0x14
;var_10          = -0x10
;var_C           = -0xC
;var_8           = -8
;var_4           = -4
;
; CodeSize = 0x043C;
; ---------------------------------------------------------------------------

.org 0x800349C4

; ---------------------------------------------------------------------------

s0_rendered_chars_count 		equ 0x50($s0)
s0_current_string_position 		equ 0x54($s0)
unknown_5C						equ 0x5C($s0)
unknown_5E						equ 0x5E($s0)
unknown_60 						equ 0x60($s0)
unknown_62						equ 0x62($s0)
unknown_64 						equ 0x64($s0)
unknown_68						equ 0x68($s0)
unknown_6C						equ 0x6C($s0)
unknown_70						equ 0x70($s0)
unknown_78 						equ 0x78($s0)
unknown_8A 						equ 0x8A($s0)
unknown_8C 						equ 0x8C($s0)
unknown_8E						equ 0x8E($s0)
unknown_94						equ 0x94($s0)
unknown_96						equ 0x96($s0)
unknown_A0						equ 0xA0($s0)
unknown_B0						equ 0xB0($s0)

s3_unk_00 		equ 0x00($s3) ; stringIndex
s3_unk_02 		equ 0x02($s3) ;
s3_unk_04 		equ 0x04($s3) ;
s3_unk_06 		equ 0x06($s3) ;
s3_mdt_pointer 	equ 0x08($s3) ; MDT pointers

; MDT pointers
; 0x00 = 0x801BB0F0 - MDT fileOffset
; 0x04 = 0x801BB1F8 - MDT stringPointerTable
; 0x08 = 0x801BB5D0 - MDT stringData

; currentStringEntry
s4_str_offset 	equ 0x00($s4)
s4_str_size		equ 0x02($s4)

; ---------------------------------------------------------------------------
renderTextToBuffer:
                addiu   $sp, -0x28
                sw      $s0, 0x28-0x18($sp) ;0x28+var_18($sp)
                move    $s0, $a0 ; 0x80194750 struct_unknown_01
                sw      $s3, 0x28-0x0C($sp) ;0x28+var_C($sp)
                move    $s3, $a1 ; 0x80194764 struct_unknown_02
                sw      $ra, 0x28-0x04($sp) ;0x28+var_4($sp)
                sw      $s4, 0x28-0x08($sp) ;0x28+var_8($sp)
                sw      $s2, 0x28-0x10($sp) ;0x28+var_10($sp)
                sw      $s1, 0x28-0x14($sp) ;0x28+var_14($sp)
                lhu     $a2, s3_unk_00 ; 0x3C
                lw      $v0, s3_mdt_pointer ; 0x800F67A0 // MDT entry
                sll     $a1, $a2, 2 ; 0xF0
                lw      $v1, 0($v0) ; 0x801BB0F0 // MDT fileOffset
                lw      $a0, 4($v0) ; 0x801BB1F8 // charTableOffset
                lw      $v0, 4($v1) ; 0xF6 // stringsCount
                nop
                sltu    $v0, $a2
                beqz    $v0, loc_80034A18
                addu    $s4, $a0, $a1 ; calculate s4_str_offset
                j       return_renderTextToBuffer
                move    $v0, $zero
; ---------------------------------------------------------------------------
loc_80034A18:
                lhu     $v0, s3_unk_06 
                nop
                andi    $v0, 2
                beqz    $v0, loc_80034A58
                nop
                lhu     $v0, s3_unk_02
                sh      $zero, unknown_60
                sh      $v0, unknown_5C
                lhu     $v0, s3_unk_04
                sh      $zero, unknown_62
                sh      $v0, unknown_5E
                lhu     $v0, s3_unk_06
                nop
                andi    $v0, 0xFFFD ; -3
                j       calculateStringPosition
                sh      $v0, s3_unk_06
; ---------------------------------------------------------------------------
loc_80034A58:
                sh      $zero, unknown_5E
                sh      $zero, unknown_5C
; ---------------------------------------------------------------------------
calculateStringPosition:
                lhu     $v0, s0_rendered_chars_count
                nop
                bnez    $v0, loc_80034A88
                sw      $zero, unknown_6C
                lw      $v0, s3_mdt_pointer
                lhu     $v1, s4_str_offset
                lw      $v0, 8($v0)
                nop
                addu    $v0, $v1
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034A88:
                lh      $v0, unknown_8A
                lw      $v1, unknown_68
                lh      $a0, unknown_8C
                addu    $v1, $v0
                sw      $v1, unknown_68
                slt     $v1, $a0
                bnez    $v1, loc_80034DA8
                nop
; ---------------------------------------------------------------------------
loadCharacter:
                lhu     $v0, s0_rendered_chars_count
                lhu     $v1, s4_str_size
                nop
                sltu    $v0, $v1
                beqz    $v0, finish_renderTextToBuffer ; if (s0_rendered_chars_count < s4_str_size)
                move    $v0, $zero
                lbu     $v0, unknown_64
                lhu     $v1, unknown_60
                lw      $a0, s0_current_string_position
                sb      $zero, unknown_64
                addu    $v1, $v0
                sh      $v1, unknown_60
                lbu     $s2, 0x00($a0) ; firstChar
                nop
                andi    $v0, $s2, 0x80 ; if (firstChar < 0x80)
                beqz    $v0, loadCharFromTable
                sll     $v0, $s2, 8
                lbu     $v1, 0x01($a0) ; @@secondChar
                j       loc_80034B24
                or      $s1, $v0, $v1
; ---------------------------------------------------------------------------
loadCharFromTable:
                lw      $v0, s3_mdt_pointer
                nop
                lw      $v1, 0($v0)
                sll     $v0, $s2, 1 ; charOffset = firstChar * 2
                addiu   $v0, 8 		; charOffset += 8
                addu    $v1, $v0
                lhu     $s1, 0($v1)
                nop
                srl     $v1, $s1, 8
                sll     $v0, $s1, 8
                or      $s1, $v0, $v1
; ---------------------------------------------------------------------------
loc_80034B24:
                andi    $v1, $s1, 0xF000
                li      $v0, 0xA000
                bne     $v1, $v0, loc_80034B3C ; if (v1 != 0xA000) space
                andi    $v1, $s1, 0xFF00
                addiu   $s1, 0x6000
                andi    $v1, $s1, 0xFF00
; ---------------------------------------------------------------------------
loc_80034B3C:
                li      $v0, 0xFF00
                beq     $v1, $v0, loc_80034C50 ; if (v1 == 0xFF00) ctrlChar
                nop
                lw      $v0, unknown_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, loc_80034BA0
                nop
                lhu     $v0, unknown_5C
                lhu     $v1, unknown_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, unknown_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, loc_80034BA0
                nop
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0x20
                bnez    $v0, loc_80034BA0
                nop
                jal     0x80035ABC
                move    $a0, $s0
; ---------------------------------------------------------------------------
loc_80034BA0:
                lhu     $v1, unknown_70
                nop
                andi    $v0, $v1, 0xFFDF
                andi    $v1, 2
                bnez    $v1, loc_80034DC8
                sh      $v0, unknown_70
                lhu     $v0, unknown_8E
                nop
                andi    $v0, 1
                beqz    $v0, loc_80034BF8
                nop
                lhu     $v1, unknown_94
                lhu     $v0, unknown_96
                nop
                mult    $v1, $v0
                lw      $v0, unknown_6C
                nop
                addu    $v0, $v1
                mflo    $a3
                sltu    $v0, $a3, $v0
                bnez    $v0, loc_80034DC8
                nop
; ---------------------------------------------------------------------------
loc_80034BF8:
                move    $a0, $s0
                andi    $a1, $s1, 0xFFFF
                jal     0x80034E00 ; renderCharacter
                move    $a2, $zero
                lh      $a0, unknown_8C
                lw      $v0, unknown_68
                lhu     $v1, s0_rendered_chars_count
                subu    $v0, $a0
                addiu   $v1, 1
                sw      $v0, unknown_68
                andi    $v0, $s2, 0x80
                beqz    $v0, loc_80034C3C
                sh      $v1, s0_rendered_chars_count
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034C3C:
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                j       loc_80034D90
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034C50:
                lw      $v0, unknown_A0
                nop
                beqz    $v0, loc_80034CE8
                move    $a0, $s0
                jalr    $v0
                andi    $a1, $s1, 0xFFFF
                move    $a0, $v0
                andi    $v0, $a0, 2
                beqz    $v0, loc_80034C90
                andi    $v0, $a0, 1
                lh      $v1, unknown_8C
                lw      $v0, unknown_68
                nop
                subu    $v0, $v1
                sw      $v0, unknown_68
                andi    $v0, $a0, 1
; ---------------------------------------------------------------------------
loc_80034C90:
                beqz    $v0, loc_80034CD8
                andi    $v0, $a0, 4
                lhu     $v0, s0_rendered_chars_count
                nop
                addiu   $v0, 1
                sh      $v0, s0_rendered_chars_count
                andi    $v0, $s2, 0x80
                beqz    $v0, loc_80034CC4
                nop
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034CC4:
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                sw      $v0, s0_current_string_position
                andi    $v0, $a0, 4
; ---------------------------------------------------------------------------
loc_80034CD8:
                beqz    $v0, loc_80034D24
                nop
                j       loc_80034DCC
                sw      $zero, unknown_68
;--------------------------------------------------------------------
loc_80034CE8:
                lhu     $v0, s0_rendered_chars_count
                nop
                addiu   $v0, 1
                sh      $v0, s0_rendered_chars_count
                andi    $v0, $s2, 0x80
                beqz    $v0, loc_80034D14
                nop
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034D14:
                lw      $v0, s0_current_string_position
                nop
                addiu   $v0, 1
                sw      $v0, s0_current_string_position
; ---------------------------------------------------------------------------
loc_80034D24:
                lw      $v0, unknown_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, loc_80034D7C
                nop
                lhu     $v0, unknown_5C
                lhu     $v1, unknown_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, unknown_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, loc_80034D7C
                nop
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0x20
                bnez    $v0, loc_80034D7C
                nop
                jal     0x80035ABC
                move    $a0, $s0
; ---------------------------------------------------------------------------
loc_80034D7C:
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0xA
                bnez    $v0, loc_80034DC8
                nop
; ---------------------------------------------------------------------------
loc_80034D90:
                lh      $v1, unknown_8C
                lw      $v0, unknown_68
                nop
                slt     $v0, $v1
                beqz    $v0, loadCharacter  ; load currents0_rendered_chars_count
                nop
; ---------------------------------------------------------------------------
loc_80034DA8:
                lhu     $v0, s0_rendered_chars_count
                lhu     $v1, s4_str_size
                nop
                sltu    $v0, $v1
                beqz    $v0, loc_80034DD4
                li      $v0, 0xFFFFFFFF
                j       return_renderTextToBuffer
                nop
; ---------------------------------------------------------------------------
loc_80034DC8:
                sw      $zero, unknown_68
; ---------------------------------------------------------------------------
loc_80034DCC:
                j       return_renderTextToBuffer
                li      $v0, 0xFFFFFFFF
; ---------------------------------------------------------------------------
loc_80034DD4:
                move    $v0, $zero

; ---------------------------------------------------------------------------
finish_renderTextToBuffer:
                sh      $zero, s0_rendered_chars_count
                sw      $zero, s0_current_string_position
; ---------------------------------------------------------------------------
return_renderTextToBuffer:
                lw      $ra, 0x28-4($sp) ;0x28+var_4($sp)
                lw      $s4, 0x28-8($sp) ;0x28+var_8($sp)
                lw      $s3, 0x28-0xC($sp) ;0x28+var_C($sp)
                lw      $s2, 0x28-0x10($sp) ;0x28+var_10($sp)
                lw      $s1, 0x28-0x14($sp) ;0x28+var_14($sp)
                lw      $s0, 0x28-0x18($sp) ;0x28+var_18($sp)
                jr      $ra
                addiu   $sp, 0x28
; ---------------------------------------------------------------------------

.Close

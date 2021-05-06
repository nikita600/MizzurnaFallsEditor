@var_28          equ -0x28
@var_20          equ -0x20
@var_1C          equ -0x1C
@var_18          equ -0x18
@var_14          equ -0x14
@var_10          equ -0x10
@var_C           equ -0xC
@var_8           equ -8

sub_8003DC60:
                addiu   $sp, -0x38
                sw      $s4, 0x38+@var_10($sp)
                move    $s4, $a0
                sw      $ra, 0x38+@var_8($sp)
                sw      $s5, 0x38+@var_C($sp)
                sw      $s3, 0x38+@var_14($sp)
                sw      $s2, 0x38+@var_18($sp)
                sw      $s1, 0x38+@var_1C($sp)
                sw      $s0, 0x38+@var_20($sp)
                lw      $s2, 8($s4)
                nop
                lhu     $v1, 0xAF8($s2)
                lhu     $v0, 0xAFA($s2)
                nop
                mult    $v1, $v0
                lbu     $v0, 0x1B($s4)
                nop
                andi    $v0, 0x18
                mflo    $t0
                addiu   $a1, $t0, 0x400
                beqz    $v0, loc_8003DDF0
                move    $s5, $a1
                lbu     $v0, 0xB01($s2)
                nop
                addiu   $v0, -1
                sb      $v0, 0xB01($s2)
                andi    $v0, 0xFF
                bnez    $v0, loc_8003DDA4
                nop
                lbu     $v1, 0x1B($s4)
                lw      $s3, 8($s4)
                andi    $v0, $v1, 4
                beqz    $v0, loc_8003DCF4
                move    $s1, $zero
                xori    $v0, $v1, 4
                j       loc_8003DD40
                sb      $v0, 0x1B($s4)
 ; ---------------------------------------------------------------------------

loc_8003DCF4:
                andi    $v0, $v1, 1
                beqz    $v0, loc_8003DD24
                addiu   $s0, $s4, 0xC
                lh      $v1, 0xAFA($s3)
                nop
                sll     $v0, $v1, 1
                addu    $v0, $v1
                sll     $v0, 1
                addu    $v0, $s3, $v0
                lh      $s1, 0x1AA($v0)
                j       setupTextContext_8003DD48
                move    $a0, $s0
 ; ---------------------------------------------------------------------------

loc_8003DD24:
                lh      $v1, 0xAFA($s3)
                nop
                sll     $v0, $v1, 1
                addu    $v0, $v1
                sll     $v0, 1
                addu    $v0, $s3, $v0
                lh      $s1, 0x17A($v0)

loc_8003DD40:
                addiu   $s0, $s4, 0xC
                move    $a0, $s0

setupTextContext_8003DD48:
                andi    $s1, 0xFFFF
                jal     sub_80035864
                move    $a1, $s1
                addiu   $a0, $s3, 0x38
                move    $a1, $s0
				
@setTextContext:

			.ifdef USE_VWF
				jal inventory_setBaseOffset_update
                nop
                nop
                nop
                nop
                nop
			.else
				sll     $v1, $v0, 3
                subu    $v1, $v0
                sll     $v1, 1
                srl     $v1, 1
                li      $a3, 0x98  ; 'Ш'
                subu    $a3, $v1
			.endif
			
                sll     $a3, 16
                move    $a2, $s1
                sra     $a3, 16
                jal     sub_80035CC0
                sw      $zero, 0x38+@var_28($sp)
                lbu     $v0, 0x1B($s4)
                nop
                ori     $v0, 2
                andi    $v0, 0xE7
                sb      $v0, 0x1B($s4)
                j       loc_8003DEAC
                sh      $s5, 0x2BA($s2)
 ; ---------------------------------------------------------------------------

loc_8003DDA4:
                lh      $a0, 0xAF8($s2)
                nop
                bgez    $a0, loc_8003DDB8
                nop
                addiu   $a0, 3

loc_8003DDB8:
                lbu     $v1, 0xB01($s2)
                sra     $a0, 2
                mult    $a0, $v1
                lbu     $v0, 0x1B($s4)
                nop
                andi    $v0, 0x10
                mflo    $a0
                beqz    $v0, loc_8003DDE4
                subu    $v0, $a1, $a0
                j       loc_8003DEAC
                sh      $v0, 0x2BA($s2)
 ; ---------------------------------------------------------------------------

loc_8003DDE4:
                addu    $v0, $a1, $a0
                j       loc_8003DEAC
                sh      $v0, 0x2BA($s2)
 ; ---------------------------------------------------------------------------

loc_8003DDF0:
                lbu     $v1, 0xAFD($s2)
                li      $v0, 1
                beq     $v1, $v0, loc_8003DEAC
                sh      $a1, 0x2BA($s2)
                lui     $v0, 0x800D
                lw      $v1, -0x3a5c(v0);dword_800CC5A4
                nop
                andi    $v0, $v1, 0x40
                beqz    $v0, loc_8003DE60
                andi    $v0, $v1, 0x20
                lhu     $v0, 0xAFA($s2)
                nop
                addiu   $v0, -1
                sh      $v0, 0xAFA($s2)
                sll     $v0, 16
                bgez    $v0, loc_8003DE44
                nop
                lbu     $v0, 0xAFD($s2)
                nop
                addiu   $v0, -1
                sh      $v0, 0xAFA($s2)

loc_8003DE44:
                lbu     $v0, 0x1B($s4)
                addiu   $a0, $s2, 0x38
                ori     $v0, 8
                sb      $v0, 0x1B($s4)
                li      $v0, 4
                j       loc_8003DEA4
                sb      $v0, 0xB01($s2)
 ; ---------------------------------------------------------------------------

loc_8003DE60:
                beqz    $v0, loc_8003DEAC
                nop
                lhu     $v0, 0xAFA($s2)
                lbu     $v1, 0xAFD($s2)
                addiu   $v0, 1
                sh      $v0, 0xAFA($s2)
                sll     $v0, 16
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, loc_8003DE90
                li      $v0, 4
                sh      $zero, 0xAFA($s2)

loc_8003DE90:
                sb      $v0, 0xB01($s2)
                lbu     $v0, 0x1B($s4)
                addiu   $a0, $s2, 0x38
                ori     $v0, 0x10
                sb      $v0, 0x1B($s4)

loc_8003DEA4:
                jal     renderTextUnknown01
                nop

loc_8003DEAC:
                jal     sub_8003E81C
                move    $a0, $s4
                lw      $ra, 0x38+@var_8($sp)
                lw      $s5, 0x38+@var_C($sp)
                lw      $s4, 0x38+@var_10($sp)
                lw      $s3, 0x38+@var_14($sp)
                lw      $s2, 0x38+@var_18($sp)
                lw      $s1, 0x38+@var_1C($sp)
                lw      $s0, 0x38+@var_20($sp)
                jr      $ra
                addiu   $sp, 0x38
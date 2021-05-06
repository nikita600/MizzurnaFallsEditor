;TEXT:80079FBC
;TEXT:8007A0D4

@var_C equ -0xC
@var_8 equ -8
@var_4 equ -4

start:

	.ifdef USE_HEADER
				la      $v0, dword_800A3508
	.else
				jal		moveCodeToDynamicMemory
				nop
	.endif
                la      $v1, unk_80101ED0

loc_80079FCC:                            ; CODE XREF: start+1Cj
                sw      $zero, 0($v0)
                addiu   $v0, 4
                sltu    $at, $v0, $v1
                bnez    $at, loc_80079FCC
                nop
                lw      $v0, dword_800A341C
                nop
                addi    $v0, -8
                lui     $t0, 0x8000
                or      $sp, $v0, $t0
                la      $a0, unk_80101ED0
                sll     $a0, 3
                srl     $a0, 3
                lw      $v1, dword_800A3420
                nop
                subu    $a1, $v0, $v1
                subu    $a1, $a0
                sw      $a1, dword_800A3300
                or      $a0, $t0
                sw      $a0, dword_800A32FC
                sw      $ra, dword_800A39D0
                la      $gp, dword_800A341C
                move    $fp, $sp
                jal     InitHeap
                addi    $a0, 4
                lw      $ra, dword_800A39D0
                nop
                jal     main
                nop
                break   1

__main:                                  ; CODE XREF: main+14p
                lw      $t0, dword_800A32F8
                addiu   $sp, -0x10
                sw      $s0, 0x10+@var_C($sp)
                sw      $s1, 0x10+@var_8($sp)
                sw      $ra, 0x10+@var_4($sp)
                bnez    $t0, loc_8007A0BC
                li      $t0, 1
                sw      $t0, dword_800A32F8
                li      $s0, 0x80010000
                li      $s1, 0
                beqz    $s1, loc_8007A0BC
                nop

loc_8007A0A4:                            ; CODE XREF: start+F8j
                lw      $t0, 0($s0)
                addiu   $s0, 4
                jalr    $t0
                addiu   $s1, -1
                bnez    $s1, loc_8007A0A4
                nop

loc_8007A0BC:                            ; CODE XREF: start+C0j
                                         ; start+E0j
                lw      $ra, 0x10+@var_4($sp)
                lw      $s1, 0x10+@var_8($sp)
                lw      $s0, 0x10+@var_C($sp)
                addiu   $sp, 0x10
                jr      $ra
                nop
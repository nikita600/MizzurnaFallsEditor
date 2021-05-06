;TEXT:800338D0
;TEXT:800339C8

@var_20          equ -0x20
@var_1C          equ -0x1C
@var_18          equ -0x18
@var_14          equ -0x14
@var_10          equ -0x10
@var_C           equ -0xC
@var_8           equ -8

.definelabel sub_80035BAC, 0x80035BAC
.definelabel sub_80035BC4, 0x80035BC4
.definelabel sub_80035C14, 0x80035C14
.definelabel sub_80035C20, 0x80035C20
.definelabel sub_80035AB0, 0x80035AB0
.definelabel sub_800336AC, 0x800336AC
.definelabel sub_80033588, 0x80033588

sub_800338D0:
                addiu   $sp, -0x30
                sw      $s1, 0x30+@var_C($sp)
                move    $s1, $a0
                li      $a0, 0x118
                sw      $ra, 0x30+@var_8($sp)
                jal     mm_alloc_NG
                sw      $s0, 0x30+@var_10($sp)
                move    $s0, $v0
                beqz    $s0, loc_800339B0
                move    $a0, $s0
                move    $a1, $s1
                li      $a2, 0xF
                li      $a3, 1
                li      $v0, 0x3F0
                sw      $v0, 0x30+@var_20($sp)
                li      $v0, 0xF0  ; 'Ё'
                sw      $v0, 0x30+@var_1C($sp)
				
			.ifdef USE_VWF
				li      $v0, 0x80  ; max char count
			.else
				li      $v0, 0x40  ; max char count
			.endif
				
                sw      $s0, 0x344($gp)
                sw      $v0, 0x30+@var_18($sp)
                jal     loadFontData
                sw      $v0, 0x30+@var_14($sp)
                bnez    $v0, loc_800339A4
                move    $a0, $s0
                li      $a1, 0xFFFFFFA1
                li      $a2, 0x28  ; '('
                li      $a3, 0xF0  ; 'Ё'
                li      $v0, 0x30  ; '0'
                jal     sub_80035BAC
                sw      $v0, 0x30+@var_20($sp)
                move    $a0, $s0
                move    $a1, $zero
                jal     sub_80035BC4
                li      $a2, 0x91  ; 'С'
                move    $a0, $s0
                li      $a1, 4
                jal     sub_80035C14
                li      $a2, 1
                move    $a0, $s0
                li      $a1, 0xF
                jal     sub_80035C20
                li      $a2, 0x10
                move    $a0, $s0
                lui     $a1, 0x8003
                jal     sub_80035AB0
                addiu   $a1, 0x36AC
                sh      $zero, 0x114($s0)
                sb      $zero, 0x110($s0)
                sb      $zero, 0x111($s0)
                jal     sub_80033588
                sb      $zero, 0x112($s0)
                j       loc_800339B4
                move    $v0, $zero
 ; ---------------------------------------------------------------------------

loc_800339A4:                            ; CODE XREF: sub_800338D0+58j
                lw      $a0, 0x344($gp)
                jal     sub_8004FD8C
                nop

loc_800339B0:                            ; CODE XREF: sub_800338D0+20j
                li      $v0, 1

loc_800339B4:                            ; CODE XREF: sub_800338D0+CCj
                lw      $ra, 0x30+@var_8($sp)
                lw      $s1, 0x30+@var_C($sp)
                lw      $s0, 0x30+@var_10($sp)
                jr      $ra
                addiu   $sp, 0x30
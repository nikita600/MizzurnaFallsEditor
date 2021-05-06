;TEXT:80035030  ; =============== S U B R O U T I N E =======================================

@var_18          equ -0x18
@var_14          equ -0x14
@var_10          equ -0x10
@var_C           equ -0xC
@var_8           equ -8
@arg_10          equ  0x10

renderTextSub01_04:                      ; CODE XREF: renderTextCharacter01+1A0p
                addiu   $sp, -0x28
                sw      $s1, 0x28+@var_14($sp)
                move    $s1, $a0
                sw      $ra, 0x28+@var_8($sp)
                sw      $s3, 0x28+@var_C($sp)
                sw      $s2, 0x28+@var_10($sp)
                sw      $s0, 0x28+@var_18($sp)
                lhu     $v0, 0x5C($s1)
                lhu     $v1, 0x60($s1)
                move    $s0, $a2
                addu    $v0, $v1
                sh      $v0, 0x56($s0)
                lhu     $v0, 0x28+@arg_10($sp)
                lhu     $v1, 0x5E($s1)
                lhu     $a0, 0x62($s1)
                move    $s3, $a1
                sh      $zero, 0x50($s0)
                sh      $zero, 0x52($s0)
                sh      $zero, 0x54($s0)
                ori     $v0, 3
                addu    $v1, $a0
                sb      $v0, 0x5C($s0)
                sh      $v1, 0x58($s0)
                lw      $v0, 0xB0($s1)
                nop
                andi    $v0, 0x10
				
			.ifdef USE_VWF
				bnez    $v0, loc_800350AC
                addiu   $s2, $s0, 0x28
			.else
				beqz    $v0, loc_800350AC
                addiu   $s2, $s0, 0x28
			.endif
				
                lbu     $v0, 5($s3)
                j       loc_800350B8
                sb      $v0, 0x64($s1)
 ; ---------------------------------------------------------------------------

loc_800350AC:                            ; CODE XREF: renderTextSub01_04+68j
                lbu     $v0, 0x92($s1)
                nop
                sb      $v0, 0x64($s1)

loc_800350B8:                            ; CODE XREF: renderTextSub01_04+74j
                lw      $v0, 0xB0($s1)
                nop
                andi    $v0, 0x20
                beqz    $v0, loc_800350D8
                nop
                lbu     $v0, 6($s3)
                j       loc_800350E4
                sb      $v0, 0x65($s1)
 ; ---------------------------------------------------------------------------

loc_800350D8:                            ; CODE XREF: renderTextSub01_04+94j
                lbu     $v0, 0x93($s1)
                nop
                sb      $v0, 0x65($s1)

loc_800350E4:                            ; CODE XREF: renderTextSub01_04+A0j
                lw      $v0, 0xB0($s1)
                nop
                andi    $v0, 4
				
			.ifdef USE_VWF
				beqz    $v0, loc_80035110
                nop
			.else
				bnez    $v0, loc_80035110
                nop
			.endif
				
                lbu     $v0, 0x90($s1)
                nop
                sb      $v0, 0x5A($a2)
                lbu     $v0, 0x91($s1)
                j       loc_80035128
                sb      $v0, 0x5B($a2)
 ; ---------------------------------------------------------------------------

loc_80035110:                            ; CODE XREF: renderTextSub01_04+C0j
                lbu     $v0, 5($s3)
                nop
                sb      $v0, 0x5A($a2)
                lbu     $v0, 6($s3)
                nop
                sb      $v0, 0x5B($a2)

loc_80035128:                            ; CODE XREF: renderTextSub01_04+D8j
                lhu     $v0, 0x48($s1)
                andi    $a0, $a3, 0xFF
                sll     $v0, 2
                div     $v0, $a0
                mflo    $v0
                lhu     $a3, 0x4A($s1)
                nop
                sb      $a3, 0xD($s0)
                move    $t0, $v0
                sb      $t0, 0xC($s0)
                lbu     $v0, 0x5A($a2)
                move    $v1, $t0
                sb      $a3, 0x15($s0)
                sb      $t0, 0x1C($s0)
                addu    $v0, $v1
                sb      $v0, 0x14($s0)
                lbu     $v0, 0x5B($a2)
                move    $a1, $a3
                addu    $v0, $a1
                sb      $v0, 0x1D($s0)
                lbu     $v0, 0x5A($a2)
                nop
                addu    $v0, $v1
                sb      $v0, 0x24($s0)
                lbu     $v0, 0x5B($a2)
                nop
                addu    $v0, $a1
                sb      $v0, 0x25($s0)
                sb      $t0, 0xC($s2)
                sb      $a3, 0xD($s2)
                lbu     $v0, 0x5A($a2)
                sb      $a3, 0x15($s2)
                sb      $t0, 0x1C($s2)
                addu    $v0, $v1
                sb      $v0, 0x14($s2)
                lbu     $v0, 0x5B($a2)
                nop
                addu    $v0, $a1
                sb      $v0, 0x1D($s2)
                lbu     $v0, 0x5A($a2)
                nop
                addu    $v0, $v1
                sb      $v0, 0x24($s2)
                lbu     $v0, 0x5B($a2)
                srl     $a0, 1
                addu    $v0, $a1
                sb      $v0, 0x25($s2)
                lbu     $v0, 0x58($s1)
                lhu     $a2, 0x84($s1)
                move    $a1, $zero
                addu    $a2, $v0
                andi    $a2, 0xFFFF
                srl     $v0, $a2, 4
                sll     $a3, $v0, 8
                andi    $a2, 0xF
                sll     $a2, 6
                jal     GetTPage
                andi    $a3, 0xFF00
                sh      $v0, 0x16($s2)
                sh      $v0, 0x16($s0)
                lbu     $v0, 7($s3)
                nop
                andi    $v0, 1
                bnez    $v0, loc_8003524C
                nop
                lhu     $a3, 0x7E($s1)
                lbu     $v0, 4($s3)
                lhu     $a0, 0x7C($s1)
                addu    $a3, $v0
                jal     GetClut
                andi    $a1, $a3, 0xFFFF
                sh      $v0, 0xE($s2)
                sh      $v0, 0xE($s0)

loc_8003524C:                            ; CODE XREF: renderTextSub01_04+1F4j
                lw      $ra, 0x28+@var_8($sp)
                lw      $s3, 0x28+@var_C($sp)
                lw      $s2, 0x28+@var_10($sp)
                lw      $s1, 0x28+@var_14($sp)
                lw      $s0, 0x28+@var_18($sp)
                jr      $ra
                addiu   $sp, 0x28
;TEXT:80035264  ; End of function renderTextSub01_04
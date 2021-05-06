@var_28          equ -0x28
@var_20          equ -0x20
@var_1C          equ -0x1C
@var_18          equ -0x18
@var_14          equ -0x14
@var_10          equ -0x10
@var_C           equ -0xC
@var_8           equ -8
@var_4           equ -4


sub_8003D904:
                addiu   $sp, -0x38
                sw      $s4, 0x38+@var_10($sp)
                move    $s4, $a0
                sw      $ra, 0x38+@var_4($sp)
                sw      $s6, 0x38+@var_8($sp)
                sw      $s5, 0x38+@var_C($sp)
                sw      $s3, 0x38+@var_14($sp)
                sw      $s2, 0x38+@var_18($sp)
                sw      $s1, 0x38+@var_1C($sp)
                jal     GsGetActiveBuff
                sw      $s0, 0x38+@var_20($sp)
                move    $s6, $v0
                lbu     $v1, 0x1A($s4)
                li      $v0, 1
                beq     $v1, $v0, loc_8003D9FC
                slti    $v0, $v1, 2
                beqz    $v0, loc_8003D95C
                li      $v0, 2
                beqz    $v1, loc_8003D974
                nop
                j       loc_8003DC2C
                nop
 ; ---------------------------------------------------------------------------

loc_8003D95C:
                beq     $v1, $v0, loc_8003DBD0
                li      $v0, 3
                beq     $v1, $v0, loc_8003DBD8
                nop
                j       loc_8003DC2C
                nop
 ; ---------------------------------------------------------------------------

loc_8003D974:
                jal     sub_80023154
                nop
                jal     loadAllFonts
                move    $a0, $s4
                bnez    $v0, loc_8003DC38
                li      $v0, 1
                lbu     $v0, 0x1A($s4)
                lw      $v1, 8($s4)
                addiu   $v0, 1
                sb      $v0, 0x1A($s4)
                sb      $zero, 0xB01($v1)
                lbu     $v0, 0x1B($s4)
                lw      $v1, 8($s4)
                sw      $zero, 0x1C($s4)
                andi    $v0, 0xFE
                ori     $v0, 2
                sb      $v0, 0x1B($s4)
                lbu     $v0, 0xB00($v1)
                lbu     $a1, 0xAFE($v1)
                move    $a0, $s4
                sh      $v0, 0xAFA($v1)
                jal     sub_8003E32C
                sb      $a1, 0xAFD($v1)
                lui     $a0, 0x800D
                jal     sub_80025E58
                subiu   $a0, 0x3a60;dword_800CC5A0
                jal     sub_8003E81C
                move    $a0, $s4
                jal     sub_8003D6E0
                move    $a0, $s4
                jal     sub_80048564
                nop
                j       loc_8003DC2C
                nop
 ; ---------------------------------------------------------------------------

loc_8003D9FC:
                lbu     $v1, 0x1B($s4)
                lw      $s5, 8($s4)
                andi    $v0, $v1, 2
                beqz    $v0, loc_8003DABC
                andi    $v0, $v1, 4
                beqz    $v0, loc_8003DA28
                move    $s2, $s5
                move    $s0, $zero
                xori    $v0, $v1, 4
                j       loc_8003DA74
                sb      $v0, 0x1B($s4)
 ; ---------------------------------------------------------------------------

loc_8003DA28:
                andi    $v0, $v1, 1
                beqz    $v0, loc_8003DA58
                addiu   $s1, $s4, 0xC
                lh      $v1, 0xAFA($s5)
                nop
                sll     $v0, $v1, 1
                addu    $v0, $v1
                sll     $v0, 1
                addu    $v0, $s5, $v0
                lh      $s0, 0x1AA($v0)
                j       setupTextContext_8003DA7C
                move    $a0, $s1
 ; ---------------------------------------------------------------------------

loc_8003DA58:
                lh      $v1, 0xAFA($s5)
                nop
                sll     $v0, $v1, 1
                addu    $v0, $v1
                sll     $v0, 1
                addu    $v0, $s5, $v0
                lh      $s0, 0x17A($v0)

loc_8003DA74:
                addiu   $s1, $s4, 0xC
                move    $a0, $s1

setupTextContext_8003DA7C:
                andi    $s0, 0xFFFF
                jal     sub_80035864 ; getCharCount
                move    $a1, $s0
                sw      $zero, 0x38+@var_28($sp)
                addiu   $a0, $s2, 0x38 ; textContext
                move    $a1, $s1
                move    $a2, $s0
				
@setTextContext:
			.ifdef USE_VWF
				jal inventory_setBaseOffset_setup
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
                jal     sub_80035CC0 ; endProc
                sra     $a3, 16

loc_8003DABC:
                jal     GsSetRefView2
                addiu   $a0, $s5, 0x238
                jal     GsSetProjection
                li      $a0, 0x190
                jal     sub_8003DC60
                move    $a0, $s4
                jal     sub_8003E4A0
                move    $a0, $s4
                lw      $s2, 8($s4)
                jal     GsGetActiveBuff
                nop
                jal     sub_8001A770
                move    $s0, $v0
                li      $a0, 0xD
                sll     $v1, $s0, 2
                addu    $v1, $s0
                sll     $v1, 2
                jal     getActiveBufIndex
                addu    $s3, $v0, $v1
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s2, 0x14C
                addiu   $a1, $s2, 0xEC
                sll     $s1, $s0, 1
                addu    $s1, $s0
                sll     $s1, 3
                lw      $a0, 4($s3)
                addu    $a1, $s1
                jal     AddPrim
                addiu   $a0, 0x3C  ; '<'
                sll     $s0, 3
                addiu   $s0, 0x2C0
                lw      $a0, 4($s3)
                addu    $a1, $s2, $s0
                jal     AddPrim
                addiu   $a0, 0x3C  ; '<'
                addiu   $s2, 0x11C
                lw      $a0, 4($s3)
                addu    $a1, $s2, $s1
                jal     AddPrim
                addiu   $a0, 0x34  ; '4'
                lbu     $v1, 0x1B($s4)
                nop
                andi    $v0, $v1, 2
                bnez    $v0, loc_8003DB84
                xori    $v0, $v1, 2
                jal     sub_8003DED8
                move    $a0, $s4
                j       loc_8003DB88
                nop
 ; ---------------------------------------------------------------------------

loc_8003DB84:
                sb      $v0, 0x1B($s4)

loc_8003DB88:
                lbu     $v0, 0x1B($s4)
                nop
                andi    $v0, 0x20
                bnez    $v0, loc_8003DBB0
                nop
                jal     getActiveBufIndex
                li      $a0, 0xD
                move    $a0, $s5
                jal     sub_8003EB58
                move    $a1, $v0

loc_8003DBB0:
                jal     getActiveBufIndex
                li      $a0, 0xC
                addiu   $a0, $s5, 0x38
                move    $a1, $v0
                jal     renderText_00
                move    $a2, $s6
                j       loc_8003DC2C
                nop
 ; ---------------------------------------------------------------------------

loc_8003DBD0:
                j       loc_8003DC2C
                sb      $v0, 0x1A($s4)
 ; ---------------------------------------------------------------------------

loc_8003DBD8:
                jal     sub_80048574
                nop
                lw      $s0, 8($s4)
                nop
                lw      $a0, 0x174($s0)
                jal     sub_8004FD8C
                nop
                jal     sub_800358DC
                addiu   $a0, $s0, 0x38
                lw      $a0, 0x98($gp)
                jal     sub_8004FD8C
                nop
                lw      $a0, 0x46C($gp)
                jal     sub_8004FD8C
                nop
				lui     $a0, 0x800D
                subiu   $a0, 0x3a60;dword_800CC5A0
                jal     sub_80025E64
                sb      $zero, 0x1A($s4)
                j       loc_8003DC38
                li      $v0, 1
 ; ---------------------------------------------------------------------------

loc_8003DC2C:
                jal     sub_80019F0C
                nop
                move    $v0, $zero

loc_8003DC38:
                lw      $ra, 0x38+@var_4($sp)
                lw      $s6, 0x38+@var_8($sp)
                lw      $s5, 0x38+@var_C($sp)
                lw      $s4, 0x38+@var_10($sp)
                lw      $s3, 0x38+@var_14($sp)
                lw      $s2, 0x38+@var_18($sp)
                lw      $s1, 0x38+@var_1C($sp)
                lw      $s0, 0x38+@var_20($sp)
                jr      $ra
                addiu   $sp, 0x38
;TEXT:8004D0B8

var_18          equ -0x18
var_14          equ -0x14
var_10          equ -0x10
var_C           equ -0xC
var_8           equ -8
var_4           equ -4

.definelabel sub_8004C9FC, 		0x8004C9FC
.definelabel sub_8004CB38, 		0x8004CB38
.definelabel sub_8003EB58, 		0x8003EB58


renderMap:                          ; CODE XREF: sub_8004D34C:loc_8004D3C4p

                addiu   $sp, -0x28
                sw      $s1, 0x28+var_14($sp)
                move    $s1, $a0
                sw      $ra, 0x28+var_4($sp)
                sw      $s4, 0x28+var_8($sp)
                sw      $s3, 0x28+var_C($sp)
                sw      $s2, 0x28+var_10($sp)
                sw      $s0, 0x28+var_18($sp)
                lw      $s3, 4($s1)
                nop
                lbu     $a1, 0x5E0($s3)
                nop
                beqz    $a1, loc_8004D174
                addiu   $a0, $s3, 0x2C
                addiu   $a1, -1
                andi    $a1, 0xFFFF
                move    $a2, $zero
                jal     renderText02_80035D38
                li      $a3, 0x90  ; 'Р'
				li      $a0, 0xF
				
			.ifdef USE_VWF
@width:
				sh      $v1, 0x28($s3)
@height:
				li      $v0, 0x10
				sh      $v0, 0x2A($s3)
@x0:
				lh		$v0, 0x0C($s3)
				nop
				subu	$v0, $v1
				srl		$v0, 1
				subiu	$v0, 0x08
				sh      $v0, 0x20($s3)
@y0:
				li      $v0, 0x42
				nop
				nop
			.else
@getLocationNameSprite_width:
                sll     $v0, 16
                sra     $v0, 16
                sll     $v1, $v0, 4
				sh      $v1, 0x28($s3)
				
@getLocationNameSprite_height:		
				li      $v1, 0x10
                sll     $v0, 20
                sra     $v0, 17
                sh      $v1, 0x2A($s3)
				
@getLocationNameSprite_x0:
                li      $v1, 0x48  ; 'H'
                subu    $v1, $v0
                li      $v0, 0x40  ; '@'
                sh      $v1, 0x20($s3)   ; write mapLabelText command
			.endif
			
@getLocationNameSprite_y0:
                jal     getActiveBufIndex
                sh      $v0, 0x22($s3)
				
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s3, 0x18
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s3, 0x10
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                move    $a1, $s3

loc_8004D174:                            ; CODE XREF: renderText_Map+30j
                addiu   $s0, $s3, 0xB8
                jal     sub_8004C9FC
                move    $a0, $s0
                move    $a1, $zero
                lhu     $v0, 8($s0)
                lbu     $a0, 0x513($s0)
                lhu     $v1, 0xA($s0)
                beqz    $a0, loc_8004D20C
                addiu   $t0, $s3, 0xE4
                sll     $v0, 16
                sra     $a3, $v0, 16
                sll     $v0, $v1, 16
                sra     $a2, $v0, 16
                move    $t1, $a0
                move    $a0, $t0

loc_8004D1B0:                            ; CODE XREF: renderText_Map+14Cj
                lh      $v1, 0x1C($a0)
                nop
                slt     $v0, $a3, $v1
                bnez    $v0, loc_8004D1FC
                addiu   $v0, $v1, 0x10
                slt     $v0, $a3, $v0
                beqz    $v0, loc_8004D1FC
                nop
                lh      $v1, 0x1E($a0)
                nop
                slt     $v0, $a2, $v1
                bnez    $v0, loc_8004D1FC
                addiu   $v0, $v1, 0x10
                slt     $v0, $a2, $v0
                beqz    $v0, loc_8004D1FC
                addu    $v0, $s0, $a1
                lbu     $v0, 0x4FC($v0)
                j       loc_8004D210
                addiu   $v0, 1
 ; ---------------------------------------------------------------------------

loc_8004D1FC:                            ; CODE XREF: renderText_Map+104j
                                         ; renderText_Map+110j ...
                addiu   $a1, 1
                slt     $v0, $a1, $t1
                bnez    $v0, loc_8004D1B0
                addiu   $a0, 0x38  ; '8'

loc_8004D20C:                            ; CODE XREF: renderText_Map+D8j
                move    $v0, $zero

loc_8004D210:                            ; CODE XREF: renderText_Map+13Cj
                move    $a0, $s1
                jal     sub_8004CB38
                sb      $v0, 0x5E0($s3)
                move    $s0, $zero
                addiu   $s2, $s3, 0xB8
                lbu     $v0, 0x513($s2)
                nop
                beqz    $v0, loc_8004D274
                addiu   $s4, $s3, 0xE4
                move    $s1, $s4

loc_8004D238:                            ; CODE XREF: renderText_Map+1B4j
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s1, 0x14
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s1, 0x28
                lbu     $v0, 0x513($s2)
                addiu   $s0, 1
                slt     $v0, $s0, $v0
                bnez    $v0, loc_8004D238
                addiu   $s1, 0x38  ; '8'

loc_8004D274:                            ; CODE XREF: renderText_Map+174j
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s2, 0x14
                lbu     $v0, 0x513($s2)
                nop
                beqz    $v0, loc_8004D2C4
                move    $s0, $zero
                move    $s1, $s4

loc_8004D29C:                            ; CODE XREF: renderText_Map+204j
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                move    $a1, $s1
                lbu     $v0, 0x513($s2)
                addiu   $s0, 1
                slt     $v0, $s0, $v0
                bnez    $v0, loc_8004D29C
                addiu   $s1, 0x38  ; '8'

loc_8004D2C4:                            ; CODE XREF: renderText_Map+1D8j
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s2, 0x24
                jal     getActiveBufIndex
                li      $a0, 0xF
                addiu   $a0, $s3, 0x80
                jal     sub_8003EB58
                move    $a1, $v0
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s3, 0x58
                lui     $v0, 0x800D
                lui     $v1, 8
                lw      $v0, -0x3a5c($v0);0x800CC5A4
                lw      $ra, 0x28+var_4($sp)
                lw      $s4, 0x28+var_8($sp)
                lw      $s3, 0x28+var_C($sp)
                lw      $s2, 0x28+var_10($sp)
                lw      $s1, 0x28+var_14($sp)
                lw      $s0, 0x28+var_18($sp)
                and     $v0, $v1
                sltu    $v0, $zero, $v0
                jr      $ra
                addiu   $sp, 0x28
;TEXT:8004D334
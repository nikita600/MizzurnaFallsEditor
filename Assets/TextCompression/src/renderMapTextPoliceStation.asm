 ; =============== S U B R O U T I N E =======================================

@var_8           equ -8
@var_4           equ -4

.definelabel renderTextMap_readMdt, 0x80035D38

sub_8004D850:

                addiu   $sp, -0x18
                sw      $s0, 0x18+@var_8($sp)
                move    $s0, $a0
                andi    $v0, $a1, 0xFF
                beqz    $v0, loc_8004D8F4
                sw      $ra, 0x18+@var_4($sp)
                addiu   $a0, $s0, 0x2C
                andi    $a1, 0xFF
                addiu   $a1, -1
                andi    $a1, 0xFFFF
                move    $a2, $zero
                jal     renderTextMap_readMdt
                li      $a3, 0x90  ; 'Р'
                li      $a0, 0xF
				
				.ifdef USE_VWF
@width:
				sh      $v1, 0x28($s0)
@height:
				li      $v0, 0x10
				sh      $v0, 0x2A($s0)
@x0:
				lh		$v0, 0x0C($s0)
				nop
				subu	$v0, $v1
				srl		$v0, 1
				subiu	$v0, 0x18 ;0x08
				sh      $v0, 0x20($s0)
@y0:
				;li		$v0, 0xB0
				;sh		$v0, 0x0C($s0)
				;li		$v0, -24
				;sh		$v0, 0x08($s0)
				nop
				nop
				li      $v0, 0x42
			.else
@getLocationNameSprite_width:
                sll     $v0, 16
                sra     $v0, 16
                sll     $v1, $v0, 4
                sh      $v1, 0x28($s0)
				
@getLocationNameSprite_height:		
				li      $v1, 0x10
                sll     $v0, 20
                sra     $v0, 17
                sh      $v1, 0x2A($s0)
				
@getLocationNameSprite_x0:
                li      $v1, 0x48  ; 'H'
                subu    $v1, $v0
                li      $v0, 0x40  ; '@'
                sh      $v1, 0x20($s0)
			.endif
				
                jal     getActiveBufIndex
                sh      $v0, 0x22($s0)
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s0, 0x18
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                addiu   $a1, $s0, 0x10
                jal     getActiveBufIndex
                li      $a0, 0xF
                move    $a0, $v0
                jal     AddPrim
                move    $a1, $s0

loc_8004D8F4:                            ; CODE XREF: sub_8004D850+10j
                lw      $ra, 0x18+@var_4($sp)
                lw      $s0, 0x18+@var_8($sp)
                jr      $ra
                addiu   $sp, 0x18
 ; End of function sub_8004D850


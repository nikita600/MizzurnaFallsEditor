;TEXT:8004F42C
;TEXT:8004F480

@var_8 equ -8

sub_8004F42C:
	addiu   $sp, -0x18
	sw      $ra, 0x18+@var_8($sp)
	jal     MemCardInit
	move    $a0, $zero
	jal     MemCardStart
	nop
	jal     sub_80038AD0
	nop
	jal     sub_8004F674
	nop
	jal     sub_8004FB7C
	nop

	lui      $a0, 0x8010
    ori      $a0, $a0, 0xcc00

	lui     $a1, 0xF
	jal     sub_8004FC10
    ori     $a1, $a1, 0x1400

	lw      $ra, 0x18+@var_8($sp)
	nop
	jr      $ra
	addiu   $sp, 0x18
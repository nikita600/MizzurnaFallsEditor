
@textContext					equ $a0
@textContext.xOffset			equ 0x24(@textContext)
@textContext.yOffset			equ 0x26(@textContext)

@reg_ra			equ 0x10($sp)
@reg_a0			equ 0x14($sp)
@reg_a1			equ 0x18($sp)
@reg_a2			equ 0x1C($sp)
@reg_a3			equ 0x20($sp)

; $a0 - txtContext
; $a1 - charCode
clearNoteBookTexture:
	addiu	$sp, -0x24
	sw		$ra, @reg_ra
	sw		$a0, @reg_a0
	sw		$a1, @reg_a1
	sw		$a2, @reg_a2
	sw		$a3, @reg_a3
	
	sh		$a2, @textContext.xOffset
	sh		$a3, @textContext.yOffset
	
@loop:
	lw		$a0, @reg_a0
	jal		0x80035460
	li		$a1, 0xA000
	bnez	$s5, @loop
	addiu	$s5, -0x01
	
	lw		$ra, @reg_ra
	lw		$a0, @reg_a0
	lw		$a1, @reg_a1
	lw		$a2, @reg_a2
	lw		$a3, @reg_a3
	
	jr		$ra
	addiu	$sp, 0x24


renderTextNotebookCharacter_00:
	addiu	$sp, -0x18
	sw		$ra, @reg_ra
	
	sb		$v0, 0xA6($s1)
	jal		clearNoteBookTexture
	li		$s5, (32*5)
	
	jal		0x80035D38 ;renderText2_readChar_80035d38
	nop
	
	lw		$ra, @reg_ra
	nop
	jr		$ra
	addiu	$sp, 0x18
	

renderTextNotebookCharacter_02:
	addiu	$sp, -0x18
	sw		$ra, @reg_ra
	
	move	$a3, $a2
	jal		clearNoteBookTexture
	li		$s5, (32*5)
	
	jal		0x80035D38 ;renderText2_readChar_80035d38
	nop
	
	lw		$ra, @reg_ra
	nop
	jr		$ra
	addiu	$sp, 0x18
	
renderTextPhoneNumber_00:
	addiu	$sp, -0x18
	sw		$ra, @reg_ra
	
	jal		clearNoteBookTexture
	li		$s5, (32*1)
	
	jal		0x80035D38 ;renderText2_readChar_80035d38
	addiu	$s1, 0x1
	
	lw		$ra, @reg_ra
	nop
	jr		$ra
	addiu	$sp, 0x18

setupNotebookCursor:
	li		$s3, 0x20
	sb		$zero, 0x355($s4)
	sh		$s3, 0x35A($s4)
	j		0x8004EEA8
	nop
	
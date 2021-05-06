; ---------------------------------------------------------------------------

@mfoCharEntry	equ 0x228($sp)

; ---------------------------------------------------------------------------

renderTextMap_renderChar_saveCharacterEntry:
	lbu     $v1, 7($a1) ; load bppMode
	sw		$a1, @mfoCharEntry
	jr		$ra
	nop

; ---------------------------------------------------------------------------

renderTextMap_renderChar_getCharWidth:
	lw		$v0, @mfoCharEntry
	nop
	lbu     $v0, 0x05($v0)
	jr		$ra
	nop

; ---------------------------------------------------------------------------

renderTextMap_renderChar_getCharWidthOffset:
	lw		$a0, @mfoCharEntry
	nop
	lbu     $a0, 0x05($a0)
	jr		$ra
	nop

; ---------------------------------------------------------------------------
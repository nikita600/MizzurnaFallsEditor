; -----------------------------------------------------------------------------

@mfoCharEntry						equ ($s3)
@mfoCharEntry.charPixelsOffset		equ 0x00@mfoCharEntry
@mfoCharEntry.bppMode				equ 0x07@mfoCharEntry

@textContext						equ ($a3)
@textContext.pixelCharOffsetX		equ 0x58@textContext
@textContext.pixelCharWidth			equ 0x84@textContext

@textContext.charWidthDefault		equ 0x90($s0)

; -----------------------------------------------------------------------------

renderTextCharacter01_save_mfoEntry:

	lbu     $v1, @mfoCharEntry.bppMode
    move	$t6, $s3
	
	jr      $ra
    nop
	
renderTextCharacter01_patchCharWidth:

	;lbu     $v0, @textContext.charWidthDefault
	lbu		$v0, 0x05($t6)
    andi    $s1, $s2, 0xFF
	
	jr      $ra
    nop
	
renderText_loadImage_patchCharWidth:
	
	;lbu     $v0, @textContext.charWidthDefault
	lbu		$v0, 0x05($t6)
    andi    $a2, 0xFF

	jr      $ra
    nop

; -----------------------------------------------------------------------------
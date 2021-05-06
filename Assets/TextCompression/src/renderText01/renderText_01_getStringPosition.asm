; -----------------------------------------------------------------------------

@stringIndex					equ $a2

@textContext.stringPosition 	equ 0x54($s0)
@textEntry.mdtPtr 				equ 0x08($s3)
@string_ptr_offset 				equ 0x00($s4)

@textFile						equ ($s6)
@textFile.bitIndexesOffset		equ 0x0C@textFile
@textFile.stringOffsets			equ 0x10@textFile

@textFileHeaderPtr				equ $s7

; -----------------------------------------------------------------------------

.definelabel load_mdt_offset, 0x80034A74
.definelabel setup_mdt_render, 0x80034A88

; -----------------------------------------------------------------------------

GetStringPosition:

@is_mdt_mode_str_pos:
	lhu		$v0, mddContext.mdt_mode
	nop
	beqz	$v0, @get_stringPositionMdd
	nop
	
	lw		$v0, @textEntry.mdtPtr
	nop
	j		load_mdt_offset
	nop
	
; -----------------------------------------------------------------------------

@get_stringPositionMdd:

@load_bit_count:
	lw      $v0, @textFile.bitIndexesOffset
	nop
	addu	$v0, $v0, @textFileHeaderPtr
	addu	$v0, $v0, @stringIndex
	lbu		$v0, 0($v0)
	nop
	sb 		$v0, mddContext.bit_count

@load_string_position:
	lw		$v0, @textFile.stringOffsets
	lhu     $v1, @string_ptr_offset
	addu	$v0, @textFileHeaderPtr, $v0
	addu    $v0, $v1
	sw      $v0, @textContext.stringPosition
	
; -----------------------------------------------------------------------------

@load_first_string_byte:
	lbu 	$v1, 0x00($v0)
	addiu	$v0, 1
	sw		$v0, @textContext.stringPosition
	
	lbu		$v0, mddContext.bit_count
	nop
	sllv	$v1, $v0
	sb		$v1, mddContext.current_byte
	
	j 		setup_mdt_render ; return
	nop
	
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------

@mdt_signature 				equ 0x0054444D

@textEntry 					equ ($s3)
@textEntry.stringIndex		equ 0x00@textEntry
@textEntry.mdtFilePtr 		equ 0x08@textEntry

@textFilePtr				equ $s6
@textFileHeaderPtr			equ $s7

@textFile					equ ($s6)
@textFile.signature			equ 0x00@textFile
@textFile.stringsCount		equ 0x04@textFile
@textFile.stringsDataOffset	equ 0x08@textFile

; -----------------------------------------------------------------------------

.definelabel start_mdt_read, 		0x800349EC
.definelabel check_string_index, 	0x80034A04

; -----------------------------------------------------------------------------

GetTextEntryOffset:

@push_registers_to_stack:
	sw		$s5, mddContext.reg_s5
	sw		$s6, mddContext.reg_s6
	sw		$s7, mddContext.reg_s7

@setup_mdd_context:
	li		$s5, mddContextPtr

@get_mdt_offset:
	lw		$s6, @textEntry.mdtFilePtr
	nop
	lw		@textFilePtr, 0x00($s6)
	li		$v0, 0x04		; size of MDD signature
	addu	@textFileHeaderPtr, @textFilePtr, $v0

@check_is_mdt:
	lw		$v0, @textFile.signature
	li		$v1, @mdt_signature
	bne		$v0, $v1, @start_mdd_mode
	nop
	
; -----------------------------------------------------------------------------
	
@continue_mdt_mode:
	li		$v0, 1
	sh		$v0, mddContext.mdt_mode
	sb		$zero, mddContext.prev_char_mode

	lhu     $a2, @textEntry.stringIndex
	j 		start_mdt_read
	nop
	
; -----------------------------------------------------------------------------
	
@start_mdd_mode:
	sh		$zero, mddContext.mdt_mode

; -----------------------------------------------------------------------------

@get_left_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x14
	sw		$v0, mddContext.left_nodes_ptr
	
; -----------------------------------------------------------------------------
	
@get_right_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x1C
	sw		$v0, mddContext.right_nodes_ptr

; -----------------------------------------------------------------------------

@get_char_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x24
	sw		$v0, mddContext.char_nodes_ptr
	
; -----------------------------------------------------------------------------	
	
@load_str_entry_pos:
	lhu     $a2, @textEntry.stringIndex
	lw      $v0, @textFile.stringsCount
	lw      $a0, @textFile.stringsDataOffset
	sll     $a1, $a2, 0x02
	addu	$a0, @textFileHeaderPtr
	j 		check_string_index
	nop
	
; -----------------------------------------------------------------------------

@get_mdd_offset_to_v0:
	add		$v0, $v0, @textFilePtr
	lw		$v1, 0x00($v0)
	nop
	addu	$v0, @textFileHeaderPtr, $v1
	jr 		$ra
	nop
	
; -----------------------------------------------------------------------------
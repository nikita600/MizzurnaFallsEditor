; -----------------------------------------------------------------------------

@mdt_signature 					equ 0x0054444D

@stringPosition					equ $s0
@currentCharacter				equ 0x00(@stringPosition)

@renderedCharCount				equ $s1

@stringEntry 					equ ($s2)
@stringEntry.Offset				equ 0x00@stringEntry
@stringEntry.Length				equ 0x02@stringEntry

@textContext					equ ($s3)
@textContext.mdtFilePtr			equ 0x14@textContext
@textContext.mdtTablePtr		equ 0x18@textContext
@textContext.mdtStringsPtr		equ 0x1C@textContext
@textContext.xOffset			equ 0x24@textContext
@textContext.yOffset			equ 0x26@textContext

@textFilePtr					equ $s6

@textFile						equ ($s6)
@textFile.signature				equ 0x00@textFile
@textFile.stringsCount			equ 0x04@textFile
@textFile.stringsDataOffset		equ 0x08@textFile
@textFile.bitIndexesOffset		equ 0x0C@textFile
@textFile.stringsOffset			equ 0x10@textFile

@textFileHeaderPtr				equ $s7

@mddContext						equ ($sp)
@mddContext.mdtMode				equ 0x28@mddContext
@mddContext.left_nodes_ptr		equ	0x2C@mddContext
@mddContext.right_nodes_ptr		equ 0x30@mddContext
@mddContext.char_nodes_ptr		equ	0x34@mddContext

@mddContext.node_offset 		equ 0x38@mddContext	
@mddContext.current_byte 		equ 0x3C@mddContext	
@mddContext.bit_count 			equ 0x40@mddContext	

@mddContext.prev_char			equ 0x44@mddContext	
@mddContext.prev_char_mode		equ 0x48@mddContext	
@mddContext.reg_s6				equ 0x4C@mddContext
@mddContext.reg_s7				equ 0x50@mddContext

@mddContext.xOffset				equ 0x54@mddContext

.definelabel get_string_entry, 	0x80035D74
.definelabel check_string_entry_2, 0x80035D80
.definelabel return_2, 0x80035E18
.definelabel NextLineHandler_Return, 0x80035DD8

; -----------------------------------------------------------------------------

NextLineHandler_02:
	andi	$a1, 0x0000FFFF
	li		$v1, 0xFF6E
	bne		$v1, $a1, @return
	nop
	
	sh		$zero, @textContext.xOffset
	
	lhu		$v1, @textContext.yOffset
	nop
	addiu	$v1, 0x10 ; charHeight
	sh		$v1, @textContext.yOffset
	
@return:	
	andi    $v1, $a1, 0xF000
    li      $v0, 0xA000
	j 		NextLineHandler_Return
	nop

; -----------------------------------------------------------------------------

CleanUp_02:

@get_label_width:
	lhu		$v0, @textContext.xOffset
	lhu		$v1, @mddContext.xOffset
	nop
	subu	$v1, $v0, $v1
	sll		$v1, 0x02

@cleanup:
	lhu     $v0, @stringEntry.Length
	lw		@textFilePtr, @mddContext.reg_s6
	lw		@textFileHeaderPtr, @mddContext.reg_s7
	j 		return_2
	nop

; -----------------------------------------------------------------------------

GetStringOffset_02:
	
	sh      $a2, @mddContext.xOffset
	
	sw		@textFilePtr, @mddContext.reg_s6
	sw		@textFileHeaderPtr, @mddContext.reg_s7
	
	lw		@textFilePtr, @textContext.mdtFilePtr
	li		$v0, 4
	addu	@textFileHeaderPtr, @textFilePtr, $v0
	
@is_mdt_file:
	li		$v1, @mdt_signature
	lw		$v0, @textFile.signature
	nop
	bne		$v0, $v1, @start_mdd_mode
	nop
	
@continue_mdt_mode:
	li		$v0, 1
	sw		$v0, @mddContext.mdtMode

	lhu     $a0, @stringEntry.Offset
	lw      $v0, @textContext.mdtStringsPtr
    lhu     $v1, @stringEntry.Length
	addu    @stringPosition, $v0, $a0
	
	j		check_string_entry_2
	nop

; -----------------------------------------------------------------------------

@start_mdd_mode:
	sw		$zero, @mddContext.mdtMode
	sw		$zero, @mddContext.left_nodes_ptr
	sw		$zero, @mddContext.right_nodes_ptr
	sw		$zero, @mddContext.char_nodes_ptr
	sw		$zero, @mddContext.node_offset
	sw		$zero, @mddContext.current_byte
	sw		$zero, @mddContext.bit_count
	sw		$zero, @mddContext.prev_char
	sw		$zero, @mddContext.prev_char_mode
	
; -----------------------------------------------------------------------------

@get_left_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x14
	sw		$v0, @mddContext.left_nodes_ptr
	
; -----------------------------------------------------------------------------
	
@get_right_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x1C
	sw		$v0, @mddContext.right_nodes_ptr

; -----------------------------------------------------------------------------

@get_char_nodes_ptr:
	jal		@get_mdd_offset_to_v0
	li		$v0, 0x24
	sw		$v0, @mddContext.char_nodes_ptr
	
; -----------------------------------------------------------------------------	

@load_bit_count:
	srl		$v1, $a1, 2
	lw      $v0, @textFile.bitIndexesOffset
	nop
	addu	$v0, $v0, $s7
	addu	$v0, $v0, $v1
	lbu		$v0, 0($v0)
	nop
	sb 		$v0, @mddContext.bit_count

; -----------------------------------------------------------------------------	

@load_string_entry:
	lw		$v0, @textFile.stringsDataOffset
	lw		$v1, @textFile.stringsOffset
	addu	$v0, @textFileHeaderPtr
	addu    $s2, $v0, $a1
	
	addu	$v0, $v1,@textFileHeaderPtr
	lhu     $a0, @stringEntry.Offset
	nop 
	
	addu    @stringPosition, $v0, $a0
	
; -----------------------------------------------------------------------------	

@load_first_string_byte:
	lbu 	$v1, @currentCharacter
	addiu	@stringPosition, 1
	
	lbu		$v0, @mddContext.bit_count
	nop
	sllv	$v1, $v0
	sb		$v1, @mddContext.current_byte
	
; -----------------------------------------------------------------------------

	lhu     $v1, @stringEntry.Length
	j		check_string_entry_2
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
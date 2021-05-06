; -----------------------------------------------------------------------------

@mdt_signature 					equ 0x0054444D

@stringPosition					equ $s0

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

@textContext					equ ($s3)
@textContext.mdtFilePtr			equ 0x14@textContext
@textContext.mdtTablePtr		equ 0x18@textContext
@textContext.mdtStringsPtr		equ 0x1C@textContext

@mdtFileOffset					equ ($s6)
@mdtFileOffset.signature		equ 0x00@mdtFileOffset

.definelabel check_string_entry, 0x80035D80
.definelabel handle_character_02, 0x80035DD0

.definelabel continue_read_character_02, 0x80035D90

; -----------------------------------------------------------------------------

DecompressCharacter_02:

@is_mdt_mode_char:
	lhu		$v0, @mddContext.mdtMode
	nop
	beqz	$v0, @read_prev_char
	nop
	
	lbu     $a0, 0x00($s0)
	j		continue_read_character_02
	nop

; -----------------------------------------------------------------------------

@read_prev_char:	
	lbu		$v0, @mddContext.prev_char_mode
	nop
	beqz	$v0, @read_leaf
	nop
	
	lhu		$s1, @mddContext.prev_char ; actual char
	lbu		$s2, @mddContext.prev_char ; first byte of char
	sb		$zero, @mddContext.prev_char_mode
	
	j       handle_character_02
	nop
	
; -----------------------------------------------------------------------------
	
@read_leaf:
	lb		$v0, @mddContext.bit_count
	li		$v1, 8
	sltu	$v0, $v1
	beqz	$v0, @read_next_byte ; if(@mddContext.bit_count < 8)
	nop
	
	lb		$v0, @mddContext.current_byte
	nop
	andi	$v1, $v0, 0x80
	sll		$v0, 1
	sb		$v0, @mddContext.current_byte
	
	lbu		$v0, @mddContext.bit_count
	nop
	addiu	$v0, 1
	sb		$v0, @mddContext.bit_count
	beq		$v1, 0x80, @read_right_nodes
	nop
	
; -----------------------------------------------------------------------------

@read_left_nodes:
	j		@load_node_offset
	lw		$v0, @mddContext.left_nodes_ptr

; -----------------------------------------------------------------------------

@read_right_nodes:
	j		@load_node_offset
	lw		$v0, @mddContext.right_nodes_ptr

; -----------------------------------------------------------------------------

@load_node_offset:
	lhu		$v1, @mddContext.node_offset
	nop
	
	sll		$v1, 1
	addu	$v0, $v1
	lhu		$v0, 0($v0) ; load next offset
	nop
	
	sh		$v0, @mddContext.node_offset

; -----------------------------------------------------------------------------
	
@check_character_node:
	li		$v1, 0x8000
	sltu	$v0, $v1
	bnez	$v0, @read_leaf
	nop

; -----------------------------------------------------------------------------

@read_character:
	lw		$v0, @mddContext.char_nodes_ptr
	lhu		$v1, @mddContext.node_offset
	sh		$zero, @mddContext.node_offset
	
	subiu	$v1, 0x8000
	sll		$v1, 1
	addu	$v0, $v1
	
	lhu		$a1, 0($v0)
	lbu		$a0, 1($v0)
	
	;li		$v1, 1
	;sb		$v1, @mddContext.prev_char_mode
	;sh		$a0, @mddContext.prev_char
	
	j       handle_character_02
	nop
	
; -----------------------------------------------------------------------------

@read_next_byte:
	lbu 	$v1, 0x00(@stringPosition)
	addiu	@stringPosition, 1
	sb		$v1, @mddContext.current_byte
	sb		$zero, @mddContext.bit_count
	
	j		@read_leaf
	nop
	
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------

@textContext.stringPosition 	equ 0x54($s0)

; -----------------------------------------------------------------------------

.definelabel continue_read_character, 	0x80034AE0
.definelabel handle_character, 			0x80034B24

; -----------------------------------------------------------------------------

DecompressCharacterMDD:

@is_mdt_mode_char:
	lhu		$v0, mddContext.mdt_mode
	nop
	beqz	$v0, @read_prev_char
	nop
	
	lbu     $s2, 0($a0)
	j		continue_read_character
	nop

; -----------------------------------------------------------------------------

@read_prev_char:	
	lbu		$v0, mddContext.prev_char_mode
	nop
	beqz	$v0, @read_leaf
	nop
	
	lhu		$s1, mddContext.prev_char ; actual char
	lbu		$s2, mddContext.prev_char ; first byte of char
	sb		$zero, mddContext.prev_char_mode
	
	j       handle_character
	nop
	
; -----------------------------------------------------------------------------
	
@read_leaf:
	lb		$v0, mddContext.bit_count
	li		$v1, 8
	sltu	$v0, $v1
	beqz	$v0, @read_next_byte ; if(mddContext.bit_count < 8)
	nop
	
	lb		$v0, mddContext.current_byte
	nop
	andi	$v1, $v0, 0x80
	sll		$v0, 1
	sb		$v0, mddContext.current_byte
	
	lbu		$v0, mddContext.bit_count
	nop
	addiu	$v0, 1
	sb		$v0, mddContext.bit_count
	beq		$v1, 0x80, @read_right_nodes
	nop
	
; -----------------------------------------------------------------------------

@read_left_nodes:
	j		@load_node_offset
	lw		$v0, mddContext.left_nodes_ptr

; -----------------------------------------------------------------------------

@read_right_nodes:
	j		@load_node_offset
	lw		$v0, mddContext.right_nodes_ptr

; -----------------------------------------------------------------------------

@load_node_offset:
	lhu		$v1, mddContext.node_offset
	nop
	
	sll		$v1, 1
	addu	$v0, $v1
	lhu		$v0, 0($v0) ; load next offset
	nop
	
	sh		$v0, mddContext.node_offset

; -----------------------------------------------------------------------------
	
@check_character_node:
	li		$v1, 0x8000
	sltu	$v0, $v1
	bnez	$v0, @read_leaf
	nop

; -----------------------------------------------------------------------------

@read_character:
	lw		$v0, mddContext.char_nodes_ptr
	lhu		$v1, mddContext.node_offset
	sh		$zero, mddContext.node_offset
	
	subiu	$v1, 0x8000
	sll		$v1, 1
	addu	$v0, $v1
	
	lhu		$s1, 0($v0)
	lbu		$s2, 1($v0)
	
	li		$v1, 1
	sb		$v1, mddContext.prev_char_mode
	sh		$s1, mddContext.prev_char
	
	j       handle_character
	nop
	
; -----------------------------------------------------------------------------

@read_next_byte:
	lw		$v0, @textContext.stringPosition
	nop
	lbu 	$v1, 0x00($v0)
	addiu	$v0, 1
	sw		$v0, @textContext.stringPosition
	sb		$v1, mddContext.current_byte
	sb		$zero, mddContext.bit_count
	
	j		@read_leaf
	nop
	
; -----------------------------------------------------------------------------
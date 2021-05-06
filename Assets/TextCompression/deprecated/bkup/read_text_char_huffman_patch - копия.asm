
; MDD file struct
; 0x00 - MDD signature
; 0x04 - strings_count
; 0x08 - strings_pointer_offset
; 0x0C - bitIndexesOffset
; 0x10 - stringsOffset
; 0x14 - leftNodesOffset
; 0x18 - leftNodesCount
; 0x1C - rightNodesOffset
; 0x20 - rightNodesCount
; 0x24 - charactersOffset
; 0x28 - charactersCount

; free regs: s5, s6, s7

; -----------------------------------------------------------------------------

.psx
.Open "!SLPS017.83", "SLPS017.83", 0x8000F800

; -----------------------------------------------------------------------------

.macro load_byte, dst, offset
	li		dst, offset
	lbu		dst, 0(dst)
	nop
.endmacro

.macro load_short, dst, offset
	li		dst, offset
	lhu		dst, 0(dst)
	nop
.endmacro

.macro save_byte, dst, offset
	li		dst, offset
	sb		dst, 0(dst)
	nop
.endmacro

.macro read_node_offset, file_ptr, nodes_offset, offset_ptr
	lw      $v0, file_ptr
	nop
	lw      $v0, 0($v0)
	nop
	
	addiu	$v0, 4
	addiu	$v0, node_offset
	lw		$v1, 0($v0)
	addu	$v0, $v1
	
	li		$s5, offset_ptr
	lhu		$s6, 0($s5)
	nop
	
	addu 	$s6, $v0
	lhu		$v1, 0($s6)
	nop
	sh		$v1, 0($s7)

	nop
	nop
	nop
	nop
	
	nop
	nop
	nop
	nop
	
.endmacro

; -----------------------------------------------------------------------------

bit_count equ 0x8000B07A
current_byte equ 0x8000B07B
node_offset equ 0x8000B07C

mdt_ptr equ 0x08($s3)
string_ptr_offset equ 0x00($s4)
string_position equ 0x54($s0)

try_move_next_node_proc equ 0x8000B3C8

; -----------------------------------------------------------------------------
.orga 0x000251E8 ; RAM: 0x800349E8
	j 0x8000B0F0 ; getStringEntryOffset
	
.orga 0x00000080
@getStringEntryOffset: ;0x8000B2F0
	lhu     $a2, 0($s3)		; string_index
	lw      $v0, mdt_ptr
	sll     $a1, $a2, 2		; str_ptr_offset = string_index * 4
	lw      $v1, 0($v0)		; mdt_position
	nop
	
	lw      $a0, 0x0C($v1)		; load bit_count
	nop
	addiu	$a0, 4
	addu	$a0, $v1
	addu	$a0, $a2
	lbu		$a0, 0($a0)
	li 		$s5, bit_count
	sb 		$a0, 0($s5) 
	nop
	
	lw      $a0, 0x08($v1)		; load stringEntry position
	nop
	addiu	$a0, 4
	addu	$a0, $v1
	
	lw      $v0, 0x04($v1)		; strings_count
	nop
	j 0x80034A04 ; return

; -----------------------------------------------------------------------------
	
.orga 0x00025270 ; RAM: 0x80034A70
	j 0x8000B1F0 ; getStringPosition
	
.orga 0x00000180
@getStringPosition: ; 0x00000080
	lw      $v0, mdt_ptr
	lhu     $v1, string_ptr_offset
	lw      $v0, 0($v0) ; mdtDataPosition
	nop
	lw		$v0, 0x10($v0)
	nop
	addiu	$v0, 4
	addu    $v0, $v1	; textPtr + stringOffset
	lw      $v1, mdt_ptr
	nop
	lw      $v1, 0($v1) ; mdtDataPosition
	nop
	addu    $v0, $v1
	sw      $v0, string_position
	nop
	
@loadFirstStringByte:
	lbu 	$v1, 0x00($v0)
	lbu		$v0, bit_count
	nop
	
@deleteUnusedBits:
	beqz	$v0, @returnDeleteUnusedBits
	nop
	sll		$v1, 1
	addiu	$v0, -1
	j		0x8000B238 ; deleteUnusedBits
	
@returnDeleteUnusedBits:
	li		$s5, current_byte
	sb		$v1, 0($s5)
	j 0x80034A88 ; return

; -----------------------------------------------------------------------------

.orga 0x000252C0
	j 0x8000B2F0

.orga 0x00000280
@decompressCharacter: ; RAM: 0x00000080
	lbu     $v0, 0x64($s0) ; txtCntxt.lastCharWidth
	lhu     $v1, 0x60($s0) ; txtCntxt.x_position
	lw      $a0, string_position ; txtCntxt.strPosition
	sb      $zero, 0x64($s0) ; txtCntxt.lastCharWidth
	addu    $v1, $v0
	sh      $v1, 0x60($s0) ; txtCntxt.x_position
	
@loadFirstCharacter:
	load_byte s6, bit_count
	li		$s7, 8
	sltu	$s6, $s7
	beqz	$s6, @readNextByte ; if (bit_count > 8) -> readNextByte
	
	load_byte v0, current_byte
	andi	$v1, $v0, 0x80
	sll		$v0, 1
	save_byte v0, current_byte
	
	beq		$v1, 0x80, @readRightNodes
	nop
	
@readLeftNodes:
	read_node_offset mdt_ptr, 0x14, node_offset
	j 		try_move_next_node_proc
	
@readRightNodes:
	read_node_offset mdt_ptr, 0x1C, node_offset
	j		try_move_next_node_proc
	
@tryMoveNextNode:
	load_byte s6, bit_count
	addiu	$s6, 1
	save_byte s6, bit_count

	li		$v0, 0x8000
	sltu	$v1, $v0
	beqz	$v1, @loadFirstCharacter
	
@readCharacter:
	lw      $v0, mdt_ptr
	nop
	lw      $v0, 0($v0) ; mdtDataPosition
	nop
	lw		$v1, 0x24($v0)
	addiu	$s6, $v0, 4
	addu	$s6, $v1
	
	li		$s7, node_offset
	lhu		$s7, 0($s7)
	nop
	addiu	$s7, -0x8000
	addu 	$s6, $s7
	
	lhu		$s1, 0($s6)
	lbu 	$s2, 0($s6)
	
	j       0x80034B24	
	
@readNextByte:
	li		$s5, bit_count
	li		$s6, 8
	sb		$s6, 0($s5)

	lbu 	$v0, string_position
	li		$s5, current_byte
	sb		$v0, 0($s5)
	nop
	j		@loadFirstCharacter

; -----------------------------------------------------------------------------
	
.orga 0x0002542C ; RAM: 0x80034C2C
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	j 0x80034D90
	nop
	
.orga 0x000254B4 ; RAM: 0x80034CB4
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

.orga 0x00025504 ; RAM: 0x80034D04
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

; -----------------------------------------------------------------------------

.Close

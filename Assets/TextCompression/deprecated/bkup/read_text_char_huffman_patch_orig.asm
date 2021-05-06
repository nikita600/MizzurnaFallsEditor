
; MDD file struct
; 0x00 - MDD signature
; 0x04 - Strings Count
; 0x08 - stringsPointerOffset
; 0x0C - bitIndexesOffset
; 0x10 - stringsOffset
; 0x14 - leftNodesOffset
; 0x18 - leftNodesCount
; 0x1C - rightNodesOffset
; 0x20 - rightNodesCount
; 0x24 - charactersOffset
; 0x28 - charactersCount

; free regs: s5, s6, s7

.psx
.Open "!SLPS017.83", "SLPS017.83", 0x8000F800
	
.orga 0x000251E8 ; RAM: 0x800349E8
	j 0x8000B0F0 ; renderTextStart
	
.orga 0x00000080
@renderTextStart: ;0x8000B2F0
	lhu     $a2, 0($s3)		; string_index
	lw      $v0, 8($s3)		; mdt_data_ptr
	sll     $a1, $a2, 2		; str_ptr_offset = string_index * 4
	lw      $v1, 0($v0)		; mdt_position
	lw      $a0, 4($v0)		; mdt_txt_tbl_position (skip this)
	lw      $v0, 4($v1)		; strings_count
	nop
	j 0x80034A04 ; return

.orga 0x00025270 ; RAM: 0x80034A70
	j 0x8000B1F0 ; getTextPosition
	
.orga 0x00000180
@getTextPosition: ; 0x00000080
	lw      $v0, 8($s3) ; mdt_data_ptr
	lhu     $v1, 0($s4) ; stringEntry.Offset
	lw      $v0, 8($v0) ; mdtDataPosition
	nop
	addu    $v0, $v1	; textPtr + stringOffset
	sw      $v0, 0x54($s0) ; txtCntxt.strPosition
	j 0x80034A88 ; return


.orga 0x000252C0
	j 0x8000B2F0

.orga 0x00000280
@decompressCharacter: ; RAM: 0x00000080
	lbu     $v0, 0x64($s0) ; txtCntxt.lastCharWidth
	lhu     $v1, 0x60($s0) ; txtCntxt.x_position
	lw      $a0, 0x54($s0) ; txtCntxt.strPosition
	sb      $zero, 0x64($s0) ; txtCntxt.lastCharWidth
	addu    $v1, $v0
	sh      $v1, 0x60($s0) ; txtCntxt.x_position
	lbu     $s2, 0($a0)      ; loadFirstChar
	nop
	andi    $v0, $s2, 0x80   ; if (firstChar < 0x80)
	beqz    $v0, loc_80034AF8
	sll     $v0, $s2, 8
	lbu     $v1, 1($a0)      ; loadSecondChar
	j       0x80034B24
	or      $s1, $v0, $v1
	
loc_80034AF8:
	lw      $v0, 8($s3)
	nop
	lw      $v1, 0($v0)
	sll     $v0, $s2, 1      ; charIndex * 2
	addiu   $v0, 8           ; add sizeof(mdtHeader)
	addu    $v1, $v0
	lhu     $s1, 0($v1)      ; load char from table
	nop
	srl     $v1, $s1, 8
	sll     $v0, $s1, 8
	or      $s1, $v0, $v1    ; swap bytes
	j 		0x80034B24
	
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
	
.Close

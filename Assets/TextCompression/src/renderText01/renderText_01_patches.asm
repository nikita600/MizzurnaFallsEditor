
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

; -----------------------------------------------------------------------------

; variables memory map
mddContextPtr				equ 0x8000B0F0

@mddContext					equ ($s5)
mddContext.node_offset 		equ 0x00@mddContext
mddContext.current_byte 	equ 0x02@mddContext
mddContext.bit_count 		equ 0x04@mddContext
mddContext.prev_char		equ 0x06@mddContext
mddContext.prev_char_mode	equ 0x08@mddContext

mddContext.mdt_mode			equ 0x34($sp)
mddContext.left_nodes_ptr	equ 0x28($sp)
mddContext.right_nodes_ptr	equ 0x2C($sp)
mddContext.char_nodes_ptr	equ 0x30($sp)

mddContext.reg_s5			equ 0x38($sp)
mddContext.reg_s6			equ 0x3C($sp)
mddContext.reg_s7			equ 0x40($sp)

@reg_s6						equ $s6
@reg_ra						equ 0x24($sp)

; -----------------------------------------------------------------------------

.include "src\renderText01\renderText_01_getStringEntryOffset.asm"
.include "src\renderText01\renderText_01_getStringPosition.asm"
.include "src\renderText01\renderText_01_decompressCharacter.asm"

; -----------------------------------------------------------------------------

.definelabel @loc_80034DE0, 0x80034DE4

Return_01:
	lw      $ra, @reg_ra
	
	lw		$s5, mddContext.reg_s5
	lw		$s6, mddContext.reg_s6
	lw		$s7, mddContext.reg_s7
	j		@loc_80034DE0
	nop

; -----------------------------------------------------------------------------

.definelabel @loc_80034C2C,	0x80034C2C
.definelabel @loc_80034C3C, 0x80034C3C
.definelabel @loc_80034D90, 0x80034D90

AddStringPosition_01: ;0x80034C24
	lhu		@reg_s6, mddContext.mdt_mode
	nop
	bnez	@reg_s6, @add_stringPosition_01_mdt
	nop
	
@add_stringPosition_01_mdd:
	sb		$zero, mddContext.prev_char_mode
	j 		@loc_80034D90
	nop
	
@add_stringPosition_01_mdt:
	beqz    $v0, @inc_01
	nop
	j		@loc_80034C2C
	nop
	
@inc_01:
	j		@loc_80034C3C
	nop
	
; -----------------------------------------------------------------------------

.definelabel @loc_80034CB4, 0x80034CB4
.definelabel @loc_80034CC4, 0x80034CC4
.definelabel @loc_80034CD4, 0x80034CD4

AddStringPosition_02: ;0x80034CAC
	lhu		@reg_s6, mddContext.mdt_mode
	nop
	bnez	@reg_s6, @add_str_pos_2_mdt
	nop
	
@add_str_pos_2_mdd:
	sb		$zero, mddContext.prev_char_mode
	j 		@loc_80034CD4
	nop
	
@add_str_pos_2_mdt:
	beqz    $v0, @inc_02
	nop
	j		@loc_80034CB4
	nop
	
@inc_02:
	j		@loc_80034CC4
	nop

; -----------------------------------------------------------------------------

.definelabel @loc_80034D04, 0x80034D04
.definelabel @loc_80034D14, 0x80034D14
.definelabel @loc_80034D24, 0x80034D24

AddStringPosition_03: ;0x80034CFC
	lhu		@reg_s6, mddContext.mdt_mode
	nop
	bnez	@reg_s6, @add_str_pos_3_mdt
	nop

@add_str_pos_3_mdd:
	sb		$zero, mddContext.prev_char_mode
	j 		@loc_80034D24
	nop

@add_str_pos_3_mdt:
	beqz    $v0, @inc_03
	nop
	j		@loc_80034D04
	nop
	
@inc_03:
	j		@loc_80034D14
	nop

; -----------------------------------------------------------------------------

inventory_setBaseOffset_setup:
	j		@setBaseOffset
	move 	$v1, $s0

inventory_setBaseOffset_update:
	move 	$v1, $s1

@setBaseOffset:
	la		$v0, @inventoryWidths
	addu	$v0, $v1
	lbu		$v0, 0($v0)
	
	li		$v1, 0x130
	subu	$v1, $v0
	srl		$a3, $v1, 1
	
	;li		$a3, 0xA0 ; centerOfScreen
	;subu	$a3, $v0
	jr 		$ra
	nop

@screenSize equ 0x130

@inventoryWidths:
.db 080 ; 00
.db 072 ; 01
.db 064 ; 02
.db 028 ; 03
.db 078 ; 04
.db 044 ; 05
.db 052 ; 06
.db 096 ; 07
.db 084 ; 08
.db 240 ; 09
.db 080 ; 10
.db 240 ; 11
.db 120 ; 12
.db 240 ; 13
.db 080 ; 14
.db 240 ; 15
.db 132 ; 16
.db 240 ; 17
.db 172 ; 18
.db 112 ; 19
.db 240 ; 20
.db 188 ; 21
.db 124 ; 22
.db 240 ; 23
.db 040 ; 24
.db 240 ; 25
.db 164 ; 26
.db 240 ; 27
.db 092 ; 28
.db 120 ; 29
.db 240 ; 30
.db 076 ; 31
.db 240 ; 32
.db 072 ; 33
.db 220 ; 34
.db 072 ; 35
.db 240 ; 36
.db 240 ; 37
.db 240 ; 38
.db 0x00 ; padding


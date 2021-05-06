.psx
.Open "SLPS017.83", 0x8000F800

; CodeSize = 0x6C (108)

.org 0x80034AC0
		lbu     $v0, 0x64($s0)		; load last charWidth
		lhu     $v1, 0x60($s0)		; xPosition
		lw      $a0, 0x54($s0)		; strPosition
		sb      $zero, 0x64($s0)	; clear charWidth
		addu    $v1, $v0			; xPosition += charWidth
		sh      $v1, 0x60($s0)		; save xPosition
		lbu     $s2, 0($a0)			; load firstChar
		nop							;
		andi    $v0, $s2, 0x80		; if (firstChar < 0x80) then read secondChar
		beqz    $v0, 0x80034AF8		;
		sll     $v0, $s2, 8			; firstChar << 8
		lbu     $v1, 1($a0)			; load secondChar
		j       0x80034B24			; skip readCharFromTable
		or      $s1, $v0, $v1		;
		
.org 0x80034AF8 ; read char from mdtTable
		lw      $v0, 8($s3) 		; mdtDataPtr
		nop							;
		lw      $v1, 0($v0)			; load mdtDataPosition
		sll     $v0, $s2, 1			; charIndex * sizeof(char) [0x02]
		addiu   $v0, 8				; charOffset + sizeof(mdtHeader)
		addu    $v1, $v0			; offset = mdtDataPosition + charOffset
		lhu     $s1, 0($v1)			; load char from table
		nop							;
		srl     $v1, $s1, 8			; swap bytes
		sll     $v0, $s1, 8			;
		or      $s1, $v0, $v1		;
		
.org 0x80034B24
		andi    $v1, $s1, 0xF000	;
		li      $v0, 0xA000			;
		
.Close
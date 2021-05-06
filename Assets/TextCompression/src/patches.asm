; -----------------------------------------------------------------------------

; Change Dialogue portrait position
.org 0x80014F8C
	li		$a0, -0x9C ;-0x98
.org 0x80014F9C
	li		$v1, -0x5C ;-0x58

; -----------------------------------------------------------------------------

.org 0x8004EBA4 ; change noteBook portrait offset
	li		$a1, 0x30 ; 0x40
.org 0x8004EA1C ; change noteBook name position
	li		$s0, -0x2A ; -0x20

@noteBookLabelWidth	equ	0x6C

.org 0x8004EE88 ; set notebookLabel width
	li		$v0, @noteBookLabelWidth
.org 0x8004EE90 ; set notebookLabel x0
	li		$v0, -(@noteBookLabelWidth / 2)
.org 0x8004EDC0
	li		$s3, (@noteBookLabelWidth / 2)
.org 0x8004EEA0 ; set notebookCursor.x0
	j		setupNotebookCursor
	nop
; -----------------------------------------------------------------------------	

@enterPhoneNumberLabelWidth	equ 168
@itsRingingLabelWidth		equ 084

; set phoneCtx.actionLabel.w
.org 0x800499B8
	li		$s2, @enterPhoneNumberLabelWidth ; sll		$s2, $s2, 0x04
.org 0x80049E84
	li		$v0, @itsRingingLabelWidth ; li		$v0, 0x70
.org 0x80049FAC
	li		$v0, @itsRingingLabelWidth ; li		$v0, 0x70
	
; -----------------------------------------------------------------------------

; Setup Dialogue TextBox bounds
@bounds.x	equ $a1
@bounds.y	equ $a2
@bounds.w	equ $a3

.org 0x8003D460 ; setupInventoryContext
	li		@bounds.x, -0x98
	li		@bounds.y, 0x28
	jal		0x80035BAC ; setTextContextBoxBound
	li		@bounds.w, 0x130
	
.org 0x80033C58 ; setTextEntry_phoneCall03
	li		@bounds.x, -0x4F
	li		@bounds.y, 0x28
	lhu		$v0, 0x114($s0) ; arrowState
	li		@bounds.w, 0xF0

.org 0x80033B64 ; setTextEntry
	li		@bounds.x, -0x70
	li		@bounds.y, 0x28
	ori		$v0, $v1, 0x21
	sh		$v0, 0x114($s0) ; arrowState
	li		$v0, 0x30
	li		@bounds.w, 0xF0
	
.org 0x80033A9C ; setTextEntry_phoneCall01
	li		@bounds.x, -0x5F;-0x70
	li		@bounds.y, 0x28
	ori		$v0, $v1, 0x21
	sh		$v0, 0x114($s0) ; arrowState
	li		$v0, 0x30
	li		@bounds.w, 0xF0

.org 0x80033930 ; setupGameTextContext
	li		@bounds.x, -0x5F
	li		@bounds.y, 0x28
	li		@bounds.w, 0xF0

.org 0x80033488 ; renderTextProc_phoneCall02
	li		@bounds.x, -0x5F
	li		@bounds.y, 0x28
	li		$v0, 0x30
	li		@bounds.w, 0xF0

; -----------------------------------------------------------------------------

.org 0x8004EAB4
	jal		renderTextNotebookCharacter_00
	nop
	
.org 0x8004EC8C
	jal		renderTextNotebookCharacter_02
	nop
	
.org 0x8004E8C4
	jal		renderTextPhoneNumber_00
	nop
	


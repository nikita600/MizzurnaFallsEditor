;TEXT:8003629C
;TEXT:80036350  ; End of function renderTextSub01_01

; -----------------------------------------------------------------------------

@textContext						equ ($a3)
@textContext.xOffsetDefault			equ 0x48@textContext
@textContext.yOffsetDefault			equ 0x4A@textContext
@textContext.pixelCharOffsetX		equ 0x58@textContext
@textContext.field_80				equ 0x80@textContext
@textContext.field_82				equ 0x82@textContext
@textContext.field_86				equ 0x86@textContext
@textContext.charHeightDefault		equ 0x91@textContext

; -----------------------------------------------------------------------------

renderText_clampPosition:
                move    $a3, $a0
                andi    $a1, 0xFFFF
                lhu     $a0, @textContext.xOffsetDefault
                li      $v0, 0x40  ; '@'
                subu    $v0, $a0
                slt     $a1, $v0
                bnez    $a1, @return
                nop
                lbu     $v0, @textContext.pixelCharOffsetX
                lhu     $v1, @textContext.field_86
                addiu   $v0, 1
                slt     $v0, $v1
                beqz    $v0, loc_8003630C
                sltiu   $v0, $a0, 0x40
                bnez    $v0, loc_800362F4
                andi    $v1, $a2, 0xFF
                lbu     $v0, @textContext.pixelCharOffsetX
                addiu   $v1, $a0, -0x40
                sh      $v1, @textContext.xOffsetDefault

loc_800362E8:
                addiu   $v0, 1
                jr      $ra
                sb      $v0, @textContext.pixelCharOffsetX

loc_800362F4:
                li      $v0, 1
                bne     $v1, $v0, @return
                nop
                lbu     $v0, @textContext.pixelCharOffsetX
                j       loc_800362E8
                sh      $zero, @textContext.xOffsetDefault

loc_8003630C:
                lbu     $v1, @textContext.charHeightDefault
                lhu     $v0, @textContext.yOffsetDefault
                lhu     $a0, @textContext.field_82
                addu    $v0, $v1
                lbu     $v1, @textContext.charHeightDefault
                sb      $zero, @textContext.pixelCharOffsetX
                sh      $zero, @textContext.xOffsetDefault
                sh      $v0, @textContext.yOffsetDefault
                andi    $v0, 0xFFFF
                addu    $v0, $v1
                slt     $v0, $a0
                bnez    $v0, @return
                nop
                lhu     $v0, @textContext.field_80
                nop
                sh      $v0, @textContext.yOffsetDefault

@return:
                jr      $ra
                nop
				
; -----------------------------------------------------------------------------
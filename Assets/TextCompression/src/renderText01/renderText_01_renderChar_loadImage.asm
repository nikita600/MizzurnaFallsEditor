;TEXT:80036354
;TEXT:800363D8  ; End of function renderTextSub01_03

; -----------------------------------------------------------------------------

@stack_size							equ 0x20
@var_10								equ @stack_size+-0x10
@var_E 								equ @stack_size+-0xE
@var_C 								equ @stack_size+-0xC
@var_A 								equ @stack_size+-0xA
@reg_ra 							equ @stack_size+-8

@textContext						equ ($a3)
@textContext.xOffsetDefault			equ 0x48@textContext
@textContext.yOffsetDefault			equ 0x4A@textContext
@textContext.pixelCharOffsetX		equ 0x58@textContext
@textContext.texturePageX			equ 0x84@textContext
@textContext.charWidthDefault		equ 0x90@textContext
@textContext.charHeightDefault		equ 0x91@textContext

; -----------------------------------------------------------------------------

renderText_loadImage:
                addiu   $sp, -@stack_size
                move    $a3, $a0
                sw      $ra, @reg_ra($sp)
                
				lbu     $v1, @textContext.pixelCharOffsetX
				lhu     $v0, @textContext.texturePageX
                lhu     $a0, @textContext.xOffsetDefault
                addu    $v0, $v1
                andi    $v0, 0xFFFF
                andi    $v1, $v0, 0xF
                sll     $v1, 6
                addu    $a0, $v1
                srl     $v0, 4
                sh      $a0, @var_10($sp)
                lhu     $v1, @textContext.yOffsetDefault
                sll     $v0, 8
                addu    $v1, $v0
                sh      $v1, @var_E($sp)
				
			.ifdef USE_VWF
				jal		renderText_loadImage_patchCharWidth
				nop
			.else
				lbu     $v0, @textContext.charWidthDefault
                andi    $a2, 0xFF
			.endif
				
                mult    $v0, $a2
                mflo    $v0
                bgez    $v0, loc_800363B4
                nop
                addiu   $v0, 3

loc_800363B4:
                sra     $v0, 2
                sh      $v0, @var_C($sp)
                lbu     $v0, @textContext.charHeightDefault
                addiu   $a0, $sp, @var_10
                jal     LoadImage
                sh      $v0, @var_A($sp)
                lw      $ra, @reg_ra($sp)
                nop
                jr      $ra
                addiu   $sp, @stack_size

; -----------------------------------------------------------------------------
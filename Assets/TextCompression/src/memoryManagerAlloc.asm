;TEXT:8004FC68
;TEXT:8004FD8C

@stack_size		equ 0x18
@var_ra			equ -0x08

mm_alloc_NG_Code:
                addiu   $sp, -@stack_size
                lui     $v0, 0x8010
                addiu   $v1, $v0, -0x7d60
                addiu   $a0, 0x03
                li      $v0, 0xFFFFFFFC
                and     $a0, $v0
                sltiu   $v0, $a0, 0x04
                sw      $ra, @stack_size+@var_ra($sp)
                lw      $a1, 0x0C($v1)
                beqz    $v0, loc_8004FC98
                nop
                li      $a0, 0x04

loc_8004FC98:
                beq     $a1, $v1, loc_8004FD60
                addiu   $a2, $a0, 0x0C
                addiu   $a3, $a0, 0x1C
                li      $t1, 0xFF
                move    $t0, $v1

loc_8004FCAC:
                lw      $v0, 4($a1)
                nop
                subu    $v1, $v0, $a1
                sltu    $v0, $v1, $a2
                bnez    $v0, loc_8004FD40
                sltu    $v0, $v1, $a3
                bnez    $v0, loc_8004FD18
                addu    $v1, $a1, $a0
                sw      $a1, 0x0C($v1)
                lw      $v0, 0x04($a1)
                addiu   $v1, 0x0C
                sw      $v0, 0x04($v1)
                lw      $v0, 0x08($a1)
                nop
                sw      $v0, 0x08($v1)
                lw      $v0, 0xC($a1)
                sb      $zero, 0x03($v1)
                sw      $v0, 0xC($v1)
                lw      $v0, 0x04($a1)
                nop
                sw      $v1, 0x00($v0)
                lw      $v0, 0x08($a1)
                sw      $v1, 0x04($a1)
                sw      $v1, 0x0C($v0)
                lw      $v0, 0x0C($a1)
                j       loc_8004FD38
                sw      $v1, 0x08($v0)
 ; ---------------------------------------------------------------------------

loc_8004FD18:
                lw      $v1, 0x08($a1)
                lw      $v0, 0x0C($a1)
                nop
                sw      $v0, 0x0C($v1)
                lw      $v1, 0x0C($a1)
                lw      $v0, 0x08($a1)
                nop
                sw      $v0, 0x08($v1)

loc_8004FD38:
                j       loc_8004FD50
                sb      $t1, 0x03($a1)
 ; ---------------------------------------------------------------------------

loc_8004FD40:
                lw      $a1, 0x0C($a1)
                nop
                bne     $a1, $t0, loc_8004FCAC
                nop

loc_8004FD50:
                ;la      $v0, dword_800F82A0
                lui     $v0, 0x8010
                addiu   $v0, $v0, -0x7d60
                bne     $a1, $v0, loc_8004FD7C
                addiu   $v0, $a1, 0x0C

loc_8004FD60:
                jal     sub_8004FFFC
                nop
				
				;la      $a0, aMm_allocDNg  ; "mm_alloc %d NG!!"
				lui     $a0, 0x8001
				addiu   $a0, $a0, 0x351c
                
                jal     printf
                move    $a1, $v0
                move    $v0, $zero

loc_8004FD7C:

			.ifdef LOG_MEM_MGR
				jal 	print_mem_manager_debug_info
				nop
			.else
				lw      $ra, @stack_size+@var_ra($sp)
                nop
			.endif
				
                jr      $ra
                addiu   $sp, @stack_size
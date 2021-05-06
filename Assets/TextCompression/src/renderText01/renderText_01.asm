.definelabel renderChar_80034e00, 	0x80034E00
.definelabel newLine_80035ac0, 	0x80035ABC

@textContext 					equ ($s0)
@textContext.field_50			equ 0x50@textContext
@textContext.stringPosition		equ 0x54@textContext
@textContext.field_5E			equ 0x5E@textContext
@textContext.field_5C			equ 0x5C@textContext
@textContext.field_60			equ 0x60@textContext
@textContext.field_62			equ 0x62@textContext
@textContext.field_64			equ 0x64@textContext
@textContext.field_68			equ 0x68@textContext
@textContext.field_6C			equ 0x6C@textContext
@textContext.field_70			equ 0x70@textContext
@textContext.field_78			equ 0x78@textContext
@textContext.field_8A			equ 0x8A@textContext
@textContext.field_8C			equ 0x8C@textContext
@textContext.field_8E			equ 0x8E@textContext
@textContext.field_94			equ 0x94@textContext
@textContext.field_96			equ 0x96@textContext
@textContext.field_A0			equ 0xA0@textContext
@textContext.field_B0			equ 0xB0@textContext

@textEntry 					equ ($s3)
@textEntry.stringIndex 		equ 0x00@textEntry
@textEntry.field_2 			equ 0x02@textEntry
@textEntry.field_4 			equ 0x04@textEntry
@textEntry.field_6 			equ 0x06@textEntry
@textEntry.mdtFilePtr 		equ 0x08@textEntry

@stack_size		equ 0x44 ;0x28

@reg_s0			equ 0x10($sp)
@reg_s1			equ 0x14($sp)
@reg_s2			equ 0x18($sp)
@reg_s3			equ 0x1C($sp)
@reg_s4			equ 0x20($sp)
@reg_ra			equ 0x24($sp)

; ROM: 0x000251C4
; RAM: 0x800349C4
@renderText01_800349C4:
                addiu   $sp, -@stack_size
                sw      $s0, @reg_s0
                move    $s0, $a0
                sw      $s3, @reg_s3
                move    $s3, $a1
                sw      $ra, @reg_ra
                sw      $s4, @reg_s4
                sw      $s2, @reg_s2
                sw      $s1, @reg_s1
				
			.ifdef USE_MDD ; 800349E8
				j		GetTextEntryOffset
			.else
				lhu     $a2, @textEntry.stringIndex
			.endif
                
@start_mdt_read:
                lw      $v0, @textEntry.mdtFilePtr
                sll     $a1, $a2, 2
                lw      $v1, 0($v0)
                lw      $a0, 4($v0)
                lw      $v0, 4($v1)
                nop
				
@check_string_index:
                sltu    $v0, $a2
                beqz    $v0, @loc_80034A18
                addu    $s4, $a0, $a1
                j       @loc_80034DE0
                move    $v0, $zero
 ; ---------------------------------------------------------------------------

@loc_80034A18:
                lhu     $v0, @textEntry.field_6
                nop
                andi    $v0, 2
                beqz    $v0, @loc_80034A58
                nop
                lhu     $v0, @textEntry.field_2
                sh      $zero, @textContext.field_60
                sh      $v0, @textContext.field_5C
                lhu     $v0, @textEntry.field_4
                sh      $zero, @textContext.field_62
                sh      $v0, @textContext.field_5E
                lhu     $v0, @textEntry.field_6
                nop
                andi    $v0, 0xFFFD
                j       @loc_80034A60
                sh      $v0, @textEntry.field_6
 ; ---------------------------------------------------------------------------

@loc_80034A58:
                sh      $zero, @textContext.field_5E
                sh      $zero, @textContext.field_5C

@loc_80034A60:
                lhu     $v0, @textContext.field_50
                nop
                bnez    $v0, @loc_80034A88
                sw      $zero, @textContext.field_6C
				
			.ifdef USE_MDD ; 80034A70
				j		GetStringPosition
            .else
				lw      $v0, @textEntry.mdtFilePtr
			.endif

@load_mdt_offset:
                lhu     $v1, 0($s4)
                lw      $v0, 8($v0)
                nop
                addu    $v0, $v1
                sw      $v0, @textContext.stringPosition

@setup_mdt_render:
@loc_80034A88:
                lh      $v0, @textContext.field_8A
                lw      $v1, @textContext.field_68
                lh      $a0, @textContext.field_8C
                addu    $v1, $v0
                sw      $v1, @textContext.field_68
                slt     $v1, $a0
                bnez    $v1, @loc_80034DA8
                nop

@loc_80034AA8:
                lhu     $v0, @textContext.field_50
                lhu     $v1, 2($s4)
                nop
                sltu    $v0, $v1
                beqz    $v0, @loc_80034DD8
                move    $v0, $zero
				
@prepare_mdt_render:
				lbu     $v0, @textContext.field_64
                lhu     $v1, @textContext.field_60
                lw      $a0, @textContext.stringPosition
                sb      $zero, @textContext.field_64
                addu    $v1, $v0
                sh      $v1, @textContext.field_60

@read_character:

			.ifdef USE_MDD ; 80034AC0
				j		DecompressCharacterMDD
				nop
			.else
                lbu     $s2, 0($a0)
				nop
			.endif
			
@continue_read_character:
                andi    $v0, $s2, 0x80
                beqz    $v0, @loc_80034AF8
                sll     $v0, $s2, 8
                lbu     $v1, 1($a0)
                j       @loc_80034B24
                or      $s1, $v0, $v1
 ; ---------------------------------------------------------------------------

@loc_80034AF8:
                lw      $v0, @textEntry.mdtFilePtr
                nop
                lw      $v1, 0($v0)
                sll     $v0, $s2, 1
                addiu   $v0, 8
                addu    $v1, $v0
                lhu     $s1, 0($v1)
                nop
                srl     $v1, $s1, 8
                sll     $v0, $s1, 8
                or      $s1, $v0, $v1

@handle_character:
@loc_80034B24:
				andi    $v1, $s1, 0xF000
                li      $v0, 0xA000
                bne     $v1, $v0, @loc_80034B3C
                andi    $v1, $s1, 0xFF00
                addiu   $s1, 0x6000
                andi    $v1, $s1, 0xFF00

@loc_80034B3C:
                li      $v0, 0xFF00
                beq     $v1, $v0, @loc_80034C50
                nop
                lw      $v0, @textContext.field_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, @loc_80034BA0
                nop
                lhu     $v0, @textContext.field_5C
                lhu     $v1, @textContext.field_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, @textContext.field_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, @loc_80034BA0
                nop
                lhu     $v0, @textContext.field_70
                nop
                andi    $v0, 0x20
                bnez    $v0, @loc_80034BA0
                nop
                jal     newLine_80035ac0
                move    $a0, $s0

@loc_80034BA0:
                lhu     $v1, @textContext.field_70
                nop
                andi    $v0, $v1, 0xFFDF
                andi    $v1, 2
                bnez    $v1, @loc_80034DC8
                sh      $v0, @textContext.field_70
                lhu     $v0, @textContext.field_8E
                nop
                andi    $v0, 1
                beqz    $v0, @loc_80034BF8
                nop
                lhu     $v1, @textContext.field_94
                lhu     $v0, @textContext.field_96
                nop
                mult    $v1, $v0
                lw      $v0, @textContext.field_6C
                nop
                addu    $v0, $v1
                mflo    $a3
                sltu    $v0, $a3, $v0
                bnez    $v0, @loc_80034DC8
                nop

@loc_80034BF8:
                move    $a0, $s0
                andi    $a1, $s1, 0xFFFF
                jal     renderChar_80034e00
                move    $a2, $zero
                lh      $a0, @textContext.field_8C
                lw      $v0, @textContext.field_68
                lhu     $v1, @textContext.field_50
                subu    $v0, $a0
                addiu   $v1, 1
                sw      $v0, @textContext.field_68
                andi    $v0, $s2, 0x80
				
			.ifdef USE_MDD ;80034C24
				j		AddStringPosition_01
				sh      $v1, @textContext.field_50
			.else
                beqz    $v0, @loc_80034C3C
				sh      $v1, @textContext.field_50
			.endif
				
@loc_80034C2C:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                sw      $v0, @textContext.stringPosition

@loc_80034C3C:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                j       @loc_80034D90
                sw      $v0, @textContext.stringPosition
 ; ---------------------------------------------------------------------------

@loc_80034C50:
                lw      $v0, @textContext.field_A0
                nop
                beqz    $v0, @loc_80034CE8
                move    $a0, $s0
                jalr    $v0
                andi    $a1, $s1, 0xFFFF
                move    $a0, $v0
                andi    $v0, $a0, 2
                beqz    $v0, @loc_80034C90
                andi    $v0, $a0, 1
                lh      $v1, @textContext.field_8C
                lw      $v0, @textContext.field_68
                nop
                subu    $v0, $v1
                sw      $v0, @textContext.field_68
                andi    $v0, $a0, 1

@loc_80034C90:
                beqz    $v0, @loc_80034CD8
                andi    $v0, $a0, 4
                lhu     $v0, @textContext.field_50
                nop
                addiu   $v0, 1
                sh      $v0, @textContext.field_50
                andi    $v0, $s2, 0x80
				
			.ifdef USE_MDD ; 80034CAC
				j		AddStringPosition_02
				nop
			.else
                beqz    $v0, @loc_80034CC4
				nop
			.endif
				
@loc_80034CB4:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                sw      $v0, @textContext.stringPosition

@loc_80034CC4:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                sw      $v0, @textContext.stringPosition
				
@loc_80034CD4:
                andi    $v0, $a0, 4

@loc_80034CD8:
                beqz    $v0, @loc_80034D24
                nop
                j       @loc_80034DCC
                sw      $zero, @textContext.field_68
 ; ---------------------------------------------------------------------------

@loc_80034CE8:
                lhu     $v0, @textContext.field_50
                nop
                addiu   $v0, 1
                sh      $v0, @textContext.field_50
                andi    $v0, $s2, 0x80
				
			.ifdef USE_MDD ; 80034CFC
				j		AddStringPosition_03
				nop
			.else	
                beqz    $v0, @loc_80034D14
				nop
            .endif

@loc_80034D04:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                sw      $v0, @textContext.stringPosition

@loc_80034D14:
                lw      $v0, @textContext.stringPosition
                nop
                addiu   $v0, 1
                sw      $v0, @textContext.stringPosition

@loc_80034D24:
                lw      $v0, @textContext.field_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, @loc_80034D7C
                nop
                lhu     $v0, @textContext.field_5C
                lhu     $v1, @textContext.field_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, @textContext.field_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, @loc_80034D7C
                nop
                lhu     $v0, @textContext.field_70
                nop
                andi    $v0, 0x20
                bnez    $v0, @loc_80034D7C
                nop
                jal     newLine_80035ac0
                move    $a0, $s0

@loc_80034D7C:
                lhu     $v0, @textContext.field_70
                nop
                andi    $v0, 0xA
                bnez    $v0, @loc_80034DC8
                nop

@loc_80034D90:
                lh      $v1, @textContext.field_8C
                lw      $v0, @textContext.field_68
                nop
                slt     $v0, $v1
                beqz    $v0, @loc_80034AA8
                nop

@loc_80034DA8:
                lhu     $v0, @textContext.field_50
                lhu     $v1, 2($s4)
                nop
                sltu    $v0, $v1
                beqz    $v0, @loc_80034DD4
                li      $v0, 0xFFFFFFFF
                j       @loc_80034DE0
                nop
 ; ---------------------------------------------------------------------------

@loc_80034DC8:
                sw      $zero, @textContext.field_68

@loc_80034DCC:
                j       @loc_80034DE0
                li      $v0, 0xFFFFFFFF
 ; ---------------------------------------------------------------------------

@loc_80034DD4:
                move    $v0, $zero

@loc_80034DD8:
                sh      $zero, @textContext.field_50
                sw      $zero, @textContext.stringPosition

@loc_80034DE0:

			.ifdef USE_MDD
				j		Return_01
			.else	
                lw      $ra, @reg_ra
            .endif
			
                lw      $s4, @reg_s4
                lw      $s3, @reg_s3
                lw      $s2, @reg_s2
                lw      $s1, @reg_s1
                lw      $s0, @reg_s0
                jr      $ra
                addiu   $sp, @stack_size
; TEXT:80034DFC
; End of function renderText01_800349C4
; ---------------------------------------------------------------------------
sub_80035ABC:
                move    $a1, $a0
                lbu     $v1, 0x93($a1)
                lhu     $v0, 0x62($a1)
                lh      $a0, 0x7A($a1)
                sb      $zero, 0x64($a1)
                sh      $zero, 0x60($a1)
                addu    $v0, $v1
                sh      $v0, 0x62($a1)
                sll     $v0, 16
                lh      $v1, 0x5E($a1)
                sra     $v0, 16
                addu    $v1, $v0
                slt     $v1, $a0
                bnez    $v1, locret_80035B14
                nop
                lhu     $v0, 0x70($a1)
                lbu     $a0, 0x93($a1)
                lhu     $v1, 0x62($a1)
                ori     $v0, 2
                subu    $v1, $a0
                sh      $v0, 0x70($a1)
                sh      $v1, 0x62($a1)

locret_80035B14:
                jr      $ra
                nop
; ---------------------------------------------------------------------------

loc_80034B3C:
                li      $v0, 0xFF00
                beq     $v1, $v0, loc_80034C50 ; if (v1 == 0xFF00) ctrlChar
                nop
                lw      $v0, unknown_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, loc_80034BA0
                nop
                lhu     $v0, unknown_5C
                lhu     $v1, unknown_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, unknown_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, loc_80034BA0
                nop
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0x20
                bnez    $v0, loc_80034BA0
                nop
                jal     0x80035ABC
                move    $a0, $s0
loc_80034BA0:
                lhu     $v1, unknown_70
                nop
                andi    $v0, $v1, 0xFFDF
                andi    $v1, 2
                bnez    $v1, loc_80034DC8
                sh      $v0, unknown_70
                lhu     $v0, unknown_8E
                nop
                andi    $v0, 1
                beqz    $v0, loc_80034BF8
                nop
                lhu     $v1, unknown_94
                lhu     $v0, unknown_96
                nop
                mult    $v1, $v0
                lw      $v0, unknown_6C
                nop
                addu    $v0, $v1
                mflo    $a3
                sltu    $v0, $a3, $v0
                bnez    $v0, loc_80034DC8
                nop				
				
				
loc_80034D24:
                lw      $v0, unknown_B0
                nop
                andi    $v0, 0x40
                bnez    $v0, loc_80034D7C
                nop
                lhu     $v0, unknown_5C
                lhu     $v1, unknown_60
                nop
                addu    $v0, $v1
                sll     $v0, 16
                lh      $v1, unknown_78
                sra     $v0, 16
                slt     $v0, $v1
                bnez    $v0, loc_80034D7C
                nop
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0x20
                bnez    $v0, loc_80034D7C
                nop
                jal     0x80035ABC
                move    $a0, $s0
loc_80034D7C:
                lhu     $v0, unknown_70
                nop
                andi    $v0, 0xA
                bnez    $v0, loc_80034DC8
                nop
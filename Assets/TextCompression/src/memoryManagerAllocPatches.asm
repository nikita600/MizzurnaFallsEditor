@stack_size		equ 0x1C
@var_v0			equ -0x08
@var_a0			equ -0x0C

print_mem_manager_debug_info:
	
	lw      $a3, 0x10($sp)
	
	addiu   $sp, -@stack_size
	sw      $v0, @stack_size+@var_v0($sp)
	sw		$a0, @stack_size+@var_a0($sp)

	
	move	$a2, $a0
	la 		$a0, alloc_fmt
	jal     printf
    move    $a1, $v0
	
	lw		$v0, @stack_size+@var_v0($sp)
	lw		$a0, @stack_size+@var_a0($sp)
	addiu	$sp, @stack_size
	
	lw      $ra, 0x10($sp)
	nop
	jr 		$ra
	addiu   $sp, 0x18
	

alloc_fmt:
	.ascii  "ALLOC: %x, SZ: %x, ra: %x", 0x0A
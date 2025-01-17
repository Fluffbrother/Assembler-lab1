.data
	string_print: .asciiz "Size: %d\n"
.text
	.globl merge_sort
merge_sort:
	subu $sp, $sp, 16
	
	# 0($sp): vec
	# 4($sp): size
	# 8($sp): half
	# 12($sp): ra

	sw $a0, 0($sp) # vec
	sw $a1, 4($sp) # size
	 # Save half
	div $t0, $a1, 2
	sw $t0, 8($sp) # half
	sw $ra, 12($sp) # ra
	
	ble $a1, 1, end
	
	# First call
	lw $a0, 0($sp)
	lw $a1, 8($sp)
	jal merge_sort


	# Second call
	lw $t0, 8($sp) # load half again
	# New array pointer
	lw $a0, 0($sp)
	mul $t1, $t0, 4
	add $a0, $a0, $t1
	# New size
	lw $a1, 4($sp) # load antal again
	sub $a1, $a1, $t0
	jal merge_sort
	

	# Merge
	lw $a0, 0($sp)
	lw $a1, 4($sp)
	jal merge

end:

	lw $ra, 12($sp)

	addu $sp, $sp, 16

	jr $ra
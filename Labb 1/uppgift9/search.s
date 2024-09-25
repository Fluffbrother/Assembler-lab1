	.globl search
search:
	sw $a0, 0($sp) # vec
	sw $a1, 4($sp) # Size
	sw $a2, 8($sp) # Needle

	# $a0: vec
	# $a1: size
	# $a2: needle
	# $t1: found bool
	# $t2: index
	# $v0: pos

	li $t1, 0
	li $t2, 0
	li $v0, -1

loop:
	beq $t1, 1, end
	bge $t2, 9, end

	# get pos: $t4, content: $t5
	lw $t5, ($a0)
	# move to next block
	addi $a0, $a0, 4
	# i++
	add $t2, $t2, 1

	# Compare
	bne $a2, $t5, loop
	# Found!
	li $t1, 1
	# Set the pos return value
	move $v0, $t2

	j loop

end:
	jr $ra
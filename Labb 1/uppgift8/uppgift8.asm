.data
	vec: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
	start_str: .asciiz "Enter the number you are searching for: \n"
	found_str: .asciiz "The position of the number is %d.\n"
	missing_str: .asciiz "The number is missing.\n"

.text
	# $t0: needle
	# $t1: found bool
	# $t2: index
	# $t3: pos

	# calloc
	subu $sp, $sp, 16

	# Printy printy
	la $a0, start_str
	jal print

	# Scanf
	li $v0, 5
	syscall
	move $t0, $v0

	li $t1, 0
	li $t2, 0
	li $t3, -1

loop:
	beq $t1, 1, loop_end
	bge $t2, 9, loop_end

	# get pos: $t4, content: $t5
	sll $t4, $t2, 2
	lw $t5, vec($t4)

	# i++
	add $t2, $t2, 1

	bne $t0, $t5, loop
	li $t1, 1
	move $t3, $t2

	j loop

loop_end:

	# Found or not condition
	bne $t1, 1, missing
	# Found
	la $a0, found_str
	move $a1, $t3
	jal print
	
	j end

missing:
	la $a0, missing_str
	jal print

end:
	# Free
	addu $sp, $sp, 16

	# Exit
	li $v0, 10
	syscall
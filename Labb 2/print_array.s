.data
	string_nl: .asciiz "\n"
	string_print: .asciiz "%d "

.text
	.globl print_array
print_array:
	subu $sp, $sp, 8

	sw $a0, 0($sp) # vec
	sw $a1, 4($sp) # antal
	sw $ra, 8($sp) # ra

	# $s0: vec
	# $s1: antal
	# $s2: i

	move $s0, $a0
	move $s1, $a1
	li $s2, 0
	move $s3, $ra

	subu $sp, $sp, 16

	la $a0, string_nl
	jal print

loop:
	bge $s2, $s1, end

	la $a0, string_print
	lw $a1, ($s0)
	jal print

	# move to next block
	addi $s0, $s0, 4
	addi $s2, $s2, 1

	j loop

end:
	la $a0, string_nl
	jal print
	
	addu $sp, $sp, 16

	lw $ra, 8($sp)
	addu $sp, $sp, 8

	jr $ra

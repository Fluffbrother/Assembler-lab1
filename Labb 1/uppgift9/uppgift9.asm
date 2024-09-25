.data
	vec: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
	start_str: .asciiz "Enter the number you are searching for: \n"
	found_str: .asciiz "The position of the number is %d.\n"
	missing_str: .asciiz "The number is missing.\n"

.text
	# calloc
	subu $sp, $sp, 16

	# Printy printy
	la $a0, start_str
	jal print

	# Scanf
	li $v0, 5
	syscall
	move $t0, $v0

	# Call subroutine
	la $a0, vec
	li $a1, 9
	move $a2, $t0
	jal search
	# Position
	move $t0, $v0


	# Found or not condition
	blt $t0, 0, missing
# Found
	la $a0, found_str
	move $a1, $t0
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

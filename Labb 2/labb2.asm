.data
	vec: .word 4, 5, 2, 2, 1, 6, 7, 9, 5, 10
	antal: .word 10

.text
	.globl main
main:
	la $a0, vec
	lw $a1, antal
	jal print_array

	la $a0, vec
	lw $a1, antal
	jal merge_sort

	la $a0, vec
	lw $a1, antal
	jal print_array

	# Exit
	li $v0, 10
	syscall

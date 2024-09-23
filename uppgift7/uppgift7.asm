.data
	max_size: .word 2147483647 # Max size
	min_size: .word -2147483648 # Min size
	n: .word 10
	start_str: .asciiz "Mata in 10 heltal\n"
	end_str: .asciiz "Min: %d, Max: %d\n"

.text
	la $t0, max_size # MIN
	la $t1, min_size # MAX

	subu $sp, $sp, 4
	la $a0, start_str
	jal print
	addu $sp, $sp, 4

	# in-matning
	li $t2, 0
	lw $t3, n
loop:
	addi $t2, $t2, 1
	bgt $t2, $t3, exit

	# read data
	li $v0, 5
	syscall

	# cmp
	# Min
	blt $v0, $t0, new_min
	j max # skip setting the new value
new_min:
	move $t0, $v0

	# Max
max:
	bgt $v0, $t1, new_max
	j loop # skip setting the new value
new_max:
	move $t1, $v0
	j loop

exit:
	subu $sp, $sp, 12
	la $a0, end_str
	move $a1, $t0
	move $a2, $t1
	jal print
	addu $sp, $sp, 12

	li $v0, 10
	syscall

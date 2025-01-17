	.globl merge
merge:
	subu $sp, $sp, 16

	sw $ra, 0($sp) # ra
	sw $a0, 4($sp) # a
	sw $a1, 8($sp) # size


	# 0($sp): ra
	# 4($sp): vec
	# 8($sp): size
	#
	# a0: a[size]
	# a1: size
	# t0: half
	# t1: i
	# t2: j
	# t3: k
	# $sp: b[size]
	# Everything else is fair game!


	# Init half
	div $t0, $a1, 2

	# Init array on stack
	mul $t7, $a1, 4
	subu $sp, $sp, $t7 # b[size]

	# Initialize copy values of a into b (within size range)
	li $t1, 0
	move $t5, $sp # $t5: b
	move $t6, $a0 # $t6: a
clone_loop:
	bge $t1, $a1, exit_clone_loop

	lw $t7, ($t6)
	sw $t7, ($t5)
	
	addi $t5, $t5, 4 # Get the address of b[i]
	addi $t6, $t6, 4 # Get the address of a[i]
	addi $t1, $t1, 1

	j clone_loop
exit_clone_loop:

	# Init integers
	li $t1, 0 # i
	move $t2, $t0 # j
	li $t3, 0 # k


while_loop_1:
bge $t1, $t0, exit_while_loop_1
bge $t2, $a1, exit_while_loop_1

	# $t4 being specific index * 4 to get the new pointer position
	mul $t4, $t1, 4
	add $t5, $sp, $t4 # b[i] address

	mul $t4, $t3, 4
	add $t6, $a0, $t4 # a[k] address

	mul $t4, $t2, 4
	add $t7, $sp, $t4 # b[j] address

	lw $t8, ($t5) # b[i] value
	lw $t9, ($t7) # b[j] value
	bgt $t8, $t9, while_loop_1_else
		sw $t8, ($t6) # a[k] = b[i]
		addi $t1, $t1, 1 # i++
		j while_loop_1_iter_end
	while_loop_1_else:
		sw $t9, ($t6) # a[k] = b[j]
		addi $t2, $t2, 1 # j++

while_loop_1_iter_end:
	addi $t3, $t3, 1 # k++
	j while_loop_1
exit_while_loop_1:


while_loop_2:
bge $t1, $t0, exit_while_loop_2
	mul $t4, $t3, 4
	add $t6, $a0, $t4 # a[k] address

	mul $t4, $t1, 4
	add $t5, $sp, $t4 # b[i] address
	lw $t8, ($t5) # b[i] value
	
	sw $t8, ($t6) # a[k] = b[i]

	addi $t1, $t1, 1 # i++
	addi $t3, $t3, 1 # k++
	j while_loop_2
exit_while_loop_2:

while_loop_3:
bge $t2, $a1, exit_while_loop_3
	mul $t4, $t3, 4
	add $t6, $a0, $t4 # a[k] address

	mul $t4, $t2, 4
	add $t7, $sp, $t4 # b[j] address
	lw $t9, ($t7) # b[j] value

	sw $t9, ($t6) # a[k] = b[j]

	addi $t2, $t2, 1 # j++
	addi $t3, $t3, 1 # k++
	j while_loop_3
exit_while_loop_3:

# clean up
	mul $t7, $a1, 4
	addu $sp, $sp, $t7

	lw $ra, 0($sp)
	addu $sp, $sp, 16

	jr $ra
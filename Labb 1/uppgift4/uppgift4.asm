.data
	yes: .asciiz "yes\n"
	no: .asciiz "no\n"

.text
	# indata
	li $v0, 5
	syscall
	move $t0, $v0

	# modulo 400
	li $t1, 400
	div $t0, $t1
	mfhi $t1
	beq $t1, 0, result_yes
	
	# modulo 4
	li $t1, 4
	div $t0, $t1
	mfhi $t1
	beq $t1, 0, maybe
	
	j result_no

maybe:
	# Modulo 100
	li $t1, 100
	div $t0, $t1
	mfhi $t1
	bne $t1, 0, result_yes
	
	j result_no

result_yes:
	la $a0 yes
	jal print
	j exit

result_no:
	la $a0 no
	jal print
	j exit

exit:
	# Exit
	li $v0, 10
	syscall
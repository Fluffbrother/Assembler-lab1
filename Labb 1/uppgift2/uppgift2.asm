    .data
str1: .asciiz "Even"
str2: .asciiz "Odd"

    .text
    .globl main
main: 
    subu $sp,$sp, 16
    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2
    div $t0, $t1
    mfhi $t1
    beq $t1, 0, result_even

    j result_odd

result_even:
    la $a0, str1
	jal print
	j exit

result_odd:
    la $a0, str2
	jal print
	j exit

exit: 
    addu $sp, $sp, 16
    li $v0, 10
	syscall
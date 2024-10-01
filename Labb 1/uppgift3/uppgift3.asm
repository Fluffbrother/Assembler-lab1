    .data
str: .asciiz "%d\n"
low: .word 30
high: .word 50
threshold: .word 204000

    .text
    .globl main
main: 
    subu $sp, $sp, 16
    li $v0, 5
    syscall
    move $t0, $v0

    lw $t1, low
    lw $t2, high
    lw $t3, threshold
    addi $t4, $zero, 0

    bgt $t0, $t3, else
    mult $t4, $t0, $t1
    div $t4, $t4, 100
    sub $t4, $t0, $t4

    la $a0, str
    move $a1, $t4
    jal print
    j exit

else: 
    sub $t4, t0, $t3
    mult $t4, $t4, $t2
    div $t4, $t4, 100

exit:
    addu $sp, $sp, 16
    li $v0, 10
	syscall

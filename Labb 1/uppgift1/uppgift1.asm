    .data
MIN_IN: .byte 'b'
MAX_IN: .byte 'y'
str: .asciiz "\n%c %c" 

    .text
    .globl main
main: 
    subu $sp,$sp, 16
    li $v0, 12
    syscall
    move $t0, $v0

    lb $t1, MIN_IN
    lb $t2, MAX_IN

    blt $t0, $t1, error
    bgt $t0, $t2, error
    la $a0, str
    addi $a1, $t0, -1
    addi $a2, $t0, 1
    jal print

exit: 
    addiu $sp, $sp, 16
    li $v0, 10
    syscall

error:
    addiu $sp, $sp, 16
    li $a0, 1
    li $v0, 17
    syscall
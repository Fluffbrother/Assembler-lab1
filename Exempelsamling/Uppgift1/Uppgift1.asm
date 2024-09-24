    .data
vec: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
str1: .asciiz "The first element in the vector is %d.\n"
str2: .asciiz "The element in the middle of the vector is %d.\n"
str3: .asciiz "The last element in the vector is %d.\n"

    .text
    .globl main
main:
    subu $sp, $sp, 16
    la $a0, str1
    lw $a1, vec
    jal print

    la $a0, str2
    la $a1, vec
    lw $a1, 16($a1)
    jal print

    la $a0, str3
    la $a1, vec
    lw $a1, 32($a1)
    jal print

    #exit
    addiu $sp, $sp, 16
    li $v0, 10
    syscall

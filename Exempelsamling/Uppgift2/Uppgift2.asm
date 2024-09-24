    .data
vec: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
str: .asciiz "The sum of the elements in the vector is %d.\n"

    .text
    .globl main
main:
    subu $sp, $sp, 16
    addi $t0, $zero, 0  #t0 = i = 0
    addi $t1, $zero, 0  #t1 = sum = 0
    la $t2, vec
L1:
    bge $t0, 9, L2
    sll $t3, $t0, 2     #t3 = 4 * i
    add $t3, $t2, $t3   #t3 = vec + 4 * i 
    lw $t3, 0($t3)
    add $t1, $t1, $t3
    add $t0, $t0, 1
    j L1
L2: 
    la $a0, str
    move $a1, $t1
    jal print

    #exit
    addiu $sp, $sp, 16
    li $v0, 10
    syscall
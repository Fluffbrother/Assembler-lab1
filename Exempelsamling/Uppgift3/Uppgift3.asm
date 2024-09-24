    .data
vec: .word 5, 7, 1, 9, 2, 4, 8, 3, 6
str: .asciiz "The sum of the elements in the vector is %d.\n"

    .text
    .globl sum
sum:
    addi $t0, $zero, 0  #t0 = i = 0
    addi $t1, $zero, 0  #t1 = sum = 0
    move $t2, $a0
L1:
    bge $t0, $a1, L2
    sll $t3, $t0, 2     #t3 = 4 * i
    add $t3, $t2, $t3   #t3 = vec + 4 * i 
    lw $t3, 0($t3)
    add $t1, $t1, $t3
    add $t0, $t0, 1
    j L1
L2: 
    move $v0, $t1, 
    jr $ra

    .global sumrec
sumrec: 
    subu $sp, $sp, 24
    sw $ra, 20($sp)
    sw $s0, 16($sp)
    beq $a1, $zero, L3
    lw $s0, 0($a0)
    addi $a0, $a0, 4
    addi $a1, $a1, -1
    jal sumrec
    add $v0, $s0, $v0
    j L4

L3: 
    move $v0, $zero

L4: 
    lw $ra, 20($sp)
    lw $s0, 16($sp)
    addiu $sp, $sp, 24
    jr $ra

    .globl main
main:
    subu $sp, $sp, 16
    la $a0, vec
    li $a1, 9
    jal sum
    la $a0, str
    move $a1, $v0
    jal print
    
    la $a0, vec
    li $a1, 9
    jal sumrec
    la $a0, str
    move $a1, $v0
    jal print

    addu, $sp, $sp, 16
    li $v0, 10
    syscall
    .data
newline: .asciiz "/n"
space: .asciiz " "
printInt: .asciiz "%d"

    .globl printArray
printArray: 
    subu $sp, $sp, 8
    sw $ra, 4($sp)
    sw $s0, 0($sp)

    move $s0, $a0
    move $t0, $a1

    li $v0, 4
    la $a0, newline
    syscall

    li $t1, 0

Loop: 
     bge $t1, $t0, end
     sll $t2, $t1, 2
     add $t3, $s0, $t2
     lw $t4, 0($t3)
     li $v0, 1
     move $a0, $t4
     syscall

     li $v0, 4
     la $a0, space
     syscall

     addi $t1, $t1, 1
     j Loop

end: 
    li $ra, 4
    la $a0, newline
    syscall
    
    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, $sp, 8
    jr $ra

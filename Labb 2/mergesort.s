    .data
    
    .globl mergeSort
mergeSort:
    subu $sp, $sp, 16
    sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $s1, 4($sp)
    move $s0, $a0
    move $s1, $a1

    li $t0, 1
    ble $s1, $t0, return

    srl $t1, $s1, 1
    move $a0, $s0
    move $a1, $t1
    jal mergeSort

    sll $t2, $t1, 2
    add $a0, $s0, $t2
    sub $a1, $s1, $t1
    jal mergeSort

    move $a0, $s0
    move $a1, $s1
    jal merge

return:
    lw $ra, 12($sp)
    lw $s0, 8($sp)
    lw $s1, 4($sp)
    addi $sp, $sp, 16
    jr $ra

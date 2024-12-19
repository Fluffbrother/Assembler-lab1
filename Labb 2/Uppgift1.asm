    .data

    .text
    .globl main

main: 
    la $a0, vek
    lw $a1, antal
    jal printArray

    la $a0, vek
    lw $a1, antal
    jal mergeSort

    la $a0, vek
    lw $a1, antal
    jal printArray

    li $v0, 10
    syscall

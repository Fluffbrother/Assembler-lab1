    .data
antal: .word 10    
vek: .word 4, 5, 2, 2, 1, 6, 7, 9, 5, 10

    .text
merge: 
    lw $t0, antal
    la $t1, vek

    subu $sp, $sp, 16


loop:
    addi $t2,$t2,1
    bgt $t2, $t0, exit



mergeSort:

printArray:

main: 

exit: 
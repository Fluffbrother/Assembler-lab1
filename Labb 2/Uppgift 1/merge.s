    .data
   
    .globl merge
merge: 
    lw $t0, antal
    la $t1, vek

    subu $sp, $sp, 16


loop:
    addi $t2,$t2,1
    bgt $t2, $t0, exit

L1:

L2:

L3:

end: 
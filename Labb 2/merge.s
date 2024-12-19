.data
antal: .word 10    
vek: .word 4, 5, 2, 2, 1, 6, 7, 9, 5, 10

.text
.globl merge

merge:
    subu $sp, $sp, 16         
    sw   $ra, 12($sp)         
    sw   $s0, 8($sp)            
    sw   $s1, 4($sp)            
    sw   $s2, 0($sp)            

    move $s0, $a0               
    move $s1, $a1               

    srl  $s2, $s1, 1           

    li   $t0, 0                
loop:
    bge  $t0, $s1, loop_end    
    sll  $t1, $t0, 2           
    add  $t2, $s0, $t1         
    lw   $t3, 0($t2)            

    la   $t4, antal              
    add  $t5, $t4, $t1          
    sw   $t3, 0($t5)            

    addi $t0, $t0, 1         
    j loop

loop_end:
    li   $t6, 0              
    move $t7, $s2           
    li   $t8, 0                 

L1:
    bge  $t6, $s2, rest_j 
    bge  $t7, $s1, rest_i 

    sll  $t1, $t6, 2          
    la   $t4, antal             
    add  $t2, $t4, $t1         
    lw   $t9, 0($t2)            

    sll  $t3, $t7, 2           
    add  $t5, $t4, $t3         
    lw   $t0, 0($t5)            

    ble  $t9, $t0, if

    sll  $t1, $t8, 2            
    add  $t2, $s0, $t1        
    sw   $t0, 0($t2)           
    addi $t7, $t7, 1           
    j continue

if:
    sll  $t1, $t8, 2         
    add  $t2, $s0, $t1          
    sw   $t9, 0($t2)           
    addi $t6, $t6, 1           

continue:
    addi $t8, $t8, 1            
    j L1

rest_i:
    bge  $t6, $s2, end
    sll  $t1, $t6, 2
    la   $t4, antal
    add  $t2, $t4, $t1
    lw   $t9, 0($t2)

    sll  $t3, $t8, 2
    add  $t5, $s0, $t3
    sw   $t9, 0($t5)

    addi $t6, $t6, 1
    addi $t8, $t8, 1
    j rest_i

rest_j:
    bge  $t7, $s1, end
    sll  $t1, $t7, 2
    la   $t4, antal
    add  $t2, $t4, $t1
    lw   $t9, 0($t2)

    sll  $t3, $t8, 2
    add  $t5, $s0, $t3
    sw   $t9, 0($t5)

    addi $t7, $t7, 1
    addi $t8, $t8, 1
    j rest_j

end:
    lw   $ra, 12($sp)
    lw   $s0, 8($sp)
    lw   $s1, 4($sp)
    lw   $s2, 0($sp)
    addi $sp, $sp, 16
    jr   $ra

.data
scores: .word 40, 55, 70, 85, 100
msg: .asciiz "Total: "
nl: .asciiz "\n"

.text
.globl main
main:
    la $s0, scores          # Address of scores[0]

    #Replace scores[k] with V
    li $s1, 2              # k = 2
    li $t0, 33             # V = 33

    sll $t1, $s1, 2       
    add $t1, $t1, $s0      
    sw $t0, 0($t1)         

    #Calculate 
    lw $t0, 0($s0)         # 40
    lw $t1, 4($s0)         # 55
    lw $t2, 8($s0)         # 33
    lw $t3, 12($s0)        # 85
    lw $t4, 16($s0)        # 100

    add $s3, $t0, $t1
    add $s3, $s3, $t2
    add $s3, $s3, $t3
    add $s3, $s3, $t4

    #Print "Total: "
    li $v0, 4
    la $a0, msg
    syscall

    #Print total
    li $v0, 1
    add $a0, $s3, $zero
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall
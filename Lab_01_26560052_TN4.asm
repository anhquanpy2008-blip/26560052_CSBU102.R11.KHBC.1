# Listing 4 - translating statements
.text
.globl main

main:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    # x1 = y + z + w
    add $t0, $s0, $s1
    add $t0, $t0, $s2

    li $v0, 1
    move $a0, $t0
    syscall

    # x2 = (y + z) - (w + 5)
    add $t1, $s0, $s1
    addi $t5, $s2, 5
    sub $t1, $t1, $t5

    li $v0, 1
    move $a0, $t1
    syscall

    # x3 = y (copy)
    add $t2, $zero, $s0

    li $v0, 1
    move $a0, $t2
    syscall

    # x4 = z - y
    sub $t3, $s1, $s0

    li $v0, 1
    move $a0, $t3
    syscall

    # Exit
    li $v0, 10
    syscall
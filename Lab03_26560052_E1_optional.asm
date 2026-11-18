.data
classA: .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB: .word 45, 81, 66, 50, 92, 38, 70, 59

msgAmin: .asciiz "Class A min: "
msgAmax: .asciiz "Class A max: "
msgBmin: .asciiz "Class B min: "
msgBmax: .asciiz "Class B max: "
nl:      .asciiz "\n"

.text
.globl main

main:
    # Class A
    la   $a0, classA
    addi $a1, $zero, 10
    jal  min_max

    add  $s0, $v0, $zero      # Save minimum
    add  $s1, $v1, $zero      # Save maximum

    la   $a0, msgAmin
    add  $a1, $s0, $zero
    jal  show

    la   $a0, msgAmax
    add  $a1, $s1, $zero
    jal  show

    # Class B
    la   $a0, classB
    addi $a1, $zero, 8
    jal  min_max

    add  $s0, $v0, $zero
    add  $s1, $v1, $zero

    la   $a0, msgBmin
    add  $a1, $s0, $zero
    jal  show

    la   $a0, msgBmax
    add  $a1, $s1, $zero
    jal  show

    li   $v0, 10
    syscall

# min_max(addr, n)
# $v0 = minimum, $v1 = maximum
min_max:
    lw   $t0, 0($a0)
    add  $v0, $t0, $zero     # min = first element
    add  $v1, $t0, $zero     # max = first element
    addi $t1, $zero, 1       # i = 1

mm_loop:
    slt  $t2, $t1, $a1
    beq  $t2, $zero, mm_end

    sll  $t3, $t1, 2
    add  $t3, $t3, $a0
    lw   $t4, 0($t3)         # current element

    # Check minimum
    slt  $t5, $t4, $v0
    beq  $t5, $zero, check_max
    add  $v0, $t4, $zero

check_max:
    # Check maximum
    slt  $t5, $v1, $t4
    beq  $t5, $zero, mm_next
    add  $v1, $t4, $zero

mm_next:
    addi $t1, $t1, 1
    j    mm_loop

mm_end:
    jr   $ra

# show(msg, value)
show:
    li   $v0, 4
    syscall

    li   $v0, 1
    add  $a0, $a1, $zero
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    jr   $ra

.data
prompt0: .asciiz "Enter reading0 (kWh): "
prompt1: .asciiz "Enter reading1 (kWh): "
prompt2: .asciiz "Enter reading2 (kWh): "
prompt3: .asciiz "Enter reading3 (kWh): "
m1:     .asciiz "Month 1: "
m2:     .asciiz "Month 2: "
m3:     .asciiz "Month 3: "
tot:    .asciiz "Total:   "
nl:     .asciiz "\n"

.text
.globl main

main:
    #reading0
    li   $v0, 4
    la   $a0, prompt0  
    syscall
    li   $v0, 5
    syscall
    add  $t0, $v0, $zero
    
    #reading1
    li   $v0, 4
    la   $a0, prompt1 
    syscall
    li   $v0, 5
    syscall
    add  $t1, $v0, $zero
    
    #reading2
    li   $v0, 4
    la   $a0, prompt2 
    syscall
    li   $v0, 5              
    syscall
    add  $t2, $v0, $zero
    
    #reading3
    li   $v0, 4
    la   $a0, prompt3 
    syscall
    li   $v0, 5              
    syscall
    add  $t3, $v0, $zero

    #month 1
    sub $s0, $t1, $t0
    
    #month 2
    sub $s1, $t2, $t1
    
    #month 3
    sub $s2, $t3, $t2
    
    #total
    sub $s3, $t3, $t0
    
    #print m1
    li   $v0, 4
    la   $a0, m1 
    syscall
    li   $v0, 1
    move $a0, $s0
    syscall
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    #print m2
    li   $v0, 4
    la   $a0, m2 
    syscall
    li   $v0, 1
    move $a0, $s1
    syscall
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    #print m3
    li   $v0, 4
    la   $a0, m3 
    syscall
    li   $v0, 1
    move $a0, $s2
    syscall
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    #print total
    li   $v0, 4
    la   $a0, tot 
    syscall
    li   $v0, 1
    move $a0, $s3
    syscall
    
    li   $v0, 4
    la   $a0, nl
    syscall
    
    li   $v0, 10
    syscall
   
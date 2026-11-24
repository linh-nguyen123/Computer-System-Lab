#FullName: Nguy?n V?n Linh
#Student ID: 26560037
#purpose: Save amd restore $s0 on the stack in a leaf procedure
.text
.globl main
main:
    addi $s0, $zero, 2          # $s0 = class number, still needed later
    addi $a0, $zero, 8          # three marks of one student
    addi $a1, $zero, 7
    addi $a2, $zero, 9
    jal  sum3                   # $v0 = 8 + 7 + 9
    add  $s1, $v0, $zero        # $s1 = the sum
    add  $a0, $s0, $zero        # print the class number
    li   $v0, 1
    syscall
    li   $v0, 11                # print a space (ASCII 32)
    addi $a0, $zero, 32
    syscall
    add  $a0, $s1, $zero        # print the sum
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall


# Listing 7 - sum3 with $s0 saved on the stack (Fix B)
sum3:
    addi $sp, $sp, -4           # make room for one word on the stac
    # >>> save $s0 at 0($sp)
    add  $s0, $a0, $a1
    add  $v0, $s0, $a2
    # >>> restore $s0 from 0($sp)
    lw $s0, 0($sp)
    # >>> give the room back: add 4 to $sp
    addi $sp, $sp, 4
    jr   $ra

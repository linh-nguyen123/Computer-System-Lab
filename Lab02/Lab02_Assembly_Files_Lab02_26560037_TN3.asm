# ===================================================================
# Full Name: Nguyen Van Linh
# Student ID: 26560037
# Class: CSBU102.R11.KHBC
# Course: CSBU102 - Computer System - LAB 02
# Purpose: Experiment 3 - Bytes and String Manipulation (Capitalization)
# ===================================================================

# Register Plan:
# $s0 = Address of str1
# $t0 = Byte character loaded from memory

.data
str1: .asciiz "nguyen van an"
tag:  .asciiz " [end]"
nl:   .asciiz "\n"

.text
.globl main
main:
    la   $s0, str1        # $s0 = address of str1

    # Capitalize character at offset 0 ('n' -> 'N')
    lb   $t0, 0($s0)
    addi $t0, $t0, -32
    sb   $t0, 0($s0)

    # Capitalize character at offset 7 ('v' -> 'V')
    lb   $t0, 7($s0)
    addi $t0, $t0, -32
    sb   $t0, 7($s0)

    # Capitalize character at offset 11 ('a' -> 'A')
    lb   $t0, 11($s0)
    addi $t0, $t0, -32
    sb   $t0, 11($s0)

    # Print capitalized string
    li   $v0, 4
    la   $a0, str1
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10          # Exit
    syscall

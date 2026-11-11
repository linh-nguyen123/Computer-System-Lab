# ===================================================================
# Full Name: Nguyen Van Linh
# Student ID: 26560037
# Class: CSBU102.R11.KHBC
# Course: CSBU102 - Computer System - LAB 02
# Purpose: Experiment 1 - Words, Addresses, and Base-plus-Offset addressing
# ===================================================================

.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores      # $s0 = address of scores[0]
    lw   $t0, 0($s0)      # (1) $t0 = scores[0] = 40
    lw   $t1, 4($s0)      # (2) $t1 = scores[1] = 55
    lw   $t2, 16($s0)     # (3) $t2 = scores[4] = 100
    addi $s1, $s0, 8      # (4) $s1 = address of scores[2] (0x10010008)
    lw   $t3, 0($s1)      # (5) $t3 = scores[2] = 70
    lw   $t4, -4($s1)     # (6) $t4 = scores[1] = 55
    
    li   $v0, 10          # Exit program
    syscall

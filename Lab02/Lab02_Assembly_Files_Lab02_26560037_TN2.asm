# ===================================================================
# Full Name: Nguyen Van Linh
# Student ID: 26560037
# Class: CSBU102.R11.KHBC
# Course: CSBU102 - Computer System - LAB 02
# Purpose: Experiment 2 - Arrays: Reading, Writing, Indexing, and Summation
# Student ID Last Digit (D): 7 => k = 2, V = 84
# ===================================================================

# Register Plan:
# $s0 = Base address of scores array
# $s1 = Index k (k = 2)
# $s2 = Value V to write (V = 84)
# $s3 = Sum of the five array elements
# $t0, $t1, $t2 = Temporary registers for address calculation and element loading

.data
scores: .word 40, 55, 70, 85, 100
msg_total: .asciiz "Total: "
nl:        .asciiz "\n"

.text
.globl main
main:
    la   $s0, scores      # $s0 = base address of scores[0]

    # --- Step 2.1: Swap scores[0] and scores[4] ---
    lw   $t0, 0($s0)      # Load scores[0] (40) into $t0
    lw   $t1, 16($s0)     # Load scores[4] (100) into $t1
    sw   $t1, 0($s0)      # Store 100 into scores[0]
    sw   $t0, 16($s0)     # Store 40 into scores[4]

    # --- Step 2.3: Modify scores[k] with V (D=7 => k=2, V=84) ---
    li   $s1, 2           # k = 2
    li   $s2, 84          # V = 84
    sll  $t1, $s1, 2      # $t1 = 4 * k = 8
    add  $t1, $t1, $s0    # $t1 = address of scores[k]
    sw   $s2, 0($t1)      # scores[2] = 84

    # --- Summing the 5 elements using constant offsets ---
    lw   $t0, 0($s0)      # scores[0] = 100
    lw   $t1, 4($s0)      # scores[1] = 55
    lw   $t2, 8($s0)      # scores[2] = 84
    add  $s3, $t0, $t1
    add  $s3, $s3, $t2

    lw   $t0, 12($s0)     # scores[3] = 85
    lw   $t1, 16($s0)     # scores[4] = 40
    add  $s3, $s3, $t0
    add  $s3, $s3, $t1    # Total = 100 + 55 + 84 + 85 + 40 = 364

    # --- Print "Total: <value>

    li   $v0, 4
    la   $a0, msg_total
    syscall

    li   $v0, 1
    move $a0, $s3
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10          # Exit
    syscall

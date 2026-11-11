# ===================================================================
# Full Name: Nguyen Van Linh
# Student ID: 26560037
# Class: CSBU102.R11.KHBC
# Course: CSBU102 - Computer System - LAB 02
# Purpose: Extension - 3x3 Game Board Memory Indexing
# ===================================================================

# Register Plan:
# $s0 = Base address of 3x3 board
# $s1 = Row index r
# $s2 = Column index c
# $t0 = Computed 1D index (3 * r + c)
# $t1 = Effective byte offset (4 * index) / address
# $t2 = Value to store (1 for 'X', 2 for 'O')

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board       # Base address of board

    # --- Write 1 (mark X) into cell (1, 2) ---
    li   $s1, 1           # r = 1
    li   $s2, 2           # c = 2
    
    # Compute index: 3 * r + c = (r + 2*r) + c
    sll  $t0, $s1, 1      # $t0 = 2 * r = 2
    add  $t0, $t0, $s1    # $t0 = 3 * r = 3
    add  $t0, $t0, $s2    # $t0 = 3 * r + c = 5
    
    sll  $t1, $t0, 2      # Byte offset = 4 * 5 = 20
    add  $t1, $t1, $s0    # Address of cell (1, 2)
    li   $t2, 1           # Value 1 (X)
    sw   $t2, 0($t1)      # Store into board[5]

    # --- Write 2 (mark O) into cell (2, 0) ---
    li   $s1, 2           # r = 2
    li   $s2, 0           # c = 0
    
    sll  $t0, $s1, 1      # $t0 = 2 * r = 4
    add  $t0, $t0, $s1    # $t0 = 3 * r = 6
    add  $t0, $t0, $s2    # $t0 = 3 * r + c = 6
    
    sll  $t1, $t0, 2      # Byte offset = 4 * 6 = 24
    add  $t1, $t1, $s0    # Address of cell (2, 0)
    li   $t2, 2           # Value 2 (O)
    sw   $t2, 0($t1)      # Store into board[6]

    li   $v0, 10          # Exit
    syscall

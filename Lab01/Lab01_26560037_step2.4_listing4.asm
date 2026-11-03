# ===================================================================
# Student Name: Nguyễn Văn Linh
# Student ID:   26560037
# Purpose:      Lab 01 - Step 2.4 - Listing 4: translating statements
# ===================================================================

# Listing 4 - translating statements
.text
.globl main
main:
:
    addi $s0, $zero, 8       # y = 8
    addi $s1, $zero, 5       # z = 5
    addi $s2, $zero, 3       # w = 3

    
    # >>> instructions for x1, x2, x3 and x4
    # >> x1 = y + z + w
    add  $t5, $s0, $s1
    add  $t0, $t5, $s2
    # >> x2 = (y + z) - (w + 5)
    add  $t5, $s0, $s1
    addi $t1, $s2, 5
    sub  $t1, $t5, $t1
    # >> x3 = y   (copy)
    add  $t2, $s0, $zero
    # >> x4 = z - y
    sub  $t3, $s1, $s0
 
    li   $v0, 10
    syscall
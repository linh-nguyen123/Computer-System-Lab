# ===================================================================
# Student Name: Nguyeễn Văn Linh
# Student ID:   26560037
# Lab 01 - Question 4.2: Demonstration of Negative Numbers & Two's Complement
# ===================================================================

.data
prompt_pos: .asciiz "Enter a positive number (e.g., 1200): "
prompt_neg: .asciiz "Enter a larger number to subtract (e.g., 1350): "
msg_res:    .asciiz "Result (Current - Previous): "
newline:    .asciiz "\n"

.text
.globl main

main:
    # --- 1. Prompt and read first integer (Previous Reading) ---
    li      $v0, 4              # Service 4: Print String
    la      $a0, prompt_pos
    syscall

    li      $v0, 5              # Service 5: Read Integer
    syscall
    move    $s0, $v0            # Save first input to $s0 (e.g., 1200)

    # --- 2. Prompt and read second integer (Current Reading) ---
    li      $v0, 4              # Service 4: Print String
    la      $a0, prompt_neg
    syscall

    li      $v0, 5              # Service 5: Read Integer
    syscall
    move    $s1, $v0            # Save second input to $s1 (e.g., 1350)

    # --- 3. Perform Subtraction (Produces negative result in $t0) ---
    # $t0 = $s0 - $s1 (e.g., 1200 - 1350 = -150 / 0xFFFFFF6A in Two's Complement)
    sub     $t0, $s0, $s1

    # --- 4. Print Result Label ---
    li      $v0, 4
    la      $a0, msg_res
    syscall

    # --- 5. Print Negative Integer ---
    li      $v0, 1              # Service 1: Print Integer (interprets Two's Complement)
    move    $a0, $t0            # Move negative result to $a0
    syscall

    # --- 6. Print Newline ---
    li      $v0, 4
    la      $a0, newline
    syscall

    # --- 7. Exit Program Gracefully ---
    li      $v0, 10             # Service 10: Exit
    syscall
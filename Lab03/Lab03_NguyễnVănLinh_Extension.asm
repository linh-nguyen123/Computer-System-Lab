#Fullname: Nguy?n V?n Linh
#Student ID: 26560037
#Purpose: two results from one call

.data
classA: .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB: .word 45, 81, 66, 50, 92, 38, 70, 59
msgMinA:  .asciiz "Class A min: "
msgMaxA:  .asciiz "Class A max: "
msgMaxB:  .asciiz "Class B max: "
msgMinB:  .asciiz "Class B min: "
nl:     .asciiz "\n"
.text
.globl main
main:
    #class A
    la   $a0, classA            # addr = class A
    addi $a1, $zero, 10         # n = 10
    jal  min_max             	#$v0 = mi, $v1 = max 
    add  $s0, $v1, $zero        # temporary saved for max to $s0 before called
    la   $a0, msgMinA
    add  $a1, $v0, $zero
    jal show
    la   $a0, msgMaxA
    add $a1, $s0, $zero
    jal  show
    #class B
    la $a0, classB #addr = classB
    addi $a1, $zero, 8
    jal min_max
    add $s0, $v1, $zero 
    la $a0, msgMinB
    add $a1, $v0, $zero
    jal show
    la $a0, msgMaxB
    add $a1, $s0, $zero
    jal show
    li $v0, 10
    syscall  
 
# min_max(addr = $a0, n = $a1): return min $v0 and max in %v1
min_max:
	lw $v0, 0($a0) # min = arr[0]
	lw $v1, 0($a0) #max = arr[0]
	addi $t0, $zero, 1 #i = 1
nm_loop:
	slt $t1, $t0, $a1 #t1 = 1 if i < n
	beq $t1, $zero, nm_end # if i>=n, exit loop
	sll $t2, $t0, 2 #$t2 = 4*i
	add $t2, $t2, $a0 #$t2 = saved address of arr[i]
	lw $t3, 0($t2) # $t3=arr[i]
	
	#check min: arr[i] < min ($t3 < $v0)
	slt $t4, $t3, $v0
	beq $t4, $zero, check_max
	add $v0, $t3, $zero # update min = arr[i]
	
check_max:
	slt $t4, $v1, $t3
	beq $t4, $zero, nm_next
	add $v1, $t3, $zero # update max = arr[i]
	
nm_next:
	addi $t0, $t0, 1
	j nm_loop
	
nm_end:
	jr $ra
# show(msg = $a0, value = $a1): prints msg, value and a new line
show:
    li   $v0, 4                 # $a0 already holds the address of msg
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra

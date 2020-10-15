.data
msg1: .asciiz "Enter the string: "
result: .asciiz "The result is: "
.text
li $v0,4
la $a0, msg1
syscall

addi $t9, $zero, 0
addi $t2, $zero, 32
addi $t3, $zero, 10

Loop:
	li $v0,12
	syscall
	move $t0, $v0
	
	beq $t0, $t3, Exit
	
	bne $t0, $t2, Loop
	addi $t9, $t9, 1
	bne $t0, $t2, Loop
	beq $t0, $t2, Loop
Exit:

addi $t9, $t9, 1
	
li $v0,4
la $a0, result
syscall

move $a0, $t9
li $v0, 1 # set up print integer syscall
syscall

li $v0 ,10
syscall

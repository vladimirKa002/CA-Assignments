.data
	input: .asciiz "Input 8 float numbers:\n"
	output: .asciiz "Output: "
.text
main:	
	li $v0,4
	la $a0, input
	syscall
	
	addi $t5, $zero, 0
	addi $t8, $zero, 0
	addi $t9, $zero,  7
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	Loop:
	beq $t8, $t9, Exit
	addi $t8, $t8, 1
	
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	c.le.s $f2, $f1
	bc1t ok
	j Loop
	ok: mov.s $f1, $f2
	
	j Loop
	Exit:

	li $v0,4
	la $a0, output
	syscall
	
	mov.s $f12, $f1
	li $v0, 2
	syscall
		
	li $v0 ,10
	syscall
	
	
.data
	input: .asciiz "Input n: "
	output: .asciiz "Output: "
.text
main:	
	li $v0,4
	la $a0, input
	syscall
	li $v0, 5
	syscall
	
	addi $t5, $zero, 0
	addi $t0, $zero, 0
	addi $t9, $v0, 0
	
	Loop:
	beq $t0, $t9, Exit
	addi $t0, $t0, 1
	
	add $a0, $t0, $zero
	jal func
	add $t5, $v0, $t5
	
	j Loop
	Exit:

	li $v0,4
	la $a0, output
	syscall
	
	add $a0, $t5, $zero
	li $v0,1
	syscall
		
	li $v0 ,10
	syscall
	
	
func:
	addi $sp , $sp , -8
	sw $ra , 4( $sp )
	sw $a0 , 0( $sp )
	
	addi $t7, $zero, 1
	addi $t4, $a0, 0
	addi $t3, $zero, 0
	Loop1:
	beq $t3, $a0, Exit1
	addi $t3, $t3, 1
	
	add $t7, $t7, $t7
	
	j Loop1
	Exit1:
	
	lw $a0, 0($sp)
	lw $ra , 4($sp)
	addi $sp , $sp , 8
	
	move $v0, $t7
	jr $ra
	
	
	
	
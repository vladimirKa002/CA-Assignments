.data
input: .asciiz "Enter the num: "
result: .asciiz "Result: "
num1: .float 32.0
num2: .float 5.0
num3: .float 9.0
.text
	main:	
		li $v0,4
		la $a0, input
		syscall
		li $v0, 5
		syscall
		
		add $a0, $v0, $zero 
		jal func
		add $t0, $v0, $zero
		
		li $v0,4
		la $a0, result
		syscall
		
		add $a0, $t0, $zero
		li $v0,1
		syscall
		
		li $v0 ,10
		syscall
	func:
		addi $sp , $sp , -8
		sw $ra , 4( $sp )
		sw $a0 , 0( $sp )
		slti $t0, $a0, 1
		beq $t0 , $zero , L1
		addi $v0, $zero , 0
		addi $sp , $sp , 8
		jr $ra
		L1: addi $a0, $a0 , -1
		jal func
		lw $a0, 0($sp)
		lw $ra , 4($sp)
		addi $sp , $sp , 8
		add $v0 , $a0, $v0
		jr $ra
		
		
		
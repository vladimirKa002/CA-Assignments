.data
	val1: .float 5.4
	val2: .float -12.3
	val3: .float 18.23
	val4: .float -8.23
	
	input: .asciiz "Input x and y:\n"
	output: .asciiz "Output: "
.text
	#5.4xy ? 12.3y + 18.23x ? 8.23
	
	li $v0,4
	la $a0, input
	syscall

	li $v0, 6
	syscall
	mov.s $f5, $f0
	
	li $v0, 6
	syscall
	mov.s $f6, $f0

	l.s $f1, val1
	l.s $f2, val2
	l.s $f3, val3
	l.s $f4, val4
	
	mul.s $f1, $f1, $f5
	mul.s $f1, $f1, $f6
	mul.s $f2, $f2, $f6
	mul.s $f3, $f3, $f5
	
	add.s $f1, $f1, $f2
	add.s $f1, $f1, $f3
	add.s $f1, $f1, $f4
	
	li $v0,4
	la $a0, output
	syscall
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	li $v0 ,10
	syscall
	
	
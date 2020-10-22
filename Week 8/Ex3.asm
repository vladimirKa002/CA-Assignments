.data
result: .asciiz "Result: "
e: .float 2.71828
pi: .float 3.1415
.text
	main:	
		jal func
		mov.s $f6, $f12
		
		li $v0,4
		la $a0, result
		syscall
		
		mov.s $f12, $f6
		li $v0, 2
		syscall
		
		li $v0 ,10
		syscall
	func:
		l.s $f3, e
		l.s $f4, pi
		mul.s $f1, $f3, $f3
		div.s $f2, $f1, $f4
		
		mov.s $f12, $f2
		jr $ra
		
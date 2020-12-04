.data
	input2: .asciiz "Input number [0;+inf): "
	output: .asciiz "Output: \n"
	
	pow: .float 0.5 
	val_0: .float 0
	val_1: .float 1
.text
main:	
	li $v0,4
	la $a0, input2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	addi $t1, $zero, 1
	addi $t2, $zero, 1000 # Точность - количество членов в ряду
	
	l.s $f9, val_1
	l.s $f8, pow
	l.s $f7, val_0
	
	c.lt.s $f1, $f9
	sub.s $f1, $f1, $f9
	mov.s $f3, $f9
	bc1t Exit2
	add.s $f1, $f1, $f9
	mov.s $f3, $f7
	
	add.s $f2, $f7, $f9
	Loop1:
	mul.s $f3, $f9, $f2
	mul.s $f3, $f3, $f2
	
	c.lt.s  $f1, $f3
	bc1t ok
	j no_ok
	ok: j Exit1
	no_ok:
	
	add.s $f2, $f2, $f9
	j Loop1
	Exit1:
	
	sub.s $f2, $f2, $f9
	mov.s $f3, $f2
	mul.s $f2, $f2, $f2
	sub.s $f1, $f1, $f2
	div.s $f1, $f1, $f2
	
	Exit2:
	
	add.s $f6, $f6, $f9 # Переменная результат
	
	add.s $f5, $f9, $f7 # Переменная для члена ряда - 1
	add.s $f4, $f7, $f8 # Переменная степени - power
	add.s $f2, $f9, $f7 # Переменная знаменателя - 1
	
	addi $t1, $zero, 1
	Loop:
	beq $t1, $t2, Exit
	
	mul.s $f5, $f5, $f4
	mul.s $f5, $f5, $f1
	sub.s $f4, $f4, $f9
	
	div.s $f5, $f5, $f2
	add.s $f2, $f2, $f9
	
	add.s $f6, $f6, $f5
	addi $t1, $t1, 1
	j Loop
	Exit:
	
	mul.s $f6, $f6, $f3

	li $v0,4
	la $a0, output
	syscall
	
	mov.s $f12, $f6
	li $v0, 2
	syscall
		
	li $v0 ,10
	syscall

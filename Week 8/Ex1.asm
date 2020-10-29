.data
input: .asciiz "Enter the Fahrenheit temperature: "
result: .asciiz "Temperature in Celsius is: "
num1: .float 32.0
num2: .float 5.0
num3: .float 9.0
.text

li $v0,4
la $a0, input
syscall

li $v0, 6
syscall
mov.s $f11, $f0

l.s $f1, num1
l.s $f2, num2
l.s $f3, num3

sub.s $f4, $f11, $f1
mul.s $f5, $f4, $f2
div.s $f6, $f5, $f3
	
li $v0,4
la $a0, result
syscall

mov.s $f12, $f6
li $v0, 2
syscall

li $v0 ,10
syscall

.data
res_text: .asciiz "Your 10 Fibonacci numbers:\n"
space: .asciiz " "
.text
li $v0,4
la $a0, res_text
syscall

move $s0, $zero # register assignment
li $v0,0
add $t1, $zero, 1
add $t2, $zero, $zero

li $t0, 1 # literal assignment
loop: beq $t0, 11, exit # loop test
	add $a0, $t1, $t2
	li $v0, 1
	syscall
	
	move $t1,$t2
	move $t2,$a0
	
	li $v0, 4
	la $a0, space
	syscall
	addi $t0, $t0, 1 # ++i
b loop
exit:


li $v0 ,10
syscall
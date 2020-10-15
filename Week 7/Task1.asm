.data
msg1: .asciiz "Enter the number: "
result: .asciiz "The result is: "
.text
li $v0,4
la $a0, msg1
syscall
li $v0,5
syscall
move $t2, $v0

addi $t1, $zero, 0
addi $t0, $zero, 0

slt $t0, $t1, $t2
  beq $t0, $zero, Else1 
  addi $t0, $zero, 1
  j Endif
  
  Else1: 
  slti $t0, $t2, 0
  beq $t0, $zero, Else 
  addi $t0, $zero, -1
  j Endif
  
  Else: 
  Endif1:
Endif:

li $v0,4
la $a0, result
syscall

move $a0, $t0
li $v0, 1 # set up print integer syscall
syscall

li $v0 ,10
syscall
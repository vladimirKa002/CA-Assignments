.data	
x:	.float	8.0	
two:	.float	2.0
zero:	.float	0.0
round:	.float	100.0	
input: .asciiz "Input float number:\n"

main:
li $v0,4
la $a0, input
syscall
	
li $v0, 6
syscall

l.s $f4, zero
	
l.s $f5, two
l.s $f6, round
	
mul.s	$f0, $f0, $f6		# multiply the value by 100
round.w.s $f0, $f0		# round x to two decimal places by converting to word
cvt.s.w	 $f0, $f0		# convert back to float
div.s	$f0, $f0, $f6		# divide by 100
	
div.s	$f1, $f0, $f5		# store x / 2 in $f1
sqrt:
 add.s	$f3, $f1, $f4		# store a copy of x / 2 in $f3
 addi	$sp, $sp, -4		# adjust stack pointer
 s.s	$f1, 4($sp)		# push x / 2 to stack

 mul.s	$f2, $f3, $f3		# store (x / 2)^2 in $f2
 add.s	$f3, $f3, $f4		# store a copy of x / 2 in $f3
 div.s	$f1, $f3, $f5		# mid of 0 to mid

 mul.s	$f2, $f2, $f6		# multiply the value by 100
 round.w.s    $f2, $f2		# round (x / 2)^2 to two decimal places by converting to word
 cvt.s.w	     $f2, $f2		# convert back to float
 div.s	$f2, $f2, $f6		# divide by 100

 c.eq.s	$f2, $f0		# if (x / 2)^2 = x
 bc1t	fin			# branch to fin if true
 c.lt.s	$f2, $f0		# if (x / 2)^2 < x
 bc1t	lt			# branch to lt if true
 j	sqrt
lt:
 add.s	$f1, $f1, $f3		# add x / 2 to get mid of mid to x / 2
 j sqrt
fin:
 mul.s	$f3, $f3, $f6		# multiply the value by 100
 round.w.s    $f3, $f3		# round result to two decimal places by converting to word
 cvt.s.w	     $f3, $f3		# convert back to float
 div.s	$f3, $f3, $f6		# divide by 100

mov.s	$f12, $f3		# move result to $f12 to print
 li $v0, 2			# print result to console
 syscall
 li v0, 10			# exit
 syscall
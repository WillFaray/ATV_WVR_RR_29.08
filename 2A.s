.data
text: .asciiz "t = "

.text
.globl main
main:
	li $t0, 12	#  a = 12
	li $t1, 5	#  b = 5
	li $t2, 0	#  t = 0
	
	add $t3, $t0, $t0	#  (a+a)
	add $t4, $t0, $t1	#  (a+b)
	sub $t5, $t3, $t4	#  t = (a+a) - (a-b)

print:	
	la $a0, text	#  print "t = "
	li $v0, 4
	syscall

	move $a0, $t5	# print valor
	li $v0, 1
	syscall

exit:
	li $v0, 10
	syscall


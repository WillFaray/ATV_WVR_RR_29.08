.data
text: .asciiz "s = "

.text
.globl main
main:
	li $t0, 0 	#  i = 0
	li $t1, 5 	#  j = 5
	li $t2, 1 	#  s = 1
	
loop:	
	add $t2, $t2, $t0	#  s = s + i
	add $t0, $t0, 1		#  i ++
	blt $t0, $t1, loop	#  se i < j, pule para loop

print:
	la $a0, text	#  print "s = "
	li $v0, 4
	syscall

	move $a0, $t2	# print valor			
	li $v0, 1
	syscall

exit:
	li $v0, 10
	syscall





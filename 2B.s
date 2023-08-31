.data
text: .asciiz "j = "

.text
.globl main
main:
	li $v0, 5					# Ler o inteiro i
	syscall

	move $t0, $v0 			# t0 = i
	
	li $s0, 12				# j = 12

	li $t3, 2					# t3 = 2, multiplicador
	li $t4, 8					# t4 = 8, multiplicador
	li $t5, 6					# t5 = 6, multiplicador

	blt $s0, $t0, Else		# se j < i (logo i > j), pula pra Else

	mul $s1, $t0, $t3 		# 2 * i
	add $s1, $s1, 8	 		# 2*i + 8
	move $s0, $s1	 		# j = 2i + 8
	j Print

Else:
	mul $s1, $t0, $t4		# i*8
	mul $s2, $s0, $t5		# j*6
	add $s3, $s1, $s2		# (i*8) + (j*6)
	add $s3, $s3, 12
	move $s0, $s3
	j Print


Print:
	la $a0, text	#  print "j = "
	li $v0, 4
	syscall

	move $a0, $s0	# print valor			
	li $v0, 1
	syscall

	li $v0, 10
	syscall
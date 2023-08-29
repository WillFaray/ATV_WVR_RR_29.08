.data
	vetor: .word 2, 2, 2, 2, 7	
.text
.globl main
main:
	la $t0, vetor
	li $t1, 1
	la $t2, vetor
	li $t3, 8
	lw $t5, 0($t0)
loop:
	beq $t1, $t3, exit
	lw $t4, 0($t0)

	lw $t7, 0($t2)
	addi $t1, $t1, 1 
	addi $t0, $t0, 4
	addi $t8, $t8, 4
	bgt $t4, $t5, maior	#Pula para funcao de armazenar
	j loop
maior:
	move $t5, $t4		#Armazena o maior numero
	j loop
exit:
	move $a0, $t5
	li $v0, 1				#Le a instrucao no System Call
	syscall				#Print Integer no maior numero
	
	li $v0, 10			#System Call de Exit Program
	syscall
	
	
.data
nota: 	
	.align 2
	.space 16
	
valor:	.asciiz "Valor " 
insert: .asciiz "Valores informados: "
media: 	.asciiz "Media: "
doispontos: .asciiz ": "
vazio: .asciiz " "
pula: 	.asciiz "\n"


.text
.globl main
main:
	li $t0, 0  		# indice = 0
	li $t1, 0		# total = 0  
	la $t2, nota		# Endereço da array nota

loop:	
	la $a0, valor		# Print do "Valor x:
	li $v0, 4
	syscall

	move $a0, $t0		# Print do indice x
	li $v0, 1
	syscall

	la $a0, doispontos	# Print do dois pontos (:)
	li $v0, 4
	syscall
	
	li $v0, 5		# Scanf valor inteiro
	syscall
	sw $v0, 0($t2)		# Guarda os valores inseridos na array nota
	addi $t2, $t2, 4	# Adiciona 4 para avançar a posição da array	

	add $t0, $t0, 1		# i += 1
	blt $t0, 4, loop	# se i < 4, vá para loop

print:
	la $a0, insert		# Print do "Valores informados: "
	li $v0, 4
	syscall

	li $t0, 0		# Reseta i para 0
	la $t2, nota		# Reseta a posição da array
	
loop2:	
	lw $t3, 0($t2)		# $t3 recebe valor da array
	move $a0, $t3		# Imprimir valores
	li $v0, 1
	syscall

	la $a0, vazio		# Imprimir espaços vazios
	li $v0, 4
	syscall

	add $t1, $t1, $t3	# total += nota[indice]

	add $t0, $t0, 1
	addi $t2, $t2, 4
	blt $t0, 4, loop2

printMedia:
	la $a0, pula
	li $v0, 4
	syscall	

	la $a0, media
	li $v0, 4
	syscall

	divu $t1, $t1, 4	
	move $a0, $t1
	li $v0, 1
	syscall


	la $a0, pula
	li $v0, 4
	syscall

exit:
	li $v0, 10
	syscall
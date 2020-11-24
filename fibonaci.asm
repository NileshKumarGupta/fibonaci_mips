# for n = 10
addi $a0, $zero, 10
jal fib
j exit

fib: 
	
	#save value in stack
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	#base conditions
	
	#if n == 2, return 1
	beq $a0, 2, retone
	
	#if n == 1, return 1
	beq $a0, 1, retone
	
	#recursion
	
	#call for fib(n - 1)
	addi $a0, $a0, -1
	jal fib
	
	#restore value of $a0
	lw $a0, 0($sp)
	
	#call for fib(n - 2)
	addi $a0, $a0, -2
	jal fib

	#read registers from stack
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra	
	
retone:
	addi $v0, $v0, 1
	addi $sp, $sp, 8	
	jr $ra
	
retzero:
	addi $v0, $zero, 0
	jr $ra
	
exit:

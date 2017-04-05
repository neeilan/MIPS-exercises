# def sum_prod(a, b):     
#	s = a + b     
#	p = a * b     
#	return (s, p)
main:
	addi 	$t5, $zero, 5		# a = 5
	addi	$t6, $zero, 3		# b = 3
	
	sw	$t5, 0($sp)		# push prod to stack
	addi 	$sp, $sp, -4		# inc stack pointer
	sw	$t6, 0($sp)		# pus	
	
	jal	sum_prod		# call 
	
	lw   	$t0, 0($sp)		# $t0 = A
	addi 	$sp, $sp, 4		# dec stack ptr
	lw   	$t1, 0($sp)		# $t1 = B
	
	j end	
	
sum_prod:
	lw   	$t0, 0($sp)		# $t0 = A
	addi 	$sp, $sp, 4		# dec stack ptr
	lw   	$t1, 0($sp)		# $t1 = B
	
	add	$t2, $t0, $t1		# $t3 = sum
	mul	$t4, $t0, $t1		# $t4 = prod
	
	sw	$t4, 0($sp)		# push prod to stack
	addi 	$sp, $sp, -4		# inc stack pointer
	sw	$t2, 0($sp)		# push sum to stack
	
	jr    	$ra			# return
	
end:	j	end
	

	
	
	
	 
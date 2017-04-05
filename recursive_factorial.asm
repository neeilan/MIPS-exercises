# implement a recursive factorial function in MIPS

main:
	addi	$t0, $zero, 3		# try 3!
	
	addi	$sp, $sp, -4
	sw	$t0, 0($sp)
	
	jal	fact			# call fact
	
	lw	$t0, 0($sp)		# get n! off stack, into $t0
	addi	$sp, $sp, 4
	
	j 	end


fact:
	lw	$t2, 0($sp)		# pop n off the stack and store into $t2
	addi	$sp, $sp, 4		# increment the stack pointer
	addi	$t1, $zero, 1		# let $t1 = 1
					
_if:	bne	$t1, $t2, _else		# 1! = 1

	addi	$sp, $sp, -4		# dec sp
	sw	$t1, 0($sp)		# push 1! onto stack and return 
	
	jr	$ra			# return

_else:	addi	$sp, $sp, -4		# dec sp
	sw	$ra, 0($sp)		# push ret addr onto stack
	
	addi	$sp, $sp, -4
	sw	$t2, 0($sp)		# push n to stack
	
	addi	$t3, $t2, -1		# $t3 = (n-1)
	
	addi	$sp, $sp, -4
	sw	$t3, 0($sp)		# call fact(n-1)
	
	jal	fact
	
	lw	$t3, 0($sp)		# $t3 = (n-1)!
	addi	$sp, $sp, 4
	
	lw	$t2, 0($sp)		# $t2 = n
	addi	$sp, $sp, 4
	
	mul	$t4, $t3, $t2		# $t4 = n * (n-1)!
	mflo	$t4 
	
	lw	$t5, 0($sp)		# get prev ra off stack, into $t5
	addi	$sp, $sp, 4
	
	addi	$sp, $sp, -4
	sw	$t4, 0($sp)		# push n! onto stack
	
	
	jr	$t5			# return

	
end:	j 	end
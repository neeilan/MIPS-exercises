# Exercise 7. Write a program to read a number. The program must indicate if the number is odd or even.

# Registers
# $t0 - the input value
# $v0 - used for syscalls

.data
	even:	.asciiz "Even"
	odd:	.asciiz "Odd"

.text	
main:		li	$v0, 5		# load system call code 5 (read int) into register $v0
		syscall	
			
		move	$t0, $v0 	# copy the read value
		andi	$t0, $t0, 1	# Identify LS bit
		
		beqz	$t0, print_even	# LS bit 0 - num even
		
		
print_odd:	la 	$a0, odd	# load address of instr to print Odd into arg0
		li 	$v0, 4		# load system call code 4 to print str
		syscall
		
		j	end
				
print_even:	la 	$a0, even
		li 	$v0, 4		# opcode for print str is 4
		syscall

end:	
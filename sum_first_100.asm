# Write a program, using the MIPS 32 assembly language, to calculate the sum of the first 100 numbers. The
# result must be stored in register $v0

# $t1 - temp to to hold value of nth number
# $v0 - holds cumulative sum (result)

main:
	addi	$t1, $zero, 1	# load the value 1 into temp

loop:	beq	$t1, 101, end	# if num equals 101, end the program
	add	$v0, $t1, $v0 	# otherwise add num to the result
	addi	$t1, $t1, 1	# increment num
	j	loop		# check loop condition	
								
end:				# end of program
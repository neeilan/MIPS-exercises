# Exercise 5. What is the sequence of MIPS instructions that allow implementing the following sentence in C language?
# (a and b are int variables)
# a = b + c + 100;

 # Registers
 # $t0 = a, $t1 = b, $t3 = c
 
  main:
  	# addi $t0, $zero, 10	# load b, c
  	# addi $t1, $zero, 16
  	add $t0, $t1, $t3	# set a to b + c
  	addi $t0, $t0, 100 	# add 100 to a

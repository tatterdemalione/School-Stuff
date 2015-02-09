         
# Brennan Neve, 201202368, Feb 5 2015

	 .data

prompt1: .asciiz "Please enter a number: "

prompt2: .asciiz "Please enter the square of that number: "

errmsg:  .asciiz "The solution is erroneous ??!"

solu:    .asciiz "The next 5 squares are: "

spacing: .asciiz " "

        

         .text

main:
	
	# prepare stack

	addi	$sp, $sp -8 # allocate 8 bytes in the stack

	sw	$ra, 0($sp) # save the return address in the stack

	
	# Get input 

	la	$a0, prompt1 # the argument for syscall
	
        addi	$v0, $0, 4 # save the number that tells syscall what to do
	
	syscall
	
	addi	$v0, $0, 5 #read Int
	
	syscall
	
	add	$s0, $v0, $0

	
	la	$a0, prompt2
	
	addi	$v0, $0, 4 #print prompt2
	
	syscall

	addi	$v0, $0, 5 #read Int
	
	syscall

	add	$s1, $v0, $0


	
	# check for negative input

	slt	$t0, $s0, $0 #set less than 

	bne	$t0, $0, error #branch to error if the input is negative

	

	add	$s4, $0, $0 # set index initially equal to 0

	la 	$a0, solu # the argument for syscall

	addi	$v0, $0, 4 # the code number for syscall

	syscall	# print solu

	
	

for:	

	jal 	nextSquares # call the nextSquares function

	lw 	$ra, 0($sp) # load the return address from the stack

	lw	$a0, 4($sp) # load the value that was stored from the function call

	addi	$s0, $s0, 1 # n = n+1

	add	$s1, $a0, $0 # n^2 is now (n+1)^2

	addi	$v0, $0, 1  

	syscall # print the integer

	la	$a0, spacing # save spacing

	addi	$v0, $0, 4 
	
	syscall
	
	addi	$s4, $s4, 1 # index++

	slt	$t1, $s4, 5 # set less than $s4 > 5
	
	bne	$t1, $0, for
	
	j	exit
	
		
#---------------------------------------------------------------------------

# nextSquares: calculates the square root of the next number 

# args: $s0 = n, $s1 = n^2

# Consumes:  $t4, $t5, and $v0

# Returns: The square root of the next number (n+1)^2

#---------------------------------------------------------------------------	
nextSquares:
	
	addi	$t4, $s0, 1 # (n+1)
	
	add	$t5, $s0, $s1 # (n+1) + n

	add	$v0, $t4, $t5 # $v0 = n^2 + n + (n+1)
	
	sw	$v0, 4($sp) # save $v0 in the stack

	jr	$ra # go back to the return address



error:  la $a0, errmsg
	
	addi $v0, $0, 4
	
	syscall

exit:  

  lw $ra, 0($sp)

  addi $sp, $sp, 8 # move stack back to where it started

  jr $ra
	
	

	

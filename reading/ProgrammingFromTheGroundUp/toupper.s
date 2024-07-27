#PURPOSE: This program converts an input file 
#to an output file with all letters 
#converted to uppercase.

#PROCESSING:
#(1)Open the input file
#(2)Open the output file
#(3)While we're not at the end of the input file
#  (a)read part of file into our memory buffer
#  (b)go throught each byte of memory, if the byte is a lower-case letter, convert it to uppercase
#  (c)write the memory buffer to output file

 .section .data

#######CONSTANTS#######

 #system call numbers
 .equ SYS_OPEN, 5
 .equ SYS_WRITE, 4
 .equ SYS_READ, 3
 .equ SYS_CLOSE, 6
 .equ SYS_EXIT, 1
 
 #options for open (look at
 #/usr/incude/asm/fcntl.h for
 #various values. You can combine them
 #by adding them or ORing them)
 #This is discussed at greater length
 #in "Counting Like a Computer"
 .equ O_RDONLY, 0
 .equ O_CREAT_WRONLY_TRUNC, 03101
 
 #standard file descriptors
 .equ STDIN, 0
 .equ STDOUT, 1
 .equ STDERR, 2
 
 #system call interrupt
 .equ LINUX_SYSCALL, 0X80
 
 .equ END_OF_FILE, 0 #This is the return value 
                     #of read which means we've
 					#hit the end of the file
 
 .equ NUMBER_ARGUMENTS, 2

.section .bss
 #Buffer - This is where the data is loaded into 
 #from the data file and written from 
 #into the output file. This should 
 #never exceed 16000 for various
 #reasons.
 
 .equ BUFFER_SIZE, 500
 .lcomm BUFFER_DATA, BUFFER_SIZE
 
 .section .text
 
 #STACK POSITIONS
 .equ ST_SIZE_RESERVE, 8
 .equ ST_FD_IN, -4
 .equ ST_FD_OUT, -8
 .equ ST_ARGC, 0 #Number of arguments
 .equ ST_ARGV_0, 4 #Name of program
 .equ ST_ARGV_1, 8 #Input file name
 .equ ST_ARGV_2, 12 #Output file name

 .globl _start
_start:
 ###INITIALIZE PROGRAM###
 #save the stack pointer

 mov %rsp, %rbp
 
 #Allocate space for our file descriptors
 #on the stack
 sub $ST_SIZE_RESERVE, %rsp

open_files:
open_fd_in:
 ###OPEN INPUT FILE###
 #open syscall
 mov $SYS_OPEN, %rax
 #input filename into %rbx
 mov ST_ARGV_1(%rbp), %rbx
 #read-only flag
 mov $O_RDONLY, %rcx
 #this doesn’t really matter for reading
 mov $0666, %rdx
 #call Linux
 int $LINUX_SYSCALL

store_fd_in:
 #save the given file descriptor
 mov %rax, ST_FD_IN(%rbp)
 
open_fd_out:
 ###OPEN OUTPUT FILE###
 #open the file
 mov $SYS_OPEN, %rax
 #output filename into %rbx
 mov ST_ARGV_2(%rbp), %rbx
 #flags for writing to the file
 mov $O_CREAT_WRONLY_TRUNC, %rcx
 #mode for new file (if it’s created)
 mov $0666, %rdx
 #call Linux
 int $LINUX_SYSCALL
 
store_fd_out:
 #store the file descriptor here
 mov %rax, ST_FD_OUT(%rbp)
 
 ###BEGIN MAIN LOOP###
read_loop_begin:

 ###READ IN A BLOCK FROM THE INPUT FILE###
 mov $SYS_READ, %rax
 #get the input file descriptor
 mov ST_FD_IN(%rbp), %rbx
 #the location to read into
 mov $BUFFER_DATA, %rcx
 #the size of the buffer
 mov $BUFFER_SIZE, %rdx
 #Size of buffer read is returned in %rax
 int $LINUX_SYSCALL
 
 ###EXIT IF WE’VE REACHED THE END###
 #check for end of file marker
 cmp $END_OF_FILE, %rax
 #if found or on error, go to the end
 jle end_loop

continue_read_loop:
 ###CONVERT THE BLOCK TO UPPER CASE###
 push $BUFFER_DATA #location of buffer
 push %rax #size of the buffer
 call convert_to_upper
 pop %rax #get the size back
 add $4, %rsp #restore %rsp
 
 ###WRITE THE BLOCK OUT TO THE OUTPUT FILE###
 #size of the buffer
 mov %rax, %rdx
 mov $SYS_WRITE, %rax
 #file to use
 mov ST_FD_OUT(%rbp), %rbx
 #location of the buffer
 mov $BUFFER_DATA, %rcx
 int $LINUX_SYSCALL
 
 ###CONTINUE THE LOOP###
 jmp read_loop_begin

end_loop:
 ###CLOSE THE FILES###
 ##NOTE - we don’t need to do error checking on these, because error conditions
 #don’t signify anything special here
 mov $SYS_CLOSE, %rax
 mov ST_FD_OUT(%rbp), %rbx
 int $LINUX_SYSCALL
 mov $SYS_CLOSE, %rax
 mov ST_FD_IN(%rbp), %rbx
 int $LINUX_SYSCALL
 ###EXIT###
 mov $SYS_EXIT, %rax
 mov $0, %rbx
 int $LINUX_SYSCALL
 #PURPOSE: This function actually does the
 # conversion to upper case for a block
 #
 #INPUT:The first parameter is the location

 #of the block of memory to convert
 #The second parameter is the length of
 #that buffer
 #
 #OUTPUT: This function overwrites the current
 #buffer with the upper-casified version.
 #
 ##VARIABLES: %rax - beginning of buffer
 #%rbx - length of buffer
 #%rdi - current buffer offset
 #%cl - current byte being examined
 #(first part of %rcx)
 #


 ###CONSTANTS##
 #The lower boundary of our search
 .equ LOWERCASE_A, 'a'
 #The upper boundary of our search
 .equ LOWERCASE_Z, 'z'
 #Conversion between upper and lower case
 .equ UPPER_CONVERSION, 'A' - 'a'
 
 
 ###STACK STUFF###
 .equ ST_BUFFER_LEN, 8 #Length of buffer
 .equ ST_BUFFER, 12 #actual buffer
 
convert_to_upper:
 push %rbp
 mov %rsp, %rbp
 ###SET UP VARIABLES###
 mov ST_BUFFER(%rbp), %rax
 mov ST_BUFFER_LEN(%rbp), %rbx
 mov $0, %rdi

 #if a buffer with zero length was given
 #to us, just leave
 cmp $0, %rbx
 je end_convert_loop

convert_loop:
 #get the current byte
 movb (%rax,%rdi,1), %cl

 #go to the next byte unless it is between
 #’a’ and ’z’
 cmpb $LOWERCASE_A, %cl
 jl next_byte
 cmpb $LOWERCASE_Z, %cl
 jg next_byte

 #otherwise convert the byte to uppercase
 addb $UPPER_CONVERSION, %cl
 #and store it back
 movb %cl, (%rax,%rdi,1)

next_byte:
 inc %rdi #next byte
 cmp %rdi, %rbx #continue unless
                #we’ve reached the
                #end
				
 jne convert_loop

end_convert_loop:
 #no return value, just leave
 mov %rbp, %rsp
 pop %rbp
 ret

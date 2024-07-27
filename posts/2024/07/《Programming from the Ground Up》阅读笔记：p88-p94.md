《Programming from the Ground Up》学习第5天，p88-p94总结，总计7页。

# 一、技术总结

## 1.touppercase.s

```assembly
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

```

按照书上代码敲的，但是没有结果，也不报错，心累，先这样吧。

## 2.64位计算机上不同寄存器的作用

不同位数计算机上寄存器(register)：

r8 = AL AH BL BH CL CH DL DH 

r16 = AX BX CX DX BP SP SI DI

r32 = EAX EBX ECX EDX EBP ESP ESI EDI

r64 = RAX RBX RCX RDX RBP RSP RSI RDI R8 R9 R10 R11 R12 R13 R14 R15

个人认为，其实作者应该先把各个寄存器的作用列出来，这样读者才能知道代码里为什么使用这个寄存器，不然自己写的时候根本不知道使用哪个寄存器。寄存器的作用可以搜索《System V Application Binary Interface AMD64 Architecture Processor Supplement》手册(如：https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf)，手册里面“Figure 3.4: Register Usage”有介绍。这里把它列出来，方便查看：

| Register     | Usage                                                        | callee saved |
| ------------ | ------------------------------------------------------------ | ------------ |
| %rax         | temporary register; with variable arguments passes information<br/>about the number of vector registers used; 1st return register | No           |
| %rbx         | callee-saved register                                        | Yes          |
| %rcx         | used to pass 4th integer argument to functions               | No           |
| %rdx         | used to pass 3rd argument to functions; 2nd return register  | No           |
| %rsp         | stack pointer                                                | Yes          |
| %rbp         | callee-saved register; optionally used as frame pointer      | Yes          |
| %rsi         | used to pass 2nd argument to functions                       | No           |
| %rdi         | used to pass 1st argument to functions                       | No           |
| %r8          | used to pass 5th argument to functions                       | No           |
| %r9          | used to pass 6th argument to functions                       | No           |
| %r10         | temporary register, used for passing a function’s static chain<br/>pointer | No           |
| %r11         | temporary register                                           | No           |
| %r12-r14     | callee-saved registers                                       | Yes          |
| %r15         | callee-saved register; optionally used as GOT base pointer   | Yes          |
| %xmm0–%xmm1  | used to pass and return floating point arguments             | No           |
| %xmm2–%xmm7  | used to pass floating point arguments                        | No           |
| %xmm8–%xmm15 | temporary registers                                          | No           |
| %tmm0–%tmm7  | temporary registers                                          | No           |
| %mm0–%mm7    | temporary registers                                          | No           |
| %k0–%k7      | temporary registers                                          | No           |
| %st0,%st1    | temporary registers, used to return long double arguments    | No           |
| %st2–%st7    | temporary registers                                          | No           |
| %fs          | thread pointer                                               | Yes          |
| mxcsr        | SSE2 control and status word                                 | partial      |
| x87 SW       | x87 status word                                              | No           |
| x87 CW       | x87 control word                                             | Yes          |
| tilecfig     | Tile control register                                        | No           |

# 二、英语总结

无。

# 三、其它

先追求完成，再追求完美，每天看一点。

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
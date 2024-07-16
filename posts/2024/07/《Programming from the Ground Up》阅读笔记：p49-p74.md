《Programming from the Ground Up》学习第3天，p49-p74总结，总计26页。

# 一、技术总结

## 1.function

### (1)定义

p49, Functions are unit of code that do a defined piece of work on specified types of data。

函数是在指定类型的数据上完成所定义的某个工作的代码单元。

### (2)parameter

p49, The data items a function is given to process are called it's parameters。

给予函数处理的数据项称为函数的参数。

### (3)interface

p49, The parameter list and the processing expectations of a function(what it is expected to to with the parameters) are called the function's interface。

函数参数列表和预期处理结果称为函数的接口。

## 2.primitive functions/primitives

p50，However, ultimately there are things that you cannot write functions for which must be provided by the system. Those are called primiteive function(or just primiteives)-they are teh basics which everything else is built off of.

这些由系统提供的函数称为原函数(或原语)。

## 3.stack

### (1)定义

p51,Each computer program that runs uses a region of memory called the stack to enable functions to work properly.

The computer's stack lives at the very top address of memory.

stack(栈)就是memory(内存)的一块区域，位于内存的最顶端。这是物理意义的上的。

## 4.power.s

```
#PURPOSE: Program to illustrate how functions work
#         This program will compute the value of
#         2^3 + 5^2
#

#Everything in the main program is stored in registers,
#so the data section doesn't have anything

.section .data #.data的作用是什么？


.section .text #.text的作用是什么？

.global _start
_start:
 pushq $3 #push second argument
 pushq $2 #push first argument
 call power # call the function
 add $8, %rsp #movqe the stack pointer back
 
 pushq %rax #save the first answer before
            #calling the next function

 pushq $2 #push second argument
 pushq $5
 call power #call the function
 add $8, %rsp #movqe the stack pointer back
 
 popq %rbx #The second answer is already 
           #in %rax. We save the  
		   #first answer onto the stack, 
		   #so now we can just pop it 
		   #out into %rbx
 
 add %rax, %rbx #add them together
                 #the result is in %rbx
				 
 movq $1, %rax #exit (%rbx is returned)
 int $0x80
 
#PURPOSE: This function is used to compute
#the value of a number raised to a power.
#
#INPUT: First argument-the base number
#Second argument-the power to raise it to
#
#OUTPUT: Will give the result as a return value
#
#NOTES: The power must be 1 or greater
#
#VARIABLES: 
#%rbx - holds the base number
#%rcx - holds the power
#
#-4(%rbp) - holds the current result
#
# %rax is used for temporary storage
#
 .type power, @function
power:
 pushq %rbp #save old base pointer
 movq %rsp, %rbp # make stack pointer the base pointer
 sub $4, %rsp #get room for our local storage
 
 movq 8(%rbp), %rbx #put first argument in %rax
 movq 12(%rbp), %rcx #put second argument in %rcx
 movq %rbx, -4(%rbp) #store current result
 
 power_loop_start:
  cmp $1, %rcx #if the power is 1, we are done
  je end_power
  movq -4(%rbp), %rax #movqe the current result into %rax
  imul %rbx, %rax #multiply the current result by 
                   #the base number
  movq %rax, -4(%rbp) #store the current result
  
  
  dec %rcx #decrease the power
  jmp power_loop_start # run for the next power
  
  end_power:
   movq -4(%rbp), %rax # return value goes in %rax
   movq %rbp, %rsp #restore the stack pointer
   popq %rbp #restore the base pointer
   ret   
 
```

书里使用的是32位的电脑，但我们现在的电脑大多是64位的，如果运行书中的代码就会提示：Error: invalid instruction suffix for `push'，这里对代码做了修改，改为64位电脑里的寄存器。

# 二、英语总结

无。

# 三、其它

## 1.8、16、32、64位电脑里寄存器的名字

因为不同教材使用的寄存器名称不一样，容易对初学者造成困扰，这里把8位、16位、32位、64位电脑里的寄存器名称全部列出来，这样在看到这些名字的时候我们就知道作者使用的是多少位的电脑。同时我们尽量在对应位数的电脑里去运行这些代码。

r8 = AL AH BL BH CL CH DL DH 

r16 = AX BX CX DX BP SP SI DI

r32 = EAX EBX ECX EDX EBP ESP ESI EDI

r64 = RAX RBX RCX RDX RBP RSP RSI RDI R8 R9 R10 R11 R12 R13 R14 R15

## 2.32和64位电脑里寄存器调用区别

(1)x86 Assembly pushl/popl don't work with "Error: suffix or operands invalid"

https://stackoverflow.com/questions/5485468/x86-assembly-pushl-popl-dont-work-with-error-suffix-or-operands-invalid

(2)What are the calling conventions for UNIX & Linux system calls (and user-space functions) on i386 and x86-64

https://stackoverflow.com/questions/2535989/what-are-the-calling-conventions-for-unix-linux-system-calls-and-user-space-f

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
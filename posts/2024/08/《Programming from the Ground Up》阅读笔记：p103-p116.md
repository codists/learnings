《Programming from the Ground Up》学习第7天，p103-p116总结，总计14页。

# 一、技术总结

## 1.读写文件

### (1)linux.s

linux.s:

```
#file name:linux.s

# system call numbers(按数字大小排列，方便查看)
.equ SYS_READ, 0
.equ SYS_WRITE, 1
.equ SYS_OPEN, 2
.equ SYS_CLOSE, 3
.equ SYS_EXIT, 60

# standard file descriptors
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2

# common status codes
.equ END_OF_FILE, 0
```

### (2)record-def.s

record-def.s:

```
#file name: record-def.s

.equ RECORD_FIRSTNAME, 0
.equ RECORD_LASTNAME, 40
.equ RECORD_ADDRESS, 80
.equ RECORD_AGE, 320
.equ RECORD_SIZE, 328
```

### (3)read-record.s & read-record.s

read-record.s:

```
#file name: read-record.s

.include "record-def.s"
.include "linux.s"

# stack local variables
.equ ST_READ_BUFFER, 16
.equ ST_FILEDES, 24

.section .text

.global read_record
.type read_record, @function
read_record:
    push %rbp
    mov %rsp, %rbp

    push %rbx
    mov ST_FILEDES(%rbp), %rdi
    mov ST_READ_BUFFER(%rbp), %rsi
    mov $RECORD_SIZE, %rdx
    mov $SYS_READ, %rax
    syscall
    pop %rbx
    
    mov %rbp, %rsp
    pop %rbp
    ret

```

read-records.s:

```
#file name: read-records.s

.include "linux.s"
.include "record-def.s"

.section .data

filename:
    .ascii "ch6/test.dat\0"

newline:
    .ascii "\n\0"

.section .bss

.lcomm RECORD_BUFFER, RECORD_SIZE

.section .text

.global _start

_start:
    .equ INPUT_DESCRIPTOR, -8
    .equ OUTPUT_DESCRIPTOR, -16

    mov %rsp, %rbp

    # open ch6/test.dat
    mov $SYS_OPEN, %rax
    mov $filename, %rdi
    mov $0, %rsi
    mov $0666, %rdx
    syscall

    push %rax       # push input file descriptor onto stack
    push $STDOUT    # push output file descriptor onto stack

record_read_loop:
    # invoke read_record function
    push INPUT_DESCRIPTOR(%rbp)
    push $RECORD_BUFFER
    call read_record
    add $16, %rsp       # pop function args off of stack

    cmp $RECORD_SIZE, %rax
    jne finished_reading

    push $RECORD_FIRSTNAME + RECORD_BUFFER
    call count_chars
    add $8, %rsp        

    mov %rax, %rdx                      # count of chars to print
    mov $RECORD_BUFFER, %rsi
    mov OUTPUT_DESCRIPTOR(%rbp), %rdi
    mov $SYS_WRITE, %rax
    syscall

    mov $1, %rdx                      # count of chars to print
    mov $newline, %rsi
    mov OUTPUT_DESCRIPTOR(%rbp), %rdi
    mov $SYS_WRITE, %rax
    syscall

    jmp record_read_loop

finished_reading:
    mov $SYS_EXIT, %rax
    mov $0, %rdi
    syscall

```

### (4)write-record.s & write-records.s

write-record.s:

```
#filename:write-record.s

.include "linux.s"
.include "record-def.s"

#PURPOSE:   This function writes a record to
#           the given file descriptor
#
#INPUT:     The file descriptor(%rdi) and a buffer(%rsi)
#
#OUTPUT:    This function produces a status code
#
.section .text
    .globl write_record
    .type write_record, @function
	
write_record:
    #将 system call number 1存入rax寄存器，执行syscall的时候表示执行write操作
    movq  $SYS_WRITE, %rax
    #执行syscall时，RECORD_SIZE(值为324)用作write(unsigned int fd,const char *buf,size_t count)的第三个参数。
    movq  $RECORD_SIZE, %rdx                                 
    syscall

    ret

```

write-records.s:

```
#file name: write-record.s
.include "linux.s"
.include "record-def.s" 

.section .data
record1:
    .ascii "Fredrick\0"
    .rept 31
    .byte 0
    .endr
    .ascii "Bartlett\0"
    .rept 31
    .byte 0
    .endr
    .ascii "4242 S Prairie\nTulsa, OK 55555\0"
    .rept 209
    .byte 0
    .endr
    .long 45
    
record2:
    .ascii "Marilyn\0"
    .rept 32
    .byte 0
    .endr
    .ascii "Taylor\0"
    .rept 33
    .byte 0
    .endr
    .ascii "2224 S Johannan St\nChicago, IL 12345\0"
    .rept 203
    .byte 0
    .endr
    .long 29
    
record3:
    .ascii "Derrick\0"
    .rept 32
    .byte 0
    .endr
    .ascii "McIntire\0"
    .rept 31
    .byte 0
    .endr
    .ascii "500 W Oakland\nSan Diego, CA 54321\0"
    .rept 206
    .byte 0
    .endr
    .long 36

file_name:
    .ascii "test.dat\0"
    
.section .text
.globl _start
_start:
    subq  $8, %rsp                 # Allocate space for the file descriptor on the stack
    
    movq  $SYS_OPEN, %rax          # Open the file
    movq  $file_name, %rdi         # Filename
    movq  $0101, %rsi              # Flags: O_WRONLY | O_CREAT
    movq  $0666, %rdx              # Permissions: 0666
    syscall

    movq  %rax, (%rsp)             # Store the file descriptor on the stack

    # Write the first record
    movq (%rsp), %rdi              # Load the file descriptor
    movq $record1, %rsi            # Load the address of the first record
    call  write_record

    # Write the second record
    movq (%rsp), %rdi              # Load the file descriptor
    movq $record2, %rsi            # Load the address of the second record
    call  write_record

    # Write the third record
    movq (%rsp), %rdi              # Load the file descriptor
    movq $record3, %rsi            # Load the address of the third record
    call  write_record

    # Close the file descriptor
    movq  $SYS_CLOSE, %rax
    movq  (%rsp), %rdi
    syscall

    # Exit the program
    movq $SYS_EXIT, %rax
    movq  $0, %rdi
    syscall

```

# 二、英语总结

无。

# 三、其它

今日学习唯一的收获就是使用Chat-GPT解决代码问题。因为书上的代码比较老旧，导致write-records.s编译后运行不起来，一直提示：Segmentation Fault。因为对汇编编程不熟，但又想快速的解决问题，那么Chat-GPT是一个不错的工具，经过Chat-GPT的一番修改，代码已经能运行了，大大节省了分析错误的时间。

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
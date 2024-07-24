《Programming from the Ground Up》学习第4天，p75-p87总结，总计13页。

# 一、技术总结

## 1.persistent data

p75, Data which is stored in files is called persistent data, because it persists in files that remain on disk even when the program isn't running.

存储在文件中的数据称为persistent data，因为即使程序每页运行，数据仍保留在磁盘上的文件里。

## 2.buffer

p76, A buffer is a continuous block of bytes used for bulk data transfer. When you request to read a file, the operating system needs to have a place to store the data it reads. That place is called a buffe.

Another thing to note is that buffers are a fixed size, set by the programmer. 

## 3.equ指令

这是本书有一个不大好的地方，很多指令首次引入的时候缺少定义。例如p80, For example, if you did .equ LINUX_SYSCALL, 0x80， any time after that you wrote LINUX_SYSCALL, the assembler would susbstitue 0x80 for that。

这里作者应该介绍下equ是什么？参考《x64 Assembly Language Step-by-Step: Programming with Linux》p211, A statement contianing the directive EQU is called an equate. An equate is a way of associating a values with a label。这样我们就知道了equ这三个字母来自于equate，这样也方便了初学者记忆。

## 4.constant(常量)

p88, In programming, a constant is a value that is assigned when a program assembles or compiles, and is never changed.在编程中，constant(常量)是在程序汇编或者程序编译时分配的值，分配后就不再改变。

# 二、英语总结

## 1.tedious

(1)tedious < tedium < taedium。

(2)taed-: feelings of being weary of tired。

(3)tedium: u. the quality of being boring for a long time。

(4)tedious: adj. If you describe sth shuch as a job, task, or situation as tedious, you mean it is boring and rather frustrating。词组：be tedious to do sth。

p77, First, it is tedios to type. You would have to type 500 numbers after the .byte declaration, and they wouldn't be used for anything but to take up space.

## 2.meat

p80, That's a useful trick in writing complex programs-first decide the meat of what is being done.

"meat"用的最多的意思是“u.the flesh of animals(肉)”。这里是一种比喻意义的用法，meat在这里的意思是“n. the core part of sth.”，所以，上没这句话的意思就是“首先决定主要目标这种技巧在编写复杂程序时很有用”。

## 3.help out/help (someone) out

p80,In this program we will also introduce a new directive, .equ which should help out。

在这句话中，help out把宾语省略了，应该是help us out, 或者help you out，这样更容易理解，即.equ指令会对我们有所帮助。

# 三、其它

p77，Second, it uses up space in the executable.这句话翻译成中文的意思是“其次，它会用尽可执行文件中的空间”，不是很理解这里为什么使用use up来描述，感觉和use的意思更接近。

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
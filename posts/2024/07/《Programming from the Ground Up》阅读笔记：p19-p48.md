《Programming from the Ground Up》学习第2天，p19-p48总结，总计30页。

# 一、技术总结

## 1.object file

p20, An object file is code that is in the machine's language, but has not been completely put together。

之前在很多地方都看到object file这个概念，但都没有看到起定义，这次终于搞清楚了——object文件就是包含机器语言的文件。

## 2.汇编语言实现求最大值

```
#PURPOSE: This program finds the maximum number of a
#         set of data items.

#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data
#
.section .data
data_items:
  .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

  .section .text

  .global _start
_start:
  movl $0, %edi
  movl data_items(,%edi,4),%eax
  movl %eax, %ebx
start_loop:
  cmpl $0,%eax
  je loop_exit
  incl %edi
  movl data_items(,%edi,4),%eax
  cmpl %ebx, %eax
  jle start_loop

  movl %eax, %ebx
  jmp start_loop
loop_exit:
  movl $1,%eax
  int $0x81
```

这里作者花了大量的篇幅做解释，但个人觉得在“使用哪种寄存器，为什么使用这种寄存器？”这点上作者没有解释清楚，可能会在后面介绍，先继续往下读。

# 二、英语总结

## 1.overwhelm

(1)over-: above, higher in power, above normal...

(2)whelm: turn upside down。

vt. to cause sb to feel strong emotion。

## 2.diligence

(1)dis-:apart。

(2)*leg-: to collect, gather。

以上两个组合起来的意思是“to pick out, select”， u. the quality of working carefully and with a lot of effort。

## 3.tinker

vi. to make small change to sth。tinker around with sth和tinker with sth意思一样。

## 4.process vs processing

A process is a series of steps taken to achieve something, such as the process of making cake.
1. Gather ingredients
2. Mix ingredients
3. Bake
4. Decorate cake

Processing is when you do things to a substance in order to change it. For example: the processing of oil into gasoline.
process的意思是“步骤”，processing的意思是“处理”。

# 三、其它

工作中一位很合得来的同事过完这个月就离职了，有点舍不得。这位同事平时说话温和，情绪稳定，做事沉稳，中正平和，在工作上算得上是一位良好的合作者，祝他未来一切顺遂。

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
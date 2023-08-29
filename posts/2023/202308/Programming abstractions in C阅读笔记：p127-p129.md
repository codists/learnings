《Programming Abstractions In C》学习第51天，p127-p129，总结如下：

# 一、技术总结

## 1. string library

掌握常用函数如strlen，strcpy用法。

## 2.buffer overflow(缓冲区溢出)

(1)什么是buffer?

p129，Arrays that are preallocated and later use as a repository for data called buffers。

(2)什么是缓冲区溢出？

p129，Writing data past the end of an buffer is a common programming error called buffer overflow。

```c
//buffer overflow示例
char *src = "Hello";
char dst[1]; // dst称为buffer

strcpy(dst, src); // 该操作会导致buffer overflow问题
```

书中只是做一个简单的说明，具体可参考：

(1) wikipedia, Buffer overflow: https://en.wikipedia.org/wiki/Buffer_overflow

# 二、英语总结

##  1.“The function will go ahead and copy characters right on past the end of the buffer.”语法分析

答：这里的应该是The function will go ahead and (copy characters right) (on past the end of the buffer)，这句话有几个要注意的地方：

(1)right

adv. exactly or all the way(完全地)，指的是“一直复制/继续复制”。在原文中也有一点"强调"的意思--虽然字符串已经超过了缓冲区的长度(Buffersize)，但是strcpy函数还是会复制。当然，副词在句子中往往可以忽略，直接理解为copy也是可以的。

(2)on the end

这里之所以用on， 可能是因为data对buffer而言是on，例如：I have a pimple right on the end of my nose。参考：https://ell.stackexchange.com/questions/111682/on-the-end-of-something

(3)past

这里为什么使用past呢？如果不用，那么on the end of buffer也说得通。这里之所以用past，表示已经超过了缓冲区，past取“prep. to a position that is further than a particular point”之意。

## 2.obligation什么意思？

答：

(1)oblige：ob-("to") + ligare("to bind")，to bind by oath(以誓言约束)。

(2)oblige > obligation：obligation的意思是“n. the fact that you are obliged to do sth”(义务，责任)

p129，"you have an obligation to check the length of the source string before you copy it using strpy"。

## 3.equivalent of语法分析

答：p129，“Thus，the Pig Latin equivalent of any is anyway”，初看到这句话的时候心里是困惑的，因为记忆中都是把equivalent当做形容词用，后面接to。这里接of，那么就是用作名词：n. sth that has the same amount,value, purpose etc as sth else。

# 三、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)

欢迎搜索及关注：编程人(a_codists)

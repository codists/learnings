《Programming from the Ground Up》学习第6天，p95-p102总结，总计8页。

# 一、技术总结

## 1.directive(伪指令)

很多资料喜欢把directive和instruction都翻译成“指令”，这样在看到指令这个词时就不知道到底指的是什么？这里参考其它人的做法，将directive称为“伪指令”。

## 2.rept  & .endr

语法：

```
.rept count

...

.endr
```

(1).rept: rept是"repeat"的缩写，表示.rept和.endr之间的内容重复count次。

(2).endr: endr是“end repeat”的缩写。

```
record2:
 .ascii "Marilyn\0"
 .rept 32 #Padding to 40 bytes
 .byte 0
 .endr
```

如上所示，"Marilyn\0"长度是8，占8个bytes, 重复0 byte 32次，所以是“Padding to 40 bytes”。

## 3.bit、byte、word

(1)bit

bit就是0或者1，即0是一个bit，1也是一个bit。01是两个bit，00000000是八个bit。

(2)byte

1 byte = 8 bit。

(3)word

word由多少个byte构成取决于电脑是多少位的：

**16-bit architecture**: A word is 2 bytes (16 bits).

**32-bit architecture**: A word is 4 bytes (32 bits).

**64-bit architecture**: A word is 8 bytes (64 bits).

(4)示例

《programming from the ground up》:p96, In this, everything is character data except for the age, which is simply a numeric field, using a standard 4-byte word(we could just use a single byte for this, but keeping it at word makes it easier to process)。

# 二、英语总结

## 1.open back up 

p95, You can shut down the program and open it back up, and you are back where you started.

在上面这句话中“open it back up”的意思是“re-open, open again”。

## 2.be off with

p95, Structured data can contain variable-length fields, but at that point you are usually better off with a database.

在这句话话中“be better off with database”翻译过是“最好使用数据库”。

## 3.have sth down vs have sth down pat

have sth down的意思是“know it”，have sth down pat的意思是“know it perfectly”。示例：

p100，Now that we have our basic definitions down, we are ready to write oure programs.

# 三、其它

《Progromming From The Ground Up》p104写着：as write-record.s -o write-record.o，但前面都没有提到哪里定义了write-record.s这个文件，整本书翻遍了都没有找到。此时转到Github上去找，发现了别人写的write-record.s文件。

书上没有写哪段代码是写在这个文档，为什么别人知道呢？个人猜测是看到了as write-record.s -o write-record.o 这句命令，知道放到这里。这种灵活转换是我目前需要学习的。根据已有的条件去实现目标，不纠结于问题或错误。

# 四、参考资料

## 1. 编程

(1)Jonathan Bartlett，《Programming From The Ground Up》：https://book.douban.com/subject/1787855/

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridge  Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
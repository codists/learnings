《Programming Abstractions In C》学习第50天，p123-p126，总结如下：

# 一、技术总结

## 1.notaion

这也是一个在计算机相关书籍中出现的词，但有时却不是那么好理解，因为它可以指代很多对象，这里做一个记录。示例：p124。

In C, you can use any character array to hold string data.

```c
char str[6] = {'h', ' ', 'l', ' ', 'o', '\0'};
```

or, more compactly, 

```c
char str[6] = "hello";
```

If you use array notation, the standar idion for processing every character in a string looks like this:

```C
for (int i = 0; str[i] != '\0'; i++) {

  printf("i=%d\n", str1[i]);

}
```

在这里，“notation”以理解为“the activity of representing sth by a special system of marks or character”，即“notation”表示的是一种“标记方法”、“表示方法”。

2.字符串用法示例

```C
#include <stdio.h>

// 统计字符串中的空格(space):数组版
static int CountSpaces(char str[]) {
    int i, nSpaces;

    nSpaces = 0;
    for (i = 0; str[i] != '\0'; i++) {
        if (str[i] == ' ') {
            nSpaces++;
        }
    }
    return nSpaces;
}

// 统计字符串中的空格(space)：指针版
static int CountSpaces1(char *str) {
    int nSpaces;
    char *cp;

    nSpaces = 0;
    for (cp = str; *cp != '\0'; cp++) {
        if (*cp == ' ') {
            nSpaces++;
        }
    }
    return nSpaces;

}


int main() {
    // 方式一：declare and initialize a string "hello"
    char str1[6] = {'h', ' ', 'l', ' ', 'o', '\0'};
    // 遍历字符串
    for (int i = 0; str1[i] != '\0'; i++) {
        printf("i=%d\n", str1[i]);
    }

    // 方式二：更紧凑(compactly)
    char str2[6] = "hello";

    // 统计字符串中的空格
    int n;
    n = CountSpaces(str1);
    printf("\nthe number of spaces in string is: %d\n", n); // 2

    // 统计字符串中的空格
    int n1;
    n1 = CountSpaces1(str1);
    printf("\nthe number of spaces in string is: %d\n", n1); // 2


}

```

# 二、英语总结

1.perfectively什么意思？

答：perfect是“完美的”之意，但是perfectly翻译的时候直接翻译成"完美地"却不大合适。应该翻译成"adv. perfectly can alse mean very or compeletly"（很，非常）更好，当然，其实这个意思也是“in a perfect way”。

2.likelihood什么意思？

答：u.the chance than sth will happen(可能性)，同义词：possibility。

# 三、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)

欢迎搜索及关注：编程人(a_codists)

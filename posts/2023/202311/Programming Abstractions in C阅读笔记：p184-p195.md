《Programming Abstractions In C》学习第62天，p184-p195总结。

# 一、技术总结

## 1.mutual recursion

## 2.natural number

(1)定义

p184, If you limit the domain of possible values to the set of natural numbers,which are defined simply as the set of nonnegative integers.

## 3.最大公约数

```C
/*
 * p191. 3. The greatest common divisor(g.c.d) of two nonnegative integers is the
 * largest integer that divides evenly into both. In the third century B.C., the
 * Greek mathematician Euclid discovered that the greatest common divisor of x
 * and y can always be computed as follows:
 *
 * If x is evenly divisible by y, then y is the greatest common divisor.
 * Otherwise, the greatest common divisor of x and y is always equal to the
 * greatest common divisor of y and the remainder of x divided by y.
 *
 * Use Euclid insight to write a recursive function GCD(X, Y) that computes the
 * greatest common divisor x and y.
 */
#include <stdio.h>

int gcd(int x, int y);

/*
 * function: gcd
 * Usage: int(x, y)
 * ------------
 */
int gcd(int x, int y) {
    if (x % y == 0) {
        return y;
    }
    return gcd(y, x % y);
}


int main() {
    int result;
    result = gcd(16, 28);
    printf("GCD=%d\n", result);  // GCD=4
    return 0;
}
```

# 二、英语总结

## 1.holistic是什么意思？

答：

(1)holistic: holism + -istic。adj. treat the whole of sth and not just a part(整体的)。

(2)holism: holos("whole"，来自于“*sole”，完整的) + -ism(word-forming element making nouns implying a practice, system, doctrine, etc. 构成词的元素，暗示实践、制度、学说等)。u. the belief that each thing is a whole that is more important the parts that make it up，整体论。

(3)-istic: adjectival word-forming element(构成形容词的元素)。

(4)示例：p185, Maintain a holistic perspective(保持整体的观点)。

## 2.philosophical是什么意思?

(1)philosophical: philosophy + -ical。adj. relating to the study of philosophy(哲学的)。

(2)philosophy: philo-("loving") + sophia("knowledge, wisdom")，哲学。

## 3.devote是什么意思？

答：de-(down from，away from, 离开) + vow(to vow“make a promise to do sth, 发誓”)，即as if by vow。

(1) vt. to use sth for a particular purpose（使用）。p185，In Chapter 2 of The Art and Science of C, I devote one section to the philosophical concepts of holism and reductionnism(在《在C语言的科学与艺术》第二章，我专门用一节来介绍整体论与还原论这两个哲学概念。)

## 4.odds are good是什么意思？

答：

(1)odds: n. the probalility that a particular thing will or will not happend(可能性)。

(2)odds are good: There is a high probability that it will happen(可能性很大)。

(3)示例：p185,After all, when you write a program, the odds are good--even if you are an experienced programmer--that your program won't work the first time。

# 三、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
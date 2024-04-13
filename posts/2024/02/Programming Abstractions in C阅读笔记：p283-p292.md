《Programming Abstractions in C》学习第72天，p283-p292总结，总计10页。

# 一、技术总结

## 1、anylasis of algorithms

算法分析——即判断程序的效率(efficiency)。

## 2、mathematical induction(数学归纳法)

## 3、Big-O notation(大O标记法)

## 4、constant time(常量时间)

## 5、linear time(线性时间)

p292, The computational complexity of the part of the Average function is O(N), which is commonly called linear time。

```
double Average(double array[], int n) {
    int i;
    double total;

    total = 0;
    for (i = 0; i < n; i++) {
        total += array[i];
    }
    return total / n;
}
```

# 二、英语总结

## 1、**mission是什么意思？**

答：c. any work that sb believes it is their duty to do(工作，任务)。p285, Your mission is to write a function SortIntegerArray(array, n) that rearranges the elements into ascending order。

## 2、**proportional是什么意思？**

答：

(1)A is proportional to B(A与B成正比)。示例：p287, Thus, the time required on the first cycle of the loop is presumably proportional to N。

## 3、**dominate是什么意思？**

答：*dem-("house, household"), vt. to be more import, powerful, or successful than other.p291, As N increases, the term involving N^2 quickly dominates the term involving N。虽然dominate的主要意思是“控制，占据主导地位”，但是翻译时比较灵活，这里可翻译为“超过”。


# 三、其它

无。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
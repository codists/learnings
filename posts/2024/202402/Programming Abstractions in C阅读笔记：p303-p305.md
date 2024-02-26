《Programming Abstractions in C》学习第74天，p303-p305总结，总计3页。

# 一、技术总结

## 1.时间复杂度分类(complexity classes)

| Class       | Notation | Example                                           |
| ----------- | -------- | ------------------------------------------------- |
| constant    | O(1)     | Returning the first element in an array           |
| logarithmic | O(logN)  | Binary search in a sorted array                   |
| linear      | O(N)     | Linear search in an array                         |
| NlogN       | O(NlogN) | Merge sort                                        |
| quadratic   | O(N^2)   | Selection sort                                    |
| cubic       | O(^3)    | Conventional algorithms for matrix multiplication |
| exponential | O(2^N)   | Tower of Hanoi                                    |

当然，这个分类并不是绝对的，只是常见的。

# 二、英语总结

## 1.substantial是什么意思？

答：adj. large in size(sizeable)。p305, Even though the selection sort example makes it cleaar that quadratic algorithms have substantial performance problems (严重的性能问题)for large values of N， algorithms whose complexity is O(2^N) are considerably worse。

## 2.tractable是什么意思？

答：tractare("to handle, manage", treat)， adj. easily controlled。p305,  As a general rule of thumb(根据经验)， computer scientists classify problem that can be solved susing algorithms that run in polynomial time as tractable, in the sense that they are amenable to implementation on a computer。


# 三、其它

通过7.4小结掌握常见时间复杂度的分类。内容不难理解，但是一些英语词汇的理解比较难。例如：rule a thumb(根据经验)， be amenable to等。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
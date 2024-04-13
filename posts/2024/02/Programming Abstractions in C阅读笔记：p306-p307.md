《Programming Abstractions in C》学习第75天，p306-p307总结，总计2页。

# 一、技术总结

## 1.Quicksort algorithm(快速排序)

由法国计算机科学家C.A.R(Charles Antony Richard) Hoare（东尼.霍尔）在1959年开发(develop), 1961年发表(publish)。

这里吐槽下维基百科的中文介绍："在平均状况下，排序n个项目要O(nlogn)(大O符号)次比较。在最坏情况下则需要O(n^2)次比较，但这种情况并不常见。"——这句话初看显得莫名其妙，这里的“排序”到底用的是什么排序算法？毫无上下文，难以理解。而英文介绍则好理解得多——“Mathematical analysis of quicksort show that, on average, the algorithm takes O(nlogn) comparisons to sort n items. In the worst case, it makes O(n^2) comparison ”，英文明显的指出使用的是快速排序。不知道为什么很多中文介绍经常是省略了很多内容。

# 二、英语总结

## 1.substantial是什么意思？

答：adj. large in size(sizeable)。p305, Even though the selection sort example makes it cleaar that quadratic algorithms have substantial performance problems (严重的性能问题)for large values of N， algorithms whose complexity is O(2^N) are considerably worse。

## 2.tractable是什么意思？

答：tractare("to handle, manage", treat)， adj. easily controlled。p305, As a general rule of thumb(根据经验)， computer scientists classify problem that can be solved susing algorithms that run in polynomial time as tractable, in the sense that they are amenable to implementation on a computer。

## 3.demonstrate是什么意思？

答: de-(entirely) + monstrare(point out, show)。 vt. If you could choose the optimal boundary between the small and large elements on each cycle, this algorithm would divide the array in half each time and end up demonstrating(表现出) the same qualitative characteristics. 这里的 end up 后面跟Ving形式，常翻译成finally(最终)。

## 4.demarcation是什么意思？

答：

(1)demarcate: de-(from) + marcar(to mark the boundaries of), vt. to show the limit of sth。

(2)demarcation: a board or a rule that show the limit of sth。

p307, For example, a common approach is to pick the first element, which was 56 in the original array, and use it as the demarcation point between small and large element。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
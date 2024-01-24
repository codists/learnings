《Programming Abstractions in C》学习第69天，p248-p253总结，总计6页。

# 一、技术总结

“A generalized program for two-player games”如标题所示，该小节强调要学会从一个复杂的程序中抽象出通用的内容——这也是本书的主旨——“Programming Abstractions in C”。示例：

```
#include <stdio.h>


int main() {
    stateT state;
    moveT move;

    GiveInstructions();
    state = NewGame();
    while (!GameIsOver(state)) {
        DisplayGame(state);
        switch (WhoseTurn(state)) {
            case Human:
                move = GetUserMove(state);
                break;
            case Computer:
                move = ChooseComputerMove(state);
                break;
        }
        MakeMove(state, move);
    }
    AnnounceResult(state);
}
```

# 二、英语总结

## 1.terribly是什么意思？

答：p253, You may not terribly interested in a program that plays a nim; after all, nim is rather boring once you figure it out。

(1)terribly 有时候是“very badly”的意思，强调不好；示例：I slept terribly last night。

(2)有时候也可以仅表示“very”的意思。 I'm terribly pleased to hear that you've got a job。

## 2.transcend是什么意思?

答：*trans-(across， beyond) + scan(to clime)。vt. to go farther, rise above, or be more important or better than sth, especially a limit(超越)。

p253, The process of abstraction consists partly of defining these concepts as general types, with names like stateT and moveT, that transcend the details of any specific game。

## 3.whatsoever是什么意思？

答：

(1)whatso(what-，"whatever") : an emphatic referring to things。

(2)whatever + ever: a double intensive of what。

(3)whatsoever: used aftr a negative phrase to add emphasis to the idea that is being expressed()。

示例：p253, It is important to notice that the main program gives no indication whatsoever about what th actual game is。

# 三、其它

前天南昌下雪了，到今天雪还没化完，冷得很。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
《Programming Abstractions in C》学习第79天，p331-p337，总计7页。

# 一、技术总结

```
/*
 * File: stack.h
 * -------------
 * This interface defines an abstraction for stacks. In any
 * single application that uses this interface, the values in
 * the stack are constrained to a single type, although it
 * is easy to change that type by changing the definition of
 * stackElementT in this interface.
 */

#ifndef _stack_h
#define _stack_h

#include "genlib.h"

/*
 * Type: stackElementT
 * -------------------
 * The type stackElementT is used in this interface to indicate
 * the type of values that can be stored in the stack. Here the
 * stack is used to store values of type double, but that can
 * be changed by editing this definition line.
 */

typedef double stackElementT;

/*
 * Type: stackADT
 * --------------
 * The type stackADT represents the abstract typed used to store
 * the elements that have been pushed. Because stackADT is
 * defined only as a pointer to a concrete structure that is not
 * itself defined in the interface, clients have no access to
 * the underlying fields.
 */

typedef struct stackCDT *stackADT;

/*
 * Function: NewStack
 * Usage: stack = NewStack();
 * --------------------------
 * This function allocates and returns a new stack, which is
 * initially empty.
 */

stackADT NewStack(void);

/*
 * Function: FreeStack
 * Usage: FreeStack(stack);
 * ------------------------
 * This function free the storage associated with the stack.
 */

void FreeStack(stackADT stack);

/*
 * Function: Push
 * Usage: Push(stack, element);
 * ----------------------------
 * This function pushes the specified element onto the stack;
 */
void Push(stackADT stack, stackElementT element);


/*
 * Function: Pop
 * Usage: element = Pop(stack);
 * -----------------------------
 * This function pops the top element from the stack and returns
 * that value. The first value popped is always the last one
 * that was pushed. If the stack is empty when Pop is called,
 * the function calls Error with an appropriate message.
 */

stackElementT Pop(stackADT stack);


/*
 * Function: StackIsEmpty, StackIsFull
 * Usage: if (StackIsEmpty(stack)) ...
 *        if (StackIsFull(stack)) ...
 * ---------------------------------------
 * This function test whether the stack is empty or full.
 */

bool StackIsEmpty(stackADT stack);
bool StackIsFull(stackADT stack);

/*
 * Function: StackDepth
 * Usage: depth = StackDepth(stack);
 * ---------------------------------
 * This function returns the number of elements currently pushed
 * on the stack.
 */
int StackDepth(stackADT stack);


/*
 * Function: GetStackElement
 * Usage: element = GetStackElement(stack, index);
 * -----------------------------------------------
 * This function returns the element at the specified index in
 * the stack, where the top of the stack is defined as index 0.
 * For example, calling GetStackElement(stack, 0) returns the top
 * element on the stack without removing it. If the caller tries
 * to select an out-of-range element, GetStackElement calls Error.
 * Note: This function is not a fundamental stack operation and
 * is instead provided principally to facilitate debugging.
 */
stackElementT  GetStackElement(stackADT stack, int index);

#endif
```

# 二、英语总结

## 1.polymorphism是什么意思？

答：

(1)polymorphous > polymorph > polymorphism

(2)polymorphous: poly"many" + morphē "shape, form,"。adj. have various forms。

(3)polymorphism: capability of existing in different forms(多态性)。

p332, the ability to apply the same function to objects of different types called polymorhpism。

## 2.overhead用法总结

答：

(1)n. the regular and necessary costs(开销)。p332, In some cases, however, forcing the clients to use pointer as data values imposes an unacceptable level of overhead.

平时大多做副词用，也可以做名词。

## 3.compromise是什么意思？

答：com-(together) + promise，c/u. a joint promise to abide by an arbiter's decision(妥协)。 abide by sth: to accept or obey an aggrement。

## 4.as far as sth is concerned是什么意思？

答：If we are discussing or thinking about a particular thing(就......而言)。

## 5.relinquish是什么意思？

答：vt. to give up sth such as responsibility or claim(放弃，舍弃)。p335, Thus, in addition to the function NewStack, you need a symmetric funciton FreeStack, that takes a buffer and relinquishes any dynamically allocated storage it contains。

## 三、其它

并不是每一篇文章都是有意义的，这只是学习过程的一个记录。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
《Programming Abstractions in C》学习第80天，p338-p346，总计9页。

# 一、技术总结

栈的实现包括入栈、出栈、判断栈是否为满，判断栈是否为空等。作者结合RPN计算器来实现，稍显无聊。



```
/*
 * File: rpncalc.c
 * ---------------
 * This program simulates an electronic calculator that uses
 * reverse Polish notation, in which the operators com after
 * the operands to which they apply.
 */

#include <stdio.h>
#include <ctype.h>
#include "genlib.h"
#include "simpio.h"
#include "strlib.h"
#include "stack.h"

/* Private function prototypes */

static void ApplyOperator(char op, stackADT operandStack);

static void HelpCommand(void);

static void ClearStack(stackADT operandStack);

static void DisplayStack(stackADT operandStack);

/* Main program */
int main() {
    stackADT operandStack;
    string line;
    char ch;

    printf("RPN Calculator Simulator (type H for help)\n");
    operandStack = NewStack();
    while (TRUE) {
        printf("> ");
        line = GetLine();

        ch = toupper(line[0]);
        switch (ch) {
            case 'Q':
                exit(0);
            case 'H':
                HelpCommand();
                break;
            case 'C':
                ClearStack(operandStack);
                break;
            case 'S':
                DisplayStack(operandStack);
                break;
            default:
                if (isdigit(ch)) {
                    Push(operandStack, StringToReal(line));
                } else {
                    ApplyOperator(ch, operandStack);
                }
                break;

        }
    }

    return 0;
}

/* Private functions */

/*
 * Function: ApplyOperator
 * Usage: ApplyOperator(op, operandStack);
 * ---------------------------------------
 * This function applies the operator to the top two elements on
 * the operand stack. Because the elements on the stack are
 * popped in reverse order, the right operand is popped before
 * the left operand.
 */

static void ApplyOperator(char op, stackADT operandStack) {
    double lhs, rhs, result;

    rhs = Pop(operandStack);
    lhs = Pop(operandStack);
    switch (op) {
        case '+':
            result = lhs + rhs;
            break;
        case '-':
            result = lhs - rhs;
            break;
        case '*':
            result = lhs * rhs;
            break;
        case '/':
            result = lhs / rhs;
            break;
        default:
            Error("Illegal operator %c", op);
    }
    printf("%g\n", result);
    Push(operandStack, result);
}

/*
 * Function: HelpCommand
 * Usage: HelpCommand();
 * ---------------------
 * This function generate a help message for the user;
 */

static void HelpCommand(void) {
    printf("Enter expression in Reverse Polish Notation, \n");
    printf("in which operators follow the operands to which\n");
    printf("they apply. Each line consists of a number, an\n");
    printf("operator, or one of the following commands: \n");
    printf("  Q -- Quit the program\n");
    printf("  H -- Display this help message\n");
    printf("  C -- Clear the calculator stack\n");
    printf("  S -- Display all values in the stack\n");
}


/*
 * Function: ClearStack
 * Usage: ClearStack(stack);
 * -------------------------
 * This function clears the stack by popping elements until it is
 * empty.
 */
static void ClearStack(stackADT stack) {
    while (!StackIsEmpty(stack)) {
        (void)Pop(stack);
    }
}

/*
 * Function: DisplayStack
 * Usage: DisplayStack(stack);
 * ---------------------------
 * This function displays the contents of a stack.
 */

static void DisplayStack(stackADT stack) {
    int i, depth;

    printf("Stack: ");
    depth = StackDepth(stack);
    if (depth == 0) {
        printf("empty\n");
    } else {
        for (i = depth - 1; i >= 0; i--) {
            if (i < depth - 1) {
                printf(", ");
            }
            printf("%g", GetStackElement(stack, i));
        }
    }
}

```

完整代码见：https://github.com/codists/Programming-Abstractions-In-C/tree/main/chapter8

# 二、英语总结

## 1.insulation是什么意思？

答：

(1)insulate > insulation

(2)insulate: from insula“island”(isle)。 vt. to cover and surround sth with materials。

(3)insulation: u. the substance used in insulating。

p345, By using StackDepth(stack) form, you provide a layer of insulation between the client and the implementation.

## 2.auxiliary是什么意思？

答：*aug-"to increase"。adj. giving help, especially to a more import person(辅助的)。

## 三、其它

今日没有什么想说的。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
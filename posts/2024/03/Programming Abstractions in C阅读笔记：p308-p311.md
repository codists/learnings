《Programming Abstractions in C》学习第76天，p308-p311总结，总计4页。

# 一、技术总结

## 1.快速排序伪代码

```
#include <stdbool.h>

static int Partition(int array[], int n);

/*
 * Implementation notes: SortIntegerArray
 * --------------------------------------
 * This implementation of SortIntegerArray uses the Quicksort
 * algorithm, which begins by "partitioning" the array so that
 * all elements smaller than a designated pivot element appear
 * to the left of a boundary and all equal or larger values
 * appear to the right. Sorting the subarrays to the left and
 * right of boundary ensures that the entire array is sorted.
 */

void SortIntegerArray(int array[], int n) {
    int boundary;

    if (n < 2) {
        return;
    }
    boundary = Partition(array, n);
    SortIntegerArray(array, boundary);
    SortIntegerArray(array + boundary + 1, n - boundary - 1);
}

/*
 * Function: Partition
 * Usage: boundary = Partition(array, n);
 * --------------------------------------
 * This function rearranges the elements of array relative to
 * a pivot value, which is taken from array[0]. The partition
 * function returns a boundary index such that array[i] < pivot
 * for all i < boundary, array[i] == pivot for i == boundary,
 * and array[i] >= pivot for all i > boundary.
 */

static int Partition(int array[], int n) {
    int lh, rh, pivot, temp;

    pivot = array[0];
    lh = 1;
    rh = n - 1;

    while (true) {
        while (lh < rh && array[rh] >= pivot) {
            rh--;
        }
        while (lh < rh && array[lh] < pivot) {
            lh--;
        }
        if (lh == rh) {
            break;
        }
        temp = array[lh];
        array[lh] = array[rh];
        array[rh] = temp;
    }
    if (array[lh] >= pivot) {
        return 0;
    }
    array[0] = array[lh];
    array[lh] = pivot;
    return lh;
}
```

## 2.快速排序时间复杂度

平均时间复杂度：O(NlogN)， 最坏时间复杂度：O(N^2)。

# 二、英语总结

## 1.fairly是什么意思？

p308, Tony Hoare's approach to partioning is fairly easy to explain in English。

答：

(1)fair: adj. fair比较常用的意思是：treating someone in a way that is right or reasonable(公正的，公平的)；但也有一个用得比较少的意思: quite large。 

(2)fairly: fair + ly。adv. more than average, but less than very(相当地)。 

## 2.coincide是什么意思？

p308, Move the rh index to the left until it either coincides with lh or points to an element containing a value that is small with respect to the pivot。

答：com-(together) + incidere(to fall upon)。vi. to come together in position / to happen at or near the same time。

## 3.roughly是什么意思？

答：

(1)rough: adj. a. not even(均匀) or smooth(光滑)， often because of being in bad condistion。b. not exact or detailed(大致)。

p311, Moreover the running times for both algorithms appear to grow in roughly the same way。

## 4.appear to 是什么意思？

答：vi. to seem(看起来，似乎)

## 三、其它

英语阅读要想快速理解，就得尽可能把每个单词的所有意思都记录，如上面的：fairly——最常用的意思就是“公平地”，但书中明显不是这个意思，而是“quite large(相当地)”，平时用得少，没有在意，导致整个句子无法理解。还有rough也是，常用意思是"not smooth(粗糙的)"，但也有“not exact or detailed(大致的)”之意。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
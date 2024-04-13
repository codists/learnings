《Programming Abstractions in C》学习第73天，p293-p302总结，总计10页。

# 一、技术总结

## 1.时间复杂度

(1)quadratic time(二次时间)

p293, Algorithms like selection sort that exhibit O(N^2) performance are said to run in quadratic time。

## 2.线性查找(linear search)

p293, Because the for loop in the implementation executes n time, you expect the performance of LinearSearch——as its name implies——to be O(N)。时间复杂度为O(N)的查找称为线性查找。

## 3.归并排序(merge sort)

书中并为对归并排序做严格的定义。p298, The merge operation, combined with recursive decomposition, gives rise to a new sorting algorithm called merge sort, which you can implement in straightforward way. The basic idea of the algorithm can be outlined as follows:

1. Check to see if the array is empty or has only one element. If so, it must alread be sorted, and the function can return without doing any work. This condition defines the simple case for the recursion.
2. Divide the array into two new subarrays, each of which is half the size of the original.
3. Sort each of the subarrasy recursively.
4. Merge the two subarrays back into the original one.

```
/*
 * 伪代码
 */
static void Merge(int array[], int arr1[], int n1, int arr2[], int n2);
static int *CopySubArray(int array[], int start, int n);
void SortIntegerArray(int array[], int n);
/*
 * Function: SortIntegerArray
 * Usage: SortIntegerArray(array, n);
 * ----------------------------------
 * This function sorts the first n elements of array into
 * increasing numerical order using the merge sort algorithm,
 * which requires (1) dividing the array into two halves,
 * (2) sorting each half, and (3) merging the halves together.
 */
void SortIntegerArray(int array[], int n) {
    int n1, n2, *arr1, *arr2;

    if (n <= 1) {
        return;
    }
    n1 = n / 2;
    n2 = n - n1;

    arr1 = CopySubArray(array, 0, n1);
    arr2 = CopySubArray(array, 0, n2);
    SortIntegerArray(arr1, n1);
    SortIntegerArray(arr1, n2);
    Merge(array, arr1, n1, arr2, n2);
    FreeBlock(arr1);
    FreeBlock(arr2);
}

/*
 * Function: Merge
 * Usage: Merge(array, arr1, n1, arr2, n2);
 * ----------------------------------------
 * This function merges two sorted arrays (arr1 and arr2) into a
 * single output array. Because the input arrays are sorted, the
 * implementation can always select the first unused element in
 * one of the input arrays to fill the next position in array.
 */

static void Merge(int array[], int arr1[], int n1, int arr2[], int n2) {
    int p, p1, p2;

    p = p1 = p2 = 0;
    while (p1 < n1 && p2 < n2) {
        if (arr1[p1] < arr2[p2]) {
            array[p++] = arr1[p1++];
        } else {
            array[p++] = arr2[p2++];
        }
    }
    while (p1 < n1) {
        array[p++] = arr1[p1++];
    }
    while (p2 < n2) {
        array[p++] = arr2[p2++];
    }
}

/*
 * Function: CopySubArray
 * Usage: CopySubArray(array, arr1, n1, arr2, n2);
 * -----------------------------------------------
 * This function makes a copy of a subset of an integer array
 * and returns a pointer to a new dynamic array containing the
 * new elements. The array begins at the indicated start
 * position in the original array and continues for n elemnts.
 */

static int *CopySubArray(int array[], int start, int n) {
    int i, *result;

    result = NewArray(n, int);
    for (i = 0; i < n; i++) {
        result[i] = array[start + i];
    }
    return result;
}

```


# 二、英语总结

## 1.quadratic是什么意思？

答：In mathematics by 1660s;the algebraic quadratic euqation(二次方程, 1680s) are so called because they involve the square(x^2) and no higher power of x。这里要注意quarter是四分之一，但是quadratic是二次(x^2)的意思。

## 2.sophistication是什么意思？

答：

(1)sophist > sophiticate > sophistication。

(2)sophist: one who makes use of fallacious arguments(诡辩者)。

(3)sophistication: u. the quality of being sophisticated(老练， 复杂度)。

p293, The problem, howerver is that average-case analysis is much more difficult to carry out and typically requires considerable mathematical sophistication。这里比较重要的一点是虽然这里用的是名词sophistication，但是因为翻译的时候需要转一下，mathematical sophistication(复杂的数学知识)。

## 3.average用法总结

答：

(1)vt. to reach a particular amount as an average。主语可以是物也可以是人。翻译的时候需要灵活转变。

主语是物：Inquires to our office average 1000 calls a month.

主语是人：p294, From a practical point of view, it is often useful to consider how well an algorithm performs if you average its behavior over all possible sets of input data


# 三、其它

本书中作者讲解归并排序(merge sort)和其它书还是有些不同的，从选择排序算法展开，从而引出归并排序算法，可以和其它书进行对比阅读。

# 四、参考资料

## 1. 编程

(1)Eric S.Roberts，《Programming Abstractions in C》：https://book.douban.com/subject/2003414

## 2. 英语

(1)Etymology Dictionary：[https://www.etymonline.com](https://www.etymonline.com/)

(2) Cambridage Dictionary：[https://dictionary.cambridge.org](https://dictionary.cambridge.org/)


欢迎搜索及关注：编程人(a_codists)
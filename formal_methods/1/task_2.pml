#define N 5 /* constant */

active proctype ARRAY() {
    int a[N];
    int i = 0;

    do
        :: ( i >= N ) -> break;
        :: else -> a[i] = 3; i++;
    od

    /* your code */

    printf("i = %d\n", i);

    i--

    do
        :: ( i == 0 ) -> break;
        :: ( i > 0 ) -> a[i] = 0; i--;
        :: ( i > 0 ) -> a[i] = 1; i--;
        :: ( i > 0 ) -> a[i] = 2; i--;
        :: ( i > 0 ) -> a[i] = 3; i--;
        :: ( i > 0 ) -> a[i] = 4; i--;
        :: ( i > 0 ) -> a[i] = 5; i--;
    od

    i++
    
    printf("i = %d\n", i);

    do
        :: ( i < N ) -> printf("a[%d] = %d\n", i, a[i]); i++;
        :: else -> break;
    od



    printf("\n2.2:\n\n")
    int sum_even = 0;
    i=0;

    do
            :: (i >=N ) -> break
            :: else -> printf("a[%d]=%d\n", i, a[i]) -> sum_even = sum_even + a[i] -> i = i + 2
    od;

    printf("sum of even elems is %d\n", sum_even)

    int sum_odd = 0;
    i=1;

    do
            :: (i>=N) -> break
            :: else -> printf("a[%d]=%d\n", i, a[i]) -> sum_odd = sum_odd + a[i] -> i=i+2
    od;

    printf("sum of odd elems is %d\n", sum_odd)
    printf("sum of all elems is %d\n", sum_odd - sum_even)

    printf("\n2.3:\n\n")
}

void main(void)
{
    static int array[SIZE] = { 5, 27, 3, 11, 56 };
    int i, max1, max2;

    max1 = 1 << 31;
    max2 = max1;

    for (i = 0; i < SIZE; i++) {
        if (array[i] > max1) {
            max2 = max1;
            max1 = array[i];
        } else {
            if (array[i] > max2 && array[i] < max1)
                max2 = array[i];
        }
    }
}

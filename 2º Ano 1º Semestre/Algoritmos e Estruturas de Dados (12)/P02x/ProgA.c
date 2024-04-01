
#include <stdio.h>
#include <stdlib.h>


void progA(int *a, int n, int d)
{
    int a [] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    printArray(a, 12);
    //create an array with the size of a
    int b[] = malloc(sizeof(a));
    cumsum(a, 12, b);
    printArray(b, 12);

    //create an array with the size of b
    int c[6];
    c[0] = 1;
    printArray(c, 6);
    while (c[1] < 10)
    {
        cumsum(c,c)
        printArray(c, 6);
    }
    




}

void printArray(int *a, int n)
{
  int i;
  for(i = 0; i < n; i++)
    printf("%d ", a[i]);
  printf("\n");
}

void cumsum(int *a, int n)
{
  int i;
  for(i = 1; i < n; i++)
    a[i] += a[i - 1];
}

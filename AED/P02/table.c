//
// Tomás Oliveira e Silva, AED, October 2021
//
// program to print a table of the squares and square roots of some integers
//
// on GNU/Linux, run the command
//   man 3 printf
// to see the manual page of the printf function
//

#include <math.h>
#include <stdio.h>

void do_it(int N)
{
  int i;
  FILE * f;

  printf(" n     cos(n)\n");
  printf("-- --- -----------------\n");
  f = fopen("table.txt", "w");
  for(i = 1;i <= N;i++)
    fprintf(f,"%d %f %f\n", i, (cos((double)i * M_PI/180)), (sin((double)i * M_PI/180)));
    
  fclose(f);
}

int main(void)
{
  do_it(90);
  return 0;
}

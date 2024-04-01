//
// Tomás Oliveira e Silva, AED, October 2021
//
// example of function overloading (same function name, different argument numbers and/or data types)
//

#include <iostream>

using std::cout; // make this symbol from the std namespace directly visible

void show(char c)
{
  cout << "show(char): " << c << '\n';
}

//
void show(int a[3])
{
  cout << "array: {" << a[0] << "," << a[1] << "," << a[2] << "}" << '\n';
}
void show(const int i)
{
  cout << "int: "
       << i
       << std::endl;
}

void show(const double d)
{
  cout << "double: "
       << d
       << std::endl;
}

void show(const char *s,const char *h = "string: ") // second argument with default value
{
  cout << h
       << s
       << std::endl;
}

int main(void)
{
  int a[3] = {1,2,3};

  show('a');
  show(a);
  show(1.0);
  show("hello");
  show(-3);
  show("John","name: ");
  return 0;
}

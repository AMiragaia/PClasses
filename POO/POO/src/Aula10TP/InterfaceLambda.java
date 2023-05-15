package Aula10TP;

public class InterfaceLambda {
    public static void main(String[] args) {
        interface StringSum {
            public String sum(String a, String b); //(String s1, String s2) -> s1+s2
        }
        interface inteiro{
            public int soma(int n); //(n) -> (n % 2) == 0
        }
        interface divider{
            public int divide(int n,int d); //(n, d) -> (n % d) == 0;
        }
        interface compare{
            public boolean compareD(String s1,String s2); // (s1, s2) -> { return s1.compareToIgnoreCase(s2); }
        }
        interface Factorial{
            public int factorial(int num); 
        }
        // MyFunc myFactorialFunc = (num) -> {
        //    int fact = 1;
        //  for (int i = 1; i <= num; i++){
        //    fact = i * fact;
        //}
        //return fact;
        //}; 
        interface FunInt{
            public int func(int x, int y); //FunInt f1 = (int x, int y) -> x + y; 
        }
        interface FunIntM{
            public int func(int x, int y); //FunInt f2 = (double x, double y) -> x * y; 
        }
        
    }    
}

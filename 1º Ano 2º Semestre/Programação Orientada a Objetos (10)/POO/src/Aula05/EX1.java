package Aula05;

public class EX1 {
    public static void main(String[] args) {
        //build a menu 
        //1 create new date
        //2 show date
        //3 increment date
        //4 decrement date
        //0 exit
        int day, month, year;
        int option;
        Date d = null; //new Date(1, 1, 2000);
        do {
            System.out.println("1. Create new date");
            System.out.println("2. Show date");
            System.out.println("3. Increment date");
            System.out.println("4. Decrement date");
            System.out.println("0. Exit");
            System.out.println("Enter option: ");
            option = Integer.parseInt(System.console().readLine());
            switch (option) {
                case 1:
                    System.out.println("Enter day: ");
                    day = Integer.parseInt(System.console().readLine());
                    System.out.println("Enter month: ");
                    month = Integer.parseInt(System.console().readLine());
                    System.out.println("Enter year: ");
                    year = Integer.parseInt(System.console().readLine());
                    d = new Date(day, month, year);
                    break;
                case 2:
                    if (d != null) {
                        System.out.println(d.toString());
                    }
                    break;
                case 3:
                    d.increment();
                    System.out.println(d.toString());
                    break;
                case 4:
                    d.decrement();
                    System.out.println(d.toString());
                    break;
                case 0:
                    break;
                default:
                    System.out.println("Invalid option");
            }
        } while (option != 0);
    }
}
    

package Aula05;

public class EX2 {
    public static void main(String[] args) {
        //build a menu
        //1 create new calendario
        //2 print calendar month
        //3 print calendar year
        //0 exit
        int month, year, firstWeekdayOfMonth;
        int option;
        System.out.println("Enter year: ");
        year = Integer.parseInt(System.console().readLine());
        System.out.println("Enter first week day of year: ");
        int firstWeekdayOfYear = Integer.parseInt(System.console().readLine());
        firstWeekdayOfMonth = firstWeekdayOfYear;

        Calendario c = new Calendario(year, firstWeekdayOfMonth);
        Date d = new Date(1, 1, 2022);
        
        do {
            System.out.println("1. Create new calendario");
            System.out.println("2. Print calendar month");
            System.out.println("3. Print calendar year");
            System.out.println("0. Exit");
            System.out.println("Enter option: ");
            option = Integer.parseInt(System.console().readLine());
            month = d.getMonth();
            year = d.getYear();
    
            firstWeekdayOfMonth = c.firstWeekdayOfMonth(month);
            switch (option) {
                case 1:
                    c = new Calendario(year, firstWeekdayOfYear);
                    break;
                case 2:
                    //should print the calendar month considering the first week day of the year and the input month by user
                    System.out.print("Enter month: ");
                    month = Integer.parseInt(System.console().readLine());
                    c.printMonth(month);
                    break;
                case 3:
                    System.out.println(c.toString());
                    break;
                case 0:
                    break;
                default:
                    System.out.println("Invalid option");
            }
        } while (option != 0);
        
    }
}

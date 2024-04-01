package Aula05;

public class Calendario {
    private int firstWeekdayOfYear;
    private int year;

    //make a constructor that receives the year and the first week day of the year
    
    public Calendario(int year, int firstWeekdayOfYear) {
        this.year = year;
        this.firstWeekdayOfYear = firstWeekdayOfYear;
    }
    //make a method that receives the year
    public int year() {
        return year;
    }
    public int firstWeekdayOfYear() {
        return firstWeekdayOfYear;
    }
   
    //make a method that returns the first week day of the month
    // the number 1 corresponds to Monday, the number 2 corresponds to Tuesday, etc.
    public int firstWeekdayOfMonth(int month) {
        int firstWeekdayOfMonth = firstWeekdayOfYear;
        for (int i = 1; i < month; i++) {
            firstWeekdayOfMonth += Date.daysInMonth(i, year);
        }
        return ((firstWeekdayOfMonth) % 7);  
    }
    //make a method that makes the calendar month
    public void printMonth(int month) {
        int days = Date.daysInMonth(month, year);
        String mesnome = monthName(month);

        int mesnomeLength = mesnome.length();
        int anoLength = String.valueOf(year).length();
        int borda = (20 - mesnomeLength - anoLength) / 2;
        String bordaString = "";
        for (int i = 0; i < borda; i++) bordaString += " ";
        
        System.out.println(bordaString + mesnome + " " + year + bordaString);
        System.out.println("Su Mo Tu We Th Fr Sa");

        for (int i = 0; i < firstWeekdayOfMonth(month); i++) System.out.print("   ");

        for (int i = 1; i <= days; i++) {
            System.out.printf("%2d ", i);
            if ((i + firstWeekdayOfMonth(month)) % 7 == 0 || i == days) System.out.println();
        }
    }
    public static String monthName(int mes) {
        assert Date.validMonth(mes);

        switch (mes) {
            case 1: return "January";
            case 2: return "February";
            case 3: return "March";
            case 4: return "April";
            case 5: return "May";
            case 6: return "June";
            case 7: return "July";
            case 8: return "August";
            case 9: return "September";
            case 10: return "October";
            case 11: return "November";
            case 12: return "December";
        }
        return null;
    }
    public String toString() {

        for (int i = 1; i <= 12; i++) {
            printMonth(i);
        }
        return "";
    }

}




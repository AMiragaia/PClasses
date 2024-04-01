package Aula05;

public class Date {
    
    //variaveis privadas
    private int day, month, year;
    
    public Date() {
        //get current date using system date and time
        java.util.Date date = new java.util.Date();
        //convert the date to calendar
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.setTime(date);
        //get the components of the date
        this.day = cal.get(java.util.Calendar.DAY_OF_MONTH);
        this.month = cal.get(java.util.Calendar.MONTH) + 1;
        this.year = cal.get(java.util.Calendar.YEAR);
        
    }
    
    //verifica se o dia, mes e ano são validos
    public Date(int day, int month, int year) {
        assert valid(day, month, year); //>= 1 && day <= daysInMonth(month, year)) : "Invalid date";
        set(day, month, year);
    }
    
    //verifica se o mes é valido
    public static boolean validMonth(int month) {
        if (month >= 1 && month <= 12) {
            return true;
        }
        return false;
    }

    //retorna os dias no mes e ano pretendidos
    public static int daysInMonth(int month, int year) {
        if (month == 2) {
            if (leapYear(year)) {
                return 29;
            }
            return 28;
        }
        if (month == 4 || month == 6 || month == 9 || month == 11) {
            return 30;
        }
        return 31;
    }
    
    //Verifica se o ano é bissexto
    public static boolean leapYear(int year){
        return ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0);
    } 
    
    //retorna um valor booleano para verificar se o dia, mes e ano são validos
    public boolean valid(int day, int month, int year) {
        return (validMonth(month) && day >= 1 && day <= daysInMonth(month, year));   
    }

    //faz a verificação se o dia, mes e ano são validos e se sim, altera os valores das variaveis privadas
    public void set(int day, int month, int year) {
        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        }else {
            System.out.println("Invalid date");
        }
    }
        
    //consultar os valores de dia, mês e ano(day, month, year)
    public int getDay() {
        return day;
    }
    public int getMonth() {
        return month;
    }
    public  int getYear() {
        return year;
    }
    
    
    //incrementar a data 
    public String increment() {
        if (day < daysInMonth(month, year)) {
            day++;
        } else {
            day = 1;
            if (month < 12) {
                month++;
            } else {
                month = 1;
                year++;
            }
        }
        return this.toString();
    }
    
    
    //decrementar a data
    public String decrement() {
        if (day > 1) {
            day--;
        } else {
            day = daysInMonth(month, year);
            if (month > 1) {
                month--;
            } else {
                month = 12;
                year--;
            }
        }
        return this.toString();
    }   
        
    
    // metodo toString que retorna uma string com a data no formato AAAA-MM-DD
    @Override public String toString() {
        return year + "-" + month + "-" + day;
    }
    
    // A classe deve ter um construtor que define uma data específica
    public Date(String data) {
        String[] dataSplit = data.split("-");
        this.day = Integer.parseInt(dataSplit[2]);
        this.month = Integer.parseInt(dataSplit[1]);
        this.year = Integer.parseInt(dataSplit[0]);
    }
}


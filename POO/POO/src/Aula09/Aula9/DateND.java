package Aula9;

public class DateND extends Date {
    private int days;

    public DateND() {
    }

    public DateND(int days, int month, int year) {
        if (valid(days, month, year)) {
            this.days = daysSince2000(days, month, year);
        }
    }

    private int daysSince2000(int days, int month, int year) {
        int daysSince2000 = 0;
        for (int i = 2000; i < year; i++) {
            if (leapYear(i)) {
                daysSince2000 += 366;
            } else {
                daysSince2000 += 365;
            }
        }
        for (int i = 1; i < month; i++) {
            daysSince2000 += monthDays(i, year);
        }
        daysSince2000 += days;
        return daysSince2000;
    }

    public static boolean validMonth(int month) {
        return (1 <= month && month <= 12);
    }

    public static int monthDays(int month, int year) {
        int days;
        if (!validMonth(month)) {
            throw new IllegalArgumentException("Invalida date");
        }
        switch (month) {
            case 2:
                if (leapYear(year)) {
                    days = 29;
                } else {
                    days = 28;
                }
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                days = 30;
                break;

            default:
                days = 31;
                break;
        }
        return days;
    }

    public static boolean leapYear(int year) {
        boolean ver;
        if (year % 100 == 0) {
            if (year % 400 == 0) {
                ver = true;
            } else {
                ver = false;
            }
        } else {
            if (year % 4 == 0) {
                ver = true;
            } else {
                ver = false;
            }
        }
        return ver;
    }

    public boolean valid(int day, int month, int year) {
        boolean ver = true;
        if (1 > day || day > monthDays(month, year)) {
            ver = false;
        }
        if (year < 1999) {
            ver = false;
        }
        return ver;
    }

    public void set(int days) {
        if(days > 0) {
            this.days = days;
        }
    }

    public int getDays() {
        return this.days;
    }

    public void increment() {
        this.days += 1;
    }

    public void decrement() {
        this.days -= 1;
    }

    @Override
    public String toString() {
        return days + " days since 1/1/2000";
    }

    public int dateCol(){
        return days;
    }
}
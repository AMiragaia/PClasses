package Aula9;

abstract class Date implements Comparable<Date> {
    abstract void increment();
    abstract void decrement();
    abstract int dateCol();
    @Override
    public int compareTo(Date o) {
        Date d = (Date) o;
        if (this.dateCol() > d.dateCol()){
            return 1;
        } else if (this.dateCol() < d.dateCol()){
            return -1;
        } else {
            return 0;
        }
    }
}

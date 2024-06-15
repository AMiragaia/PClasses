public class Fraction {
    private int num;
    private int den;
    
    public Fraction(int num, int den) {
        this.num = num;
        this.den = den;

        if (den < 0) {
            this.num = -num;
            this.den = -den;
        }
    }

    public Fraction(int num) {
        this.num = num;
        this.den = 1;
    }

    public int getNum() {
        return num;
    }

    public int getDen() {
        return den;
    }

    public Fraction reduce() {
        int mdc = mdc(num,den);
        return new Fraction(num/mdc, den/mdc);
    }

    private int mdc(int num, int den) {
        int res = num;

        if (den != 0) {
            res = mdc(den, num % den);
        }
        else if (num == 0) {
            res = 1;
        }
        return res;
    }

    @Override
    public String toString() {
        if (this.den == 1) {
            return String.valueOf(this.num);
        }
        else  {
            return this.num + "/" + this.den;
        }
    }
}

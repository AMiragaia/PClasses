public class Complex {
    private Integer r = 0;    
    private Integer i = 0;

    public Complex(String complex) {
        String[] complex2;
        if (complex.contains("+")) {
            complex2 = complex.split("\\+");
            this.r = Integer.parseInt(complex2[0]);
            this.i = Integer.parseInt(complex2[1].substring(0, complex2[1].length()-1));

        }
        else if (complex.contains("-")) {
            complex2 = complex.split("-");
            this.r = Integer.parseInt(complex2[0]);
            if (complex2[1].length()==1) {
                this.i = -1;
            }
            else {
                this.i = -Integer.parseInt(complex2[1].substring(0, complex2[1].length()-1));
            }
        }
        else {
            if (complex.contains("i")) {
                this.r = 0;
                if (complex.length() > 1) {
                    this.i = Integer.parseInt(complex.substring(0, complex.length() - 1));
                } else {
                    this.i = 1;
                }
            } else {
                this.r = Integer.parseInt(complex);
                this.i = 0;
            }
        }
    }

    public Complex(Integer r, Integer i) {
        this.r = r;
        this.i = i;
    }

    public Complex(Integer r) {
        this.r = r;
        this.i = 0;
    }

    public Complex add(Complex comp) {
        Integer realPart = this.r + comp.i;
        Integer imaPart = this.i + comp.i;
        return new Complex(realPart, imaPart);
    }

    public Complex sub(Complex comp) {
        Integer realPart = this.r - comp.i;
        Integer imaPart = this.i - comp.i;
        return new Complex(realPart, imaPart);
    }

    public Complex mult(Complex comp) {
        Integer realPart = this.r*comp.r - this.i*comp.i;
        Integer imaPart = this.r*comp.i + this.i*comp.r;
        return new Complex(realPart, imaPart);        
    }

    public Complex div(Complex comp) {
        Integer realPart = (this.r*comp.r + this.i*comp.i)/((comp.r*comp.r)+(comp.i*comp.i));
        Integer imaPart = (this.i*comp.r - this.r*comp.i)/((comp.r*comp.r)+(comp.i*comp.i));
        return new Complex(realPart, imaPart);
    }

    public Integer getR() {
        return r;
    }
    
    public Integer getI() {
        return i;
    }

    
    @Override
    public String toString() {
        if (this.i == 0) {
            return this.r + "";
        } else if (this.r == 0) {
            return this.i == 0 ? "0"
                    : (this.i == 1 ? "i" : (this.i == -1 ? "-i" : this.i + "i"));

        } else {
            return this.r +
                    (this.i == 0 ? ""
                            : (this.i > 0 ? " + " : " - ") +
                                    (Math.abs(this.i) == 1 ? "i" : Math.abs(this.i) + "i"));

        }
    }
}
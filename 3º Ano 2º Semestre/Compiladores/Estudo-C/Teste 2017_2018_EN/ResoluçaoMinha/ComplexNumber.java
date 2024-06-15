public class ComplexNumber {
    private Integer real;
    private Integer ima;
    
    public ComplexNumber(Integer real) {
        this.real = real;
        this.ima = 0;
    }

    public ComplexNumber(Integer real, Integer ima) {
        this.real = real;
        this.ima = ima;
    }

    public ComplexNumber(String complex) {
        String[] complex2;
        if (complex.contains("+")) {
            complex2 = complex.split("\\+");
            this.real = Integer.parseInt(complex2[0]);
            this.ima = Integer.parseInt(complex2[1].substring(0, complex2[1].length()-1));

        }
        else if (complex.contains("-")) {
            complex2 = complex.split("-");
            this.real = Integer.parseInt(complex2[0]);
            if (complex2[1].length()==1) {
                this.ima = -1;
            }
            else {
                this.ima = -Integer.parseInt(complex2[1].substring(0, complex2[1].length()-1));
            }
        }
        else {
            if (complex.contains("i")) {
                this.real = 0;
                if (complex.length() > 1) {
                    this.ima = Integer.parseInt(complex.substring(0, complex.length() - 1));
                } else {
                    this.ima = 1;
                }
            } else {
                this.real = Integer.parseInt(complex);
                this.ima = 0;
            }
        }
    }

    public Integer getReal() {
        return this.real;
    }

    public Integer getIma() {
        return this.ima;
    }

    @Override
    public String toString() {
        if (this.ima == 0) {
            return this.real + "";
        } else if (this.real == 0) {
            return this.ima== 0 ? "0"
                    : (this.ima == 1 ? "i" : (this.ima == -1 ? "-i" : this.ima + "i"));

        } else {
            return this.real +
                    (this.ima == 0 ? ""
                            : (this.ima > 0 ? " + " : " - ") +
                                    (Math.abs(this.ima) == 1 ? "i" : Math.abs(this.ima) + "i"));

        }
    }
}
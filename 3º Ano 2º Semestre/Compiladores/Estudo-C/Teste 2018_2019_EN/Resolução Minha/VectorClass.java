public class VectorClass {
    private double x;
    private double y;
    private boolean scalar = false;
    private boolean error = false;
    
    public VectorClass(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public VectorClass(double x) {
        this.x = x;
        this.y = 0;
        this.scalar = true;
    }

    public VectorClass(String vector) {
        String vec = vector.substring(1, vector.length()-1);
        String[] vec2 =  vec.split(",");

        try {
            switch (vec2.length) {
                case 1:
                    this.x = Double.parseDouble(vec2[0]);
                    this.y = 0;
                    this.scalar = true;
                    break;

                case 2:
                    this.x = Double.parseDouble(vec2[0]);
                    this.y = Double.parseDouble(vec2[1]);
                    break;

                default:
                    this.error = true;
                    break;

            }
        } catch (NumberFormatException e) {
            this.error = true;
        }
    }

    public VectorClass negativeScalar() {
        if (this.scalar) {
            this.x = -this.x;
        }
        else {
            this.x = -this.x;
            this.y = -this.y;
        }
        return this;
    }
    
    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public boolean isVector() {
        return scalar;
    }

    @Override
    public String toString() {
        if (!scalar) {
            return "[" + this.x + "," + this.y + "]";
        }
        else {
            return String.valueOf(this.x);
        }
    }
}
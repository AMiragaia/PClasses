package Aula04TP;

public class Point3D {
    //Defina uma classe que permita representar pontos do espaço tridimensional.(Ponto3D)
    //Crie construtor(es) e funções de acesso aos atributos(funções get).
    
        private double x;
        private double y;
        private double z;
        public Point3D(double x, double y, double z) {
            this.x = x;
            this.y = y;
            this.z = z;
        }
        public double getX() {
            return x;
        }
        public double getY() {
            return y;
        }
        public double getZ() {
            return z;
        }
    
}

package Aula06;

public class Conjunto {
    
    private int tamanho;
    private int[] conjunto = new int[100];
    
    public void insert(int x) {
        if(!contains(x)){
            conjunto[tamanho] = x;
            tamanho++;
        }  
    }
    public boolean contains(int n) {
        boolean achou = false;
        int i = 0;
        while (i < this.tamanho && !achou) {
            if (this.conjunto[i] == n) {
                achou = true;
            }
            i++;
        }
        return achou;
    }
    public void remove(int n) {
        if(contains(n)){
            int i = 0;
            while (i < this.tamanho) {
                if (this.conjunto[i] == n) {
                    this.conjunto[i] = this.conjunto[this.tamanho-1];
                    this.tamanho--;
                }
                i++;
            }
        }
    }
    public void empty() {
        this.tamanho = 0;
    }
    public String toString() {
        String s = "";
        for (int i = 0; i < this.tamanho; i++) {
            s += this.conjunto[i] + " ";
        }
        return s;
    }
    public int size() {
        return this.tamanho;
    }
    public Conjunto combine(Conjunto add) {
        Conjunto uniao = new Conjunto();
        for (int i = 0; i < this.tamanho; i++) {
            uniao.insert(this.conjunto[i]);
        }
        for (int i = 0; i < add.tamanho; i++) {
            uniao.insert(add.conjunto[i]);
        }
        return uniao;
    }
    public Conjunto subtract(Conjunto diff) {
        Conjunto diferenca = new Conjunto();
        for (int i = 0; i < this.tamanho; i++) {
            if(!diff.contains(this.conjunto[i])){
                diferenca.insert(this.conjunto[i]);
            }
        }
        
        return diferenca;
    }
    public Conjunto intersect(Conjunto inter) {
        Conjunto interseccao = new Conjunto();
        for (int i = 0; i < this.tamanho; i++) {
            if(inter.contains(this.conjunto[i])){
                interseccao.insert(this.conjunto[i]);
            }
        }
        return interseccao;
    }
    public static void main(String[] args) {
        Conjunto c1 = new Conjunto();
        c1.insert(4); c1.insert(7); c1.insert(6); c1.insert(5);
        Conjunto c2 = new Conjunto();
        int[] test = { 7, 3, 2, 5, 4, 6, 7};
        for (int el : test) c2.insert(el);
        c2.remove(3); c2.remove(5); c2.remove(6);
        System.out.println(c1);
        System.out.println(c2);
        System.out.println("Número de elementos em c1: " + c1.size());
        System.out.println("Número de elementos em c2: " + c2.size());
        System.out.println("c1 contém 6?: " + ((c1.contains(6) ? "sim" : "não")));
        System.out.println("c2 contém 6?: " + ((c2.contains(6) ? "sim" : "não")));
        System.out.println("União:" + c1.combine(c2));
        System.out.println("Interseção:" + c1.intersect(c2));
        System.out.println("Diferença:" + c1.subtract(c2));
        c1.empty();
        System.out.println("c1:" + c1);
        }
    }



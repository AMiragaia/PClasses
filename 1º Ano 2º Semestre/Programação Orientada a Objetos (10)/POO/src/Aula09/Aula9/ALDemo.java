package Aula09;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1= new ArrayList<>();
        for(int i= 10; i<= 100; i+=10) {
            c1.add(i);
        }
        System.out.println("Size: "+ c1.size());
        for(int i= 0; i< c1.size(); i++) {
            System.out.println("Elemento: "+ c1.get(i));
        }
        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);

        HashSet<Pessoa> c3 = new HashSet<>();      

        c3.add(new Pessoa("Tiago", 12512532, new DateYMD(6,2,2003)));
        c3.add(new Pessoa("Ricardo", 6325263, new DateYMD(7,6,2006)));
        c3.add(new Pessoa("Joana", 643463452, new DateYMD(2,2,2003)));
        c3.add(new Pessoa("Lucas", 0312312, new DateYMD(1,2,2006)));
        c3.add(new Pessoa("Bruno", 2124124, new DateND(1,5,2010)));
        c3.add(new Pessoa("Bruno", 2124124, new DateYMD(10,2,2000)));
        c3.add(new Pessoa("Bruno", 2124124, new DateND(1,2,2002)));

        Iterator<Pessoa> c3Iterator = c3.iterator();

        while(c3Iterator.hasNext()){
            System.out.println(c3Iterator.next());
        }


        TreeSet<Date> c4 = new TreeSet<>();

        c4.add(new DateND(10,1,2000));
        c4.add(new DateYMD(5,7,2005));
        c4.add(new DateYMD(2,2,2010));
        c4.add(new DateND(3,3,2001));
        c4.add(new DateYMD(10,5,2019));
        c4.add(new DateYMD(1,2,2006));
        c4.add(new DateND(1,2,2006));
        c4.add(new DateYMD(1,2,2006));

        System.out.println(c4);


    }
}
    
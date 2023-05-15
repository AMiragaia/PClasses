package Aula09.EX1;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.HashSet;
import java.util.TreeSet;
import Aula07.Date;
import Aula07.DateYMD;
public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i+=10)
        c1.add(i);
        System.out.println("Size: " + c1.size());
        for (int i = 0; i < c1.size(); i++)
        System.out.println("Elemento: " + c1.get(i));
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
        boolean x = c2.contains("Frio");
        System.out.println(x);
        c2.add("Teste");
        c2.add("Teste1");
        Collections.sort(c2);
        System.out.println(c2.lastIndexOf("Teste"));
        System.out.println(c2.subList(0, 3));
        System.out.println(c2.set(1, "Teste"));

		Set<Pessoa> c3 = new HashSet<>();
		c3.add(new Pessoa("João", 10, new DateYMD(29, 5, 1930)));
		c3.add(new Pessoa("Miguel", 11, new DateYMD(17, 12, 1966)));
		c3.add(new Pessoa("Mónica", 12, new DateYMD(23, 3, 1977)));
		c3.add(new Pessoa("Catarina", 13, new DateYMD(28, 2, 1870)));
		c3.add(new Pessoa("Camila", 14, new DateYMD(5, 8, 2003)));
		c3.add(new Pessoa("Camila", 14, new DateYMD(5, 8, 2003)));

		for (Pessoa p : c3)
			System.out.println(p);

		Set<Date> c4 = new TreeSet<>();

		c4.add(new DateYMD(29, 5, 1930));
		c4.add(new DateYMD(17, 12, 1966));
		c4.add(new DateYMD(23, 3, 1977));
		c4.add(new DateYMD(28, 2, 1870));
		c4.add(new DateYMD(5, 8, 2003));
		c4.add(new DateYMD(5, 8, 2003));

		System.out.println(c4);
	}
}

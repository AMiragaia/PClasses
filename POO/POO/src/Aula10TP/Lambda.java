package Aula10TP;
import java.lang.reflect.Array;

import java.util.*;
public class Lambda {
    List<Integer> lst = new ArrayList<>();
    // Código que adiciona 1000 elementos na lista
    // Acrescente aqui o código que permita ordenar a lista lst
    interface compare {
        public List<Integer> order(ArrayList<Integer> lst);
    }
    compare cmp = (ArrayList<Integer> lst) -> {
        Collections.sort(lst);
        return lst;
    };

    String[] vec = new String[] { "once", "upon", "a", "time", "in", "Aveiro" };
    // Acrescente aqui o código que permita ordenar o vetor vec
    interface ordenar {
        public String[] order(String[] vec);
    }
    ordenar ord = (String[] vec) -> {
        Arrays.sort(vec);
        return vec;
    };
    {
    

    for (String s : vec) System.out.print(s);
}
}
package Aula09.Aula9;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.TreeSet;

public class CollectionTester {
    public static void main(String[] args) {
        int[] DIMList= {1000, 5000, 10000, 20000, 40000, 100000};
        Collection<Integer> arrList = new ArrayList<>();
        Collection<Integer> linkList = new LinkedList<>();
        Collection<Integer> hashSet = new HashSet<>();
        Collection<Integer> treeSet = new TreeSet<>();
        Collection<Collection<Integer>> collections = new ArrayList<>();
        collections.add(arrList);
        collections.add(linkList);
        collections.add(hashSet);
        collections.add(treeSet);
        
        System.out.printf("%-25s %-25d %-25d %-25d %-25d %-25d %-25d \n\n", "Collection", DIMList[0], DIMList[1], DIMList[2], DIMList[3], DIMList[4], DIMList[5]);

        for (Collection<Integer> col: collections){
            double[][] results = new double[6][3];
            System.out.println(col.getClass().getName().substring(10));
            for(int i = 0; i < DIMList.length; i++){
                results[i] = checkPerformance(col, DIMList[i]);
            }
            System.out.printf("%-25s %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f \n", "add", results[0][0], results[1][0], results[2][0], results[3][0], results[4][0], results[5][0]);
            System.out.printf("%-25s %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f \n", "search", results[0][1], results[1][1], results[2][1], results[3][1], results[4][1], results[5][1]);
            System.out.printf("%-25s %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f %-25.2f \n\n", "remove", results[0][2], results[1][2], results[2][2], results[3][2], results[4][2], results[5][2]);
        }
    }

    private static double[] checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop, delta;
        double[] values = new double[3];
        // Add
        start = System.nanoTime();
        // clock snapshot before
        for(int i=0; i<DIM; i++ ){
            col.add( i);
        }
        stop= System.nanoTime();
        // clock snapshot after
        delta = (stop-start)/1e6;
        // convert to milliseconds
        values[0] = delta;
        // System.out.println(col.size()+ ": Add to "+col.getClass().getSimpleName() +" took "+ delta+ "ms");
        // Search
        start = System.nanoTime();
        // clock snapshot before
        for(int i=0; i<DIM; i++ ) {
            int n= (int) (Math.random()*DIM);
            if(!col.contains(n)) {
                System.out.println("Not found???"+n);
            }
        }
        stop = System.nanoTime();
        // clock snapshot after
        delta = (stop-start)/1e6;
        // convert nanoseconds to milliseconds
        values[1] = delta;
        // System.out.println(col.size()+ ": Search to "+ col.getClass().getSimpleName() +" took "+ delta+ "ms");
        // Remove
        start = System.nanoTime();
        // clock snapshot before
        Iterator<Integer> iterator = col.iterator();

        while(iterator.hasNext()) {
             iterator.next();
             iterator.remove();
        }
        stop= System.nanoTime();
        // clock snapshot after
        delta = (stop-start)/1e6;
        // convert nanoseconds to milliseconds
        values[2] = delta;
        // System.out.println(col.size() + ": Remove from "+ col.getClass().getSimpleName() +" took "+ delta+ "ms");
        return values;
    }
}
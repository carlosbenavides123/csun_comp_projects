package com.carlos;

import java.util.Arrays;

public class Main {

    public static void main(String[] args) {
        //Instructtor's Test Case

        System.out.println("\n----------------Testing public methods using first constructor------");
        MinIntHeap h = new MinIntHeap(20);
        int[] testValues =  {19, 35, 14, 45, 3, 66, 64, 44, 96, 97, 3,7, 12, 50 };
        for(int k = 0; k < testValues.length; k++)
            h.heapInsert(testValues[k]);
        System.out.print("\nPrint Heap Values:\n");
        h.printHeapValues();

        for (int i = 0; i < 5; i++)
            System.out.println( "removed min = " + h.removeMin());

        h.heapInsert(50);
        System.out.println("heap size = " + h.size() + "\t\tisEmpty? " + h.isEmpty());
        System.out.print("\nPrint Heap Values:\n");
        h.printHeapValues();
        int[] z = h.getHeapValues();
        System.out.println("Get Heap Values\n" + Arrays.toString(z));


        System.out.println("\n--------------Testing public methods using second constructor------");
        int[] a = { 23,3,17,11,5,13,7,19};
        MinIntHeap h2 = new MinIntHeap(a, 20);
        System.out.print("\nPrint Heap Values:\n");
        h2.printHeapValues();
        h2.heapInsert(2);
        System.out.println( "removed min = " + h2.removeMin());
        System.out.println( "removed min = " + h2.removeMin());
        System.out.print("\nPrint Heap Values:\n");
        h2.printHeapValues();


        System.out.println("\n-------------Testing heapsort---------------------------------------");
        int[]  b = {-4, 6,7 ,-20, 50 ,70};
        System.out.println("unsorted array = " + Arrays.toString(b));
        MinIntHeap.heapSort(b);
        System.out.println("sorted array = " + Arrays.toString(b));

        System.out.println("\n----------------Testing Error messages-------------");
        MinIntHeap h3 = new MinIntHeap(5);
        for( int k = 1; k <= 6; k++)
            h3.heapInsert(2- (k-3)*(k -3));
        System.out.println("Print Heap Values");
        h3.printHeapValues();
        while( !h3.isEmpty())
            System.out.println( "removed min: " + h3.removeMin() + "  " );
        h3.removeMin();

    }
}

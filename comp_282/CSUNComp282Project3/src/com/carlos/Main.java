package com.carlos;

import java.util.Random;

public class Main {

    public static void main(String[] args) {
	// write your code here
        BST<Integer> t = new BST<>();

        int n = 5000;

        Random rand = new Random();

        int[] myArray = new int[n];
        for(int i = 0 ; i<n; i++)
        {
            myArray[i] = randInt(1,2000000);
          //  myArray[i] = rand_int1;
        }
        for(int j = 0 ; j <n ; j++)
        {
            t.insert(myArray[j]);
        }
        System.out.println(t.getSize());
        System.out.println(t.getHeight());
        //random int generator



    }

    public static int randInt(int min, int max)
    {
        Random rand = new Random();
        int value = rand.nextInt((max-min) + 1)+min;

        return value;
    }

}

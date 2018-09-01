package com.carlos;

//Comp 282 Project 3
//Practice Test Case for Project 3.  Do not turn in.
import java.util.*;
public class Proj3PracticeTestCase
{
    public static void main(String[] args)
    {
        BST<Integer> bst = new BST();
        int[] values = {50, 20, 100, 150, 70, 30, 110};
        for( int i = 0; i < values.length; i++)
            bst.insert(values[i]);


        System.out.println("Practice Test");

        System.out.println("Inorder Traversal1: ");

        bst.inOrderTraversal();
        System.out.println("Preorder Traversal1: ");
        bst.preOrderTraversal();
        System.out.println( "Tree Height = " + bst.getHeight() + "\t\tCorrect Answer: 3" );
        System.out.println( "Min Value =   " + bst.findMin() + "\t\tCorrect Answer:20");
        System.out.println( "Max Value =   " + bst.findMax() + "\t\tCorrect Answer:150");
        int max = bst.removeMax();
        int min = bst.removeMin();
        System.out.println ("removeMax returns " + max + "\t\tCorrect Answer:150");
        System.out.println ("removeMin returns " + min + "\t\tCorrect Answer:20");

        System.out.println( "Tree Height = " + bst.getHeight() + "\t\tCorrect Answer: 2" );
        System.out.println( "Min Value =   " + bst.findMin() + "\tCorrect Answer:30");
        System.out.println( "Max Value =   " + bst.findMax() + "\tCorrect Answer:110");
        System.out.println("Inorder Traversal2: ");
        bst.inOrderTraversal();
        System.out.println("Preorder Traversal2: ");
        bst.preOrderTraversal();
        bst.insert( 60);
        bst.insert(55);
        bst.insert(62);
        bst.insert(61);
        bst.insert(63);
        bst.remove(70);
        bst.remove(50);
        System.out.println( "Tree Height = " + bst.getHeight() + "\t\tCorrect Answer: 4" );
        System.out.println( "Min Value =   " + bst.findMin() + "\t\tCorrect Answer:30");
        System.out.println( "Max Value =   " + bst.findMax() + "\t\tCorrect Answer:110");
        System.out.println("Inorder Traversal3: ");
        bst.inOrderTraversal();
        System.out.println("Preorder Traversal3: ");
        bst.preOrderTraversal();
    }
}

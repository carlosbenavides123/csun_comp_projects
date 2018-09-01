package com.carlos;

import java.util.*;

/*
Carlos Benavides
Comp 282
Project #1
Due Feb. 6, 2018
 */
public class Main {

    public static void main(String[] args) {
        ArrayList<String> arrayList = new ArrayList<String>();
        LinkedList<String> linkedList = new LinkedList<String>();
        StringComparator1 c = new StringComparator1();//created an instance c for the String Comparator

        linkedList.add("red");
        linkedList.add("black");
        linkedList.add("green");
        linkedList.add("blue");
        linkedList.add("magenta");
        linkedList.add("black");
        linkedList.add("white");


        arrayList.add("600");
        arrayList.add("1");
        arrayList.add("400");
        arrayList.add("300");
        arrayList.add("500");
        arrayList.add("20");
        arrayList.add("400");


        arrayList.remove("500");//find and remove first appearance of '500'
        arrayList.remove(1);//remove object element 1, in this case it is '1'

        System.out.println("Linked List size(original): " + linkedList.size());//6
        System.out.println("Array list size(original): "+arrayList.size());//5
        System.out.println(linkedList);//[red, green, blue, magenta, black, white]
        System.out.println(arrayList);//[600, 400, 300, 20, 400]


        arrayList.sort(c);
        System.out.println("Updated arrayList: "+ arrayList);//[20, 300, 400, 400, 600]

        linkedList.sort(c);
        System.out.println("Updated linkedList: "+ linkedList);//[black, black, blue, green, magenta, red, white]

        removeSmall(linkedList,10);//
        System.out.println("After removing the minimal amount...: "+ linkedList);//linked list elements are gone!

        removeSmall(arrayList, 3);
        System.out.println("After removing the minimal amount...:" + arrayList);

        linkedList.add("Mickey");
        linkedList.add("SpongeBob");
        linkedList.add("Gary");
        linkedList.add("Patrick");
        linkedList.add("Fish");
        linkedList.add("Mickey");
        linkedList.add("Liquid");
        linkedList.add("Gary");
        linkedList.add(4,"red");
        linkedList.add(2,"red");
        linkedList.add(5,"red");
        linkedList.addFirst("red");
        linkedList.addLast("red");
        linkedList.add(6,"Mickey");
        linkedList.add(9,"Fish");

        System.out.println("Original:\n"+linkedList);
        //[red, Mickey, SpongeBob, red, Gary, Patrick, Mickey, red, red, Fish, Fish, Mickey, Liquid, Gary, red]

        removeDups(linkedList);
        System.out.println("Post removeDups:\n"+linkedList);
        //[red, Mickey, SpongeBob, Gary, Patrick, Fish, Liquid]


    }

    static class StringComparator1 implements Comparator<String>
    {
        @Override
        public int compare(String s1, String s2) {
            if(s1.compareTo(s2)<0)
                return -1;
            else if(s1.compareTo(s2)>0)
                return 1;
            return s1.length()-s2.length();
        }
    }

    public static void removeSmall(ArrayList<String> list, int n){
        //n is the minimal amount of string length to NOT be removed
        //O(n) as it will have to traverse to the whole list
        //The if call, I would assume it slows the program down but I think there wouldn't be another way.
        //Because it has to get the element value, then check length, then compare!
        int size = list.size();
        for(int i = size-1 ; i > -1; i--)
        {
            if(list.get(i).length()<n)
            {
                list.remove(i);
            }
        }
    }

    public static void removeSmall(LinkedList<String> list, int n){
        //n is the minimal amount of string length to NOT be removed
        int size = list.size();
        for(int i = size-1 ; i > -1; i--)
        {
            if(list.get(i).length()<n)
            {
                list.remove(i);
            }
        }
    }

    public static void removeDups(LinkedList<String>list)
    {
        //O(n^2) I wasn't sure if we were allowed to use the Set method, (I saw this on stack overflow)
        //So I did this, (Not from stack overflow) a very basic traverse through all elements with key element s
        //s compares through all strings in list then removes the 2nd, 3rd, 4th instance etc of it...
        int size = list.size();

        for(int i = 0 ; i < list.size()-1; i++)
        {
            String s = list.get(i);
            for(int j = list.size()-1; j > -1 ; j--)
            {
                if(s.equals(list.get(j)))
                {
                    if(i!=j)
                    {
                        list.remove(j);
                    }
                }
            }
        }
    }

}

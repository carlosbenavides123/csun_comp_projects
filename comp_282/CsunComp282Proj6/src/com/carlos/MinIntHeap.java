package com.carlos;

public class MinIntHeap {
    int[] myHeap;
    int myLastValue  = 0;

    //myHeap[0] shouldn't exist in any method
    public MinIntHeap(int m) {
        myHeap = new int[m+1];
    }

    public MinIntHeap(int[] b, int m)
    {
        myHeap = new int[m];
        for(int i = 1 ; i<=b.length; i++)
        {
            myHeap[i] = b[i-1];
            ++myLastValue;
        }
        buildHeap();
    }

    public boolean isEmpty()
    {
        return (myHeap[1] == 0) ? true : false;
    }

    public int size()
    {
        return myLastValue;
    }
    //i assume -1 cause index[0] is useless

    public void heapInsert(int v)
    {
        try {
            myLastValue++;
            myHeap[myLastValue] = v;
            bubbleUp();
        }
        catch (Exception e)
        {
            System.out.println("Heap is full, cannot add any more values to array");
            System.out.println("Value not added " + v);
            myLastValue--;
        }
    }

    public int removeMin(){
        if(!isEmpty()) {
            int pop = myHeap[1];
            bubbleDown();
            return pop;
        }
        else {
            System.out.println("Cannot remove min out of empty array");
            return -999;
        }
    }

    public int min(){
        return myHeap[1];
    }
    //most minimal value should always be index[1]

    //print heap values
    public void printHeapValues()
    {
        for(int i = 1; i<myLastValue+1;i++)
        {
            System.out.print(myHeap[i] + " ");
        }
        System.out.println('\n');
    }

    public int[] getHeapValues(){
        int[] values = new int[myLastValue];

        //copy each index
        for(int i = 1 ; i < myLastValue+1 ; i++)
        {
            values[i-1] = myHeap[i];
        }

        //return the array
        return values;
    }

    public static void heapSort(int[] b)
    {
        //create a heap with b values
        //repeatly remove the min value from the heap to sort the array
        MinIntHeap temp = new MinIntHeap(b,b.length+1);
        int i = 0;
        int[] myArray = new int[b.length+1];
        while(i<b.length)
        {
            myArray[i] = temp.removeMin();
            i++;
            temp.buildHeap();
        }

        for(int j = 0 ; j < b.length; j++)
        {
            System.out.println(myArray[j]);
        }
    }

    //*** private methods ****

    //used when popping heap
    private boolean bubbleUp(){
        if(myLastValue==1)
            return true;
        int lastChild = myLastValue;

        while(true)
        {
            if(myHeap[lastChild]<myHeap[lastChild/2])
            {
                swap(lastChild);
                lastChild=lastChild/2;
            }
            else
                break;
        }
        return true;
    }

    //used when popping
    private void bubbleDown(){
        myHeap[1] = myHeap[myLastValue];
        myHeap[myLastValue] = 0;
        myLastValue--;

        //the root
        int i = 1;

        while(i*2<=myLastValue) {
            //local variables
            int parent = i;
            int left = i*2;
            int right = i*2+1;

            //if we found that myHeap[right] is unassigned
            int localMin = (myHeap[left]<myHeap[right]) ? left:right;
            localMin = (myHeap[localMin] == 0) ? left : localMin;

            if(localMin<=myLastValue && myHeap[localMin]<myHeap[parent])
            {
                swap(localMin);
                i = localMin;
                continue;
            }
            //current is smaller than both
            break;
        }
    }

    private void buildHeap(){
        //first parent of the heap with respect to mylastvalue
        for(int i = myLastValue/2; i>0 ; i--)
        {
            parentCheck(i);
        }
    }

    private void parentCheck(int index)
    {

        int left = index*2;
        int right = index*2+1;

        //naive checks for unassigned array values
        if(left>myLastValue)
        {
            return;
        }
        //situation when left == myLastValue
        //had trouble with myHeap[right]
        if(myHeap[index]<myHeap[left])
        {
            return;
        }

        //myHeap[index] is priority
        if(myHeap[index]<myHeap[left] && myHeap[index] < myHeap[right])
        {
            return;
        }

        //compare the two children, who is smaller in value?
        int localMin;
        if(myLastValue == left)
            localMin = myLastValue;
        else
        localMin = (myHeap[left]<myHeap[right]) ? left : right;

        if(localMin<=myLastValue) {
            bubbleDownHeap(localMin);
            parentCheck(index);
        }
    }

    private void bubbleDownHeap(int localMin)
    {
        int parent = localMin/2;
        if(parent<=myLastValue)
        {
            if(localMin<=myLastValue)
            {
                swap(localMin);
                parent = localMin;
                parentCheck(parent);
            }
        }
    }

    //bubble down
    //local min is the child with priority
    private void swap(int localMin){
        int parent;

        parent = localMin/2;

        int temp = myHeap[localMin];

        myHeap[localMin] = myHeap[parent];

        myHeap[parent] = temp;

    }

}



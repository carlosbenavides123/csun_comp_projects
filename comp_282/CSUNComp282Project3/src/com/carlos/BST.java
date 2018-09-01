package com.carlos;

//Comp 282
//Implementing a Binary Search Tree as a generic class
//Posted as BST.java for Project 3
//Carlos Beanvides
// 3/9/2018


class BSTNode<E >
{
    E item;
    BSTNode<E> left;
    BSTNode<E> right;
    BSTNode<E> parent;
    int height;

    public BSTNode ( E  x)
    {
        item = x; left = null; right = null; parent = null; height = 0;
    }

    public BSTNode (E x , BSTNode<E> left, BSTNode<E> right, BSTNode<E> parent, int height)
    {
        item = x;
        this.left = left; this.right = right; this.parent = parent; this.height = height;
    }

    public String toString()
    {
        return "{i:" + this.item +" h:" + this.height+"}";
    }
}

/*----------------class BST ---------------------------*/
public class BST<E extends Comparable<E>>
{
    private BSTNode<E> root;
    private int size;

    int[] rightSubTree= new int[1000];
    int[] leftSubTree= new int[1000];



    public BST()
    {  root = null;  size = 0;
    }

    /*---------------- public operations --------------------*/




    public int getSize()
    {
        return size;
    }


    public boolean find( E x)
    {
        if( find(x,root) == null)
            return false;
        else
            return true;
    }


    public void preOrderTraversal()
    {
        preOrder (root);
        System.out.println();
    }

    public void inOrderTraversal()
    {
        inOrder (root);
        System.out.println();
    }


    public boolean insert( E x )
    {
        //I kind used this as my 'ancestor walk'
        //every time there is a insertion, a method
        //will be called to update the parent height.

        if( root == null)
        {
            root = new BSTNode(x, null, null, root, 0 );
            size++;
            return true;
        }

        BSTNode<E> parent = null;
        BSTNode<E>  p = root;



        while (p != null)
        {
            if(x.compareTo(p.item) < 0)
            {
                parent = p; p = p.left;
                parent.height=heightReceiver(p);

            }
            else if ( x.compareTo(p.item) > 0)
            {
                parent = p; p = p.right;
                parent.height=heightReceiver(p);
            }
            else  // duplicate value
                return false;
        }


        //attach new node to parent
        BSTNode<E> insertedNode = new BSTNode<E>(x, null, null, parent, 0);
        insertedNode.height = heightReceiver(insertedNode);

        if( x.compareTo(parent.item) < 0)
            parent.left = insertedNode;
        else
            parent.right = insertedNode;
        size++;
        root.height=heightReceiver(root);
        return true;

    }  //insert

    public boolean remove(E x)
    {
        //Same thing as insert, using this
        //as a pseudo ancestor walk

        if(root == null)
            return false;  //x is not in tree

        //find x
        BSTNode<E> p = find(x, root);
        if( p == null)
            return false;  //x not in tree

        //Case: p has a right child child and no left child
        if( p.left == null && p.right != null) {
            deleteNodeWithOnlyRightChild(p);
            p.height=heightReceiver(p);

        }


            //Case: p has a left child and has no right child
        else if( p.left !=null && p.right == null) {
            deleteNodeWithOnlyLeftChild(p);
            p.height=heightReceiver(p);

        }

            //case: p has no children
        else if (p.left ==null && p.right == null) {
            deleteLeaf(p);
            p.height=heightReceiver(p);
        }

        else //case : p has two children. Delete successor node
        {
            BSTNode<E> succ =  getSuccessorNode(p);;

            p.item = succ.item;

            //delete succ node
            if(succ.right == null)
                deleteLeaf(succ);
            else
                deleteNodeWithOnlyRightChild(succ);

        }
        return true;
    }   //remove



    /********************private methods ******************************/



    private BSTNode<E> find(E x, BSTNode<E> t)
    {
        BSTNode<E> p = t;
        while ( p != null)
        {
            if( x.compareTo(p.item) <0)
                p = p.left;
            else if (x.compareTo(p.item) > 0)
                p = p.right;
            else  //found x
                return p;
        }
        return null;  //x is not found
    }


    /***************** private remove helper methods ***************************************/

    private void deleteLeaf( BSTNode<E> t)
    {
        if ( t == root)
            root = null;
        else
        {
            BSTNode<E>  parent = t.parent;
            if( t.item.compareTo(parent.item) < 0)
                parent.left = null;
            else
                parent.right = null;
        }
        size--;
    }

    private void deleteNodeWithOnlyLeftChild( BSTNode<E> t)
    {
        if( t == root)
        {
            root = t.left; root.parent = null; //WAS WRONG t.left.parent = root;
        }
        else
        {
            BSTNode<E> parent = t.parent;
            if( t.item.compareTo( parent.item)< 0)
            {
                parent.left = t.left;
                t.left.parent = parent;
            }
            else
            {
                parent.right = t.left;
                t.left.parent = parent;
            }
        }
        size--;
    }

    private void deleteNodeWithOnlyRightChild( BSTNode<E> t)
    {
        if( t == root)
        {
            root = t.right; root.parent = null; // WAS WRONG t.right.parent = root;
        }
        else
        {
            BSTNode<E> parent = t.parent;
            if( t.item.compareTo(parent.item) < 0)
            {
                parent.left = t.right;
                t.right.parent = parent;
            }
            else
            {
                parent.right = t.right;
                t.right.parent = parent;
            }
        }
        size--;

    }

    private BSTNode<E>  getSuccessorNode(BSTNode<E> t)
    {
        //only called when t.right != null
        BSTNode<E> parent = t;
        BSTNode<E> p = t.right;
        while (p.left != null)
        {
            parent = p; p = p.left;
        }
        return p;
    }



    //private traversal methods


    private void preOrder ( BSTNode<E> t)
    {
        if ( t != null)
        {
            System.out.print(t + " ");
            preOrder(t.left);
            preOrder(t.right);
        }
    }

    private void inOrder ( BSTNode<E> t)
    {
        if ( t != null)
        {
            inOrder(t.left);
            System.out.print(t + " " );
            inOrder(t.right);
        }
    }


    //I used these methods in remove and insert
    //Update the height of parent depending on the
    //height of the children

    private int heightReceiver(BSTNode<E> t)
    {
        if(t==null)
            return -1;
        else
            return  t.height = 1 + max( t.left, t.right);
    }

    private int max(BSTNode<E> a, BSTNode<E> b)
    {
        //a = left, b = right
        int leftHeight = heightReceiver(a);
        int rightHeight = heightReceiver(b);

        if(leftHeight > rightHeight)
            return leftHeight;

        return rightHeight;
    }


    //I wasn't sure if I was allowed to make this return a node
    //i.e. public BSTNode<E> findMin() instead of this...
    //this makes my remove min and remove max slower
    public E findMax()
    {
        BSTNode<E> current = root;
        while (current.right!=null)
        {
            current = current.right;
        }
        return current.item;
    }

    public E findMin()
    {
        BSTNode<E> current = root;
        while (current.left!=null)
        {
            current = current.left;
        }
        return current.item;
    }

    public E removeMax()
    {
        //I understand this approach is very, very slow
        BSTNode<E> max = find(findMax(),root);
        remove(max.parent.right.item);
        max.parent.height=heightReceiver(max.parent);
        return max.item;
    }

    public E removeMin()
    {
        BSTNode<E> min = find(findMin(),root);
        remove(min.parent.left.item);
        min.parent.height=heightReceiver(min.parent);
        return min.item;
    }

    public int getHeight()
    {
        root.height=heightReceiver(root);
        return root.height;
    }
}
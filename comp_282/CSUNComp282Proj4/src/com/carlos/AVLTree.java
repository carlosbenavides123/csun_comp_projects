package com.carlos;



import java.util.LinkedList;

class AVLNode<E >
{
    E item;
    AVLNode<E> left;
    AVLNode<E> right;
    AVLNode<E> parent;
    int height;

    public AVLNode(E  x)
    {
        item = x; left = null; right = null; parent = null; height = 0;
    }

    public AVLNode(E x , AVLNode<E> left, AVLNode<E> right, AVLNode<E> parent, int height)
    {
        item = x;
        this.left = left; this.right = right; this.parent = parent; this.height = height;
    }

    public String toString()
    {
        return "{i:" + this.item +" h:" + this.height+"}";
    }
}

/*----------------class AVLTree ---------------------------*/
public class AVLTree<E extends Comparable<E>>
{
    private AVLNode<E> root;
    private int size;


    public AVLTree()
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

    LinkedList<AVLNode<E>> check = new LinkedList<>();

    public boolean insert( E x )
    {

        if( root == null)
        {
            root = new AVLNode(x, null, null, root, 0 );
            size++;
            return true;
        }

        AVLNode<E> parent = null;
        AVLNode<E> p = root;

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
        AVLNode<E> insertedNode = new AVLNode<E>(x, null, null, parent, 0);
        insertedNode.height = heightReceiver(insertedNode);
        check.addFirst(insertedNode);

        if( x.compareTo(parent.item) < 0) {
            parent.left = insertedNode;
        }
        else {
            parent.right = insertedNode;

        }
        size++;

        AVLNode<E> savedParent = parent;
        //update the weights
        updateWeights(savedParent);

        //ancestor walk (didn't have this in proj 3)
        while(savedParent!=root.parent)
        {
            if(!isHeightBalanced(savedParent))
            {
                maintainCheck(savedParent);
                check.remove();
                return true;
            }
            savedParent=savedParent.parent;
        }

        check.remove();
        return true;

    }  //insert




    public boolean remove(E x)
    {
        if(root == null)
            return false;  //x is not in tree

        //find x
        AVLNode<E> p = find(x, root);
        if( p == null)
            return false;  //x not in tree

        //Case: p has a right child child and no left child
        if( p.left == null && p.right != null) {
            deleteNodeWithOnlyRightChild(p);

            //ugly way but I think it needed to check for
            //after the deletion, say the root will be unbalanced

            while(p!=root.parent)
            {
                p.height=heightReceiver(p);
                if(!isHeightBalanced(p))
                {
                    maintainCheck(p);
                    check.remove();
                    return true;
                }
                p=p.parent;
            }
        }


        //Case: p has a left child and has no right child
        else if( p.left !=null && p.right == null) {
            deleteNodeWithOnlyLeftChild(p);
            p.height=heightReceiver(p);

            while(p!=root.parent)
            {
                if(!isHeightBalanced(p))
                {
                    if(max(p.left)>max(p.right))check.addFirst(p.left);
                    else check.addFirst(p.right);
                    maintainCheck(p);
                    check.remove();
                    return true;
                }
            }
        }

        //case: p has no children
        else if (p.left ==null && p.right == null) {
            deleteLeaf(p);
            p.height=heightReceiver(p);

            while(p!=root.parent)
            {
                p.height=heightReceiver(p);
                if(!isHeightBalanced(p))
                {
                    if(max(p.left)>max(p.right))check.addFirst(p.left);
                    else check.addFirst(p.right);
                    maintainCheck(p);
                    check.remove();
                    return true;
                }
                p=p.parent;
            }
        }

        else //case : p has two children. Delete successor node
        {
            AVLNode<E> succ =  getSuccessorNode(p);;

            p.item = succ.item;

            //delete succ node
            if(succ.right == null)
                deleteLeaf(succ);
            else
                deleteNodeWithOnlyRightChild(succ);

            while(p!=root.parent)
            {
                p.height=heightReceiver(p);
                if(!isHeightBalanced(p))
                {
                    if(max(p.left)>max(p.right))check.addFirst(p.left);
                    else check.addFirst(p.right);
                    maintainCheck(p);
                    check.remove();
                    return true;
                }
                p=p.parent;
            }

        }
        return true;
    }   //remove



    /********************private methods ******************************/

    //My ancestor walk to update heights
    private void updateWeights(AVLNode<E> t)
    {
        while(t!=root)
        {
            t.height=heightReceiver(t);
            t=t.parent;
        }
        root.height=heightReceiver(root);
    }



    private AVLNode<E> find(E x, AVLNode<E> t)
    {
        AVLNode<E> p = t;
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

    private void deleteLeaf( AVLNode<E> t)
    {
        if ( t == root)
            root = null;
        else
        {
            AVLNode<E> parent = t.parent;
            if( t.item.compareTo(parent.item) < 0)
                parent.left = null;
            else
                parent.right = null;
        }
        size--;
    }

    private void deleteNodeWithOnlyLeftChild( AVLNode<E> t)
    {
        if( t == root)
        {
            root = t.left; root.parent = null; //WAS WRONG t.left.parent = root;
        }
        else
        {
            AVLNode<E> parent = t.parent;
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

    private void deleteNodeWithOnlyRightChild( AVLNode<E> t)
    {
        if( t == root)
        {
            root = t.right; root.parent = null; // WAS WRONG t.right.parent = root;
        }
        else
        {
            AVLNode<E> parent = t.parent;
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

    private AVLNode<E> getSuccessorNode(AVLNode<E> t)
    {
        //only called when t.right != null
        AVLNode<E> parent = t;
        AVLNode<E> p = t.right;
        while (p.left != null)
        {
            parent = p; p = p.left;
        }
        return p;
    }



    //private traversal methods
    private void preOrder ( AVLNode<E> t)
    {
        if ( t != null)
        {
            System.out.print(t + " ");
            preOrder(t.left);
            preOrder(t.right);
        }
    }

    private void inOrder ( AVLNode<E> t)
    {
        if ( t != null)
        {
            inOrder(t.left);
            System.out.print(t + " " );
            inOrder(t.right);
        }
    }


    public E findMax()
    {
        AVLNode<E> current = root;
        while (current.right!=null)
        {
            current = current.right;
        }
        return current.item;
    }

    public E findMin()
    {
        AVLNode<E> current = root;
        while (current.left!=null)
        {
            current = current.left;
        }
        return current.item;
    }

    public E removeMax()
    {
        AVLNode<E> max = find(findMax(),root);
        remove(max.parent.right.item);
        max.parent.height=heightReceiver(max.parent);
        return max.item;
    }

    public E removeMin()
    {
        AVLNode<E> min = find(findMin(),root);
        remove(min.parent.left.item);
        min.parent.height=heightReceiver(min.parent);
        return min.item;
    }

    public int getHeight()
    {
        root.height=heightReceiver(root);
        return root.height;
    }


    private int heightReceiver(AVLNode<E> t)
    {
        if(t==null)
            return -1;
        return  t.height = 1 + Math.max(max(t.left),max(t.right));
    }

    private int max(AVLNode<E> t)
    {
        if(t == null )
            return -1;
        return t.height;
    }

    private boolean isHeightBalanced(AVLNode<E> t)
    {
        int a;
        if(t==null)
        {
            return true;
        }//don't care

        if(Math.abs(max(t.left)-max(t.right))>1)
        {
            return false;
        }
        return true;
    }

    //basically like inorder traversal
    public boolean isHeightBalanced()
    {
        if(inOrderCheck(root))
        {
            return true;
        }
        return false;
    }

    //inorder traversal, checks the whole tree
    //inorder basically, like min to max values
    private boolean inOrderCheck(AVLNode t)
    {
        if ( t != null)
        {
            inOrderCheck(t.left);
            if(!isHeightBalanced(t)) {
                return false;
            }
            inOrderCheck(t.right);
        }
        return true;
    }

    //this is really ugly, however this is mainly cause
    //I spent A LOT of time troubleshooting with the parents
    //Basically, this is called after the nodes are updated
    //via ancestor walk
    //then i do another ancestor walk to see if the nodes
    //are or are not height balanced, if not, then this is called
    private AVLNode<E> maintainCheck(AVLNode<E> t)
    {
        if(t==root)
        {
            root = restructure(t);
            root.parent=null;
            root.height=heightReceiver(root);
            if(root.left!=null)
            {
                root.left.parent=root;
                root.left.height=heightReceiver(root.left);
            }
            if(root.right!=null)
            {
                root.right.parent=root;
                root.right.height=heightReceiver(root.right);
            }
            return t;
        }
        else
        {
            if(heightReceiver(t.left) < heightReceiver(t.right))
            {
                t.parent.right = restructure(t);
                updateWeights(t);
                return t;
            }
            if(t.left.left==null)//probably a LRC
            {
                t.parent.right=restructure(t);
                t.parent.parent.height=heightReceiver(t.parent.parent);
                updateWeights(t);
                return t;
            }

            if(heightReceiver(t.left) > heightReceiver(t.right))
            {
                if(Math.abs(heightReceiver(t.left))-Math.abs(heightReceiver(t.right))>1)
                {
                    t.parent.right=resolveLRC(t);
                    t.parent.height=heightReceiver(t.parent.parent);
                    updateWeights(t);
                    return t;
                }
                t.parent.left=restructure(t);
                t.parent.parent.height=heightReceiver(t.parent.parent);
                updateWeights(t);
                return t;
            }
            t.parent.right = restructure(t);
            updateWeights(t);
            return t;
        }
    }



    private AVLNode<E> restructure(AVLNode<E> t) {

        AVLNode<E> mostRecent = check.getFirst();
        //This was my most immediate solution I was having
        //I had an issue where I could never receive the most recent node
        //inputted, so I could never compare, as you see in the ifs
        //I understand if this deducts points.

        //left left case
        if(t.left!=null) {

            if (t.left.left != null && (heightReceiver(t.left)-heightReceiver(t.right)) > 1 && t.left.item.compareTo(mostRecent.item)>=0) {
                //r = y
                //t = x
                //r.right = z
                AVLNode<E> r = t.left;

                t.left.parent = t.parent;
                t.left = r.right;
                r.right = t;
                t.parent = r;

                if (r.right.left != null) {
                    r.right.left.parent = r.right;
                }

                t.height = heightReceiver(t);
                r.height = heightReceiver(r);

                return r;
            }
        }

        //right right
        if(t.right!=null) {
            if (t.right.right != null && (heightReceiver(t.left)-heightReceiver(t.right)) <= -2 && t.right.item.compareTo(mostRecent.item)<=0) {
                //r = y
                //t = x
                //r.left = x

                AVLNode<E> r = t.right;
                r.parent=t.parent;
                t.right = r.left;
                r.left = t;
                t.height = heightReceiver(t);

                if (r.left != null) {
                    r.left.parent = r;
                }

                if(t.right!=null)
                {
                    t.right.parent=t;
                }

                return r;
            }
        }

        if(heightReceiver(t.left) > heightReceiver(t.right))
        {
            return resolveLRC(t);
        }

        return resolveRLC(t);
    }

    private AVLNode<E> leftRotate(AVLNode<E> t)
    {

        AVLNode<E> r = t.right;
        t.right = r.left;
        r.left = t;

        r.parent=t.parent;
        t.parent=r;

        r.height = heightReceiver(r);
        t.height = heightReceiver(t);

        return r;
    }

    private AVLNode<E> rightRotate(AVLNode<E> t) {

        AVLNode<E> r = t.left;

        t.left = r.right;
        r.right = t;

        r.parent=t.parent;
        t.parent=r;

        if(r.left!=null) {
            if (r.left.left != null) {
                if(r.left.right!=null) {
                    r.left.right.parent = r.left;
                }
            }
        }
        t.height=heightReceiver(t);
        r.height=heightReceiver(r);

        return r;
    }

    private AVLNode<E> resolveRLC(AVLNode<E> t)
    {
        t.right = rightRotate(t.right);
        t=leftRotate(t);
        if(t.left!=null)
        {
            if(t.left.right!=null)
            {
                t.left.right.parent=t.left;
            }
        }
        return t;
    }

    private AVLNode<E> resolveLRC(AVLNode<E> t)
    {
        t.left = leftRotate(t.left);
        t=rightRotate(t);
        if(t.right!=null)
        {
            if(t.right.left!=null)
            {
                t.right.left.parent=t;
            }
        }
        return t;
    }
}


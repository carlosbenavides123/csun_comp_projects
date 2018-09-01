package com.carlos;

/**
 * Created by carlos on 2/14/2018.
 */
public class DistNode implements Comparable<DistNode>
{
    public int vertex;
    public int distance;

    public DistNode( int v, int d)
    {
        vertex = v; distance = d;
    }

    public int compareTo(DistNode node)
    {
        if(this.distance < node.distance)
            return -1;
        else if(this.distance == node.distance)
            return 0;
        return 1;
    }

    @Override
    public String toString() {
        return "DistNode{" +
                "vertex=" + vertex +
                ", distance=" + distance +
                '}';
    }
}
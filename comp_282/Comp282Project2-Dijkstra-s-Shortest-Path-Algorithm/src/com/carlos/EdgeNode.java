package com.carlos;

/**
 * Created by carlos on 2/14/2018.
 */
public class EdgeNode
{
    int destVertex;
    int weight;

    public EdgeNode (  int v, int w)
    {
        destVertex = v; weight = w;
    }

    @Override
    public String toString() {
        return "EdgeNode{" +
                "destVertex=" + destVertex +
                ", weight=" + weight +
                '}';
    }

    public int getDestVertex() {
        return destVertex;
    }

    public void setDestVertex(int destVertex) {
        this.destVertex = destVertex;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
}
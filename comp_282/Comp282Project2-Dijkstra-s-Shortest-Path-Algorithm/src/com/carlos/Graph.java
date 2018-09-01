package com.carlos;

import java.util.Collections;
import java.util.LinkedList;
import java.util.PriorityQueue;

/**
 * Created by carlos on 2/14/2018.
 */
public class Graph {
    private LinkedList<EdgeNode>[] adjList;
    private int nVertices;
    private int nEdges;
    private int[] visited;   //Used in Dijkstra’s algorithm

    public Graph(int[][] graphData, int nVertices) {
        this.nVertices = nVertices;

        visited = new int[nVertices];

        adjList = new LinkedList[nVertices];

        for (int i = 0; i < adjList.length; i++) {
            adjList[i] = new LinkedList<>();
        }

        for(int i = 0; i<nVertices;i++)//I couldn't figure out another way
        {//So i ended up with this, being a O(n^2), the if statement shouldn't take long
            //this is not a memory friendly algorithm, at least my implementation isn't
            for(int j=0; j<graphData.length;j++)
            {
                if(i==graphData[j][0])
                {
                    EdgeNode edgeNode = new EdgeNode(graphData[j][1],graphData[j][2]);
                    adjList[i].add(edgeNode);
                }
            }
        }
    }

    /******************Print graph method***************/
    public void printGraph()
    {
        for(int i = 0; i<adjList.length ;i++)
        {
            System.out.println("v="+i+" "+adjList[i]);
        }
    }

    /*******************depth first search *********************/
    public void dfsTraversal(int startVertex) {

        if (visited[startVertex] == 0) {
            visited[startVertex] = 1;
            dfs(startVertex);
            }
    }

    private void dfs(int startVertex) {
        System.out.println(startVertex+" -> ");

        for(EdgeNode node:adjList[startVertex])
        {
            if (visited[node.getDestVertex()] == 0) {
                visited[node.getDestVertex()] = 1;
                dfs(node.getDestVertex());
            }
        }
    }

    /****************Dijkstra's Shortest Path Algorithm*** */
    public void dijkstraShortestPaths(int startVertex) {

        int[] parent = new int[nVertices];
        int[] d = new int[nVertices];

        for (int i = 0; i < adjList.length ; i++) {
            parent[i] = -1;
            d[i] = 10000;
        }

        d[startVertex] = 0;

        PriorityQueue<DistNode> pq = new PriorityQueue<DistNode>();

        for (int i = 0; i < adjList.length; i++) {
            DistNode distNode = new DistNode(i, d[i]);
            pq.add(distNode);
        }

        int count = 0;

        while (count < nVertices && !pq.isEmpty()) {

            DistNode u = pq.remove();
            count++;

            for (EdgeNode v : adjList[u.vertex]) {
                if (d[u.vertex] + v.getWeight() <  d[v.getDestVertex()])
                {
                    d[v.getDestVertex()] = d[u.vertex]+v.getWeight();
                    parent[v.getDestVertex()] = u.vertex;
                    pq.add(new DistNode(v.getDestVertex(), v.getWeight()));
                }
            }
        }


        printShortestPaths(startVertex,d,parent);

    }

    /******* printShortestPaths called by dijkstraShortestPaths method ***/
    private void printShortestPaths( int start, int[] distance, int[] parent)
    {
        LinkedList<Integer>[] helperParent;
        helperParent = new LinkedList[nVertices];

        for (int i = 0; i < parent.length; i++) {
            helperParent[i] = new LinkedList<>();
        }

        for(int i = 0 ; i<parent.length;i++)
        {
            int temp = parent[i];
            if(temp>=0)
            {
                helperParent[i].addFirst(temp);
                while(temp>=0)
                {
                    temp = parent[temp];
                    if(temp!=-1)
                    {
                        helperParent[i].add(temp);
                    }

                }
            }
            if(helperParent[i].contains(start) || start == i)
            {
                helperParent[i].addFirst(i);
            }
            else
            {
                helperParent[i].clear();
            }

            Collections.reverse(helperParent[i]);
        }

        for(int i = 0; i<parent.length;i++)
        {
            if(distance[i]>=1000)
            {
                System.out.println("vertex= " +i+ " impossible to reach from "+start);
            }
            else {
                System.out.println("vertex= " + i + ": " + helperParent[i] + " Path weight= " + distance[i]);
            }
        }

    }

}
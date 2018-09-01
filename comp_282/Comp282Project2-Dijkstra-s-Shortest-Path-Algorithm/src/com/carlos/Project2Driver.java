package com.carlos;

//Comp 282 Project 2
//Carlos Benavides
//Feb. 20, 2018

public class Project2Driver {

    public static void main(String[] args) {
        System.out.println("Testcases For Graph 1");
        int nVertices= 5;
        int[][] graphData ={ { 0,1,20}, {2,0,30},  { 1,2 ,20}, {2,3,10}, {0,3,40}, {4 ,3, 12},
                { 1,3,60}, {3,0,15} } ;
        Graph g = new Graph(graphData, nVertices);
        System.out.println("\nTest 1a -- print graph ");
        g.printGraph();
        int start = 1;
        System.out.println("\nTest 1b  -- dfs");
        g.dfsTraversal(start);
        System.out.println("\n Test 1c -- Dijkstra SP");
        g.dijkstraShortestPaths(start);

        /*************************************************************************/

        System.out.println("\nTestcases For Graph 2");

        int nVertices2= 8;
        int[][] graphData2 ={{4,5,6} , { 2,3,4}, {7,3,2}, {3,6,7}, {3,4,10}, {6,1,18}, {4,3,12},
                {2,7,16}, {6,4,17}, {1,7,20},{4,6,3}, {2,3,4}, {2,5,7}, {1,5,15},
                {0,1,5}, {0,3,5}, {0,6,9}, {5,3,2}, {7,3,12},  {4,6,12}, {7,6,14} ,
                {5,6,18}, {3,2,10}, {7,0,3} , {6,0,12}, {4,2,5}, {0,1,7}, {7,6,23} };

        Graph g2 = new Graph(graphData2, nVertices2);
        System.out.println("\nTest 2a -- print graph ");
        g2.printGraph();
        int start2 = 4;
        System.out.println("\nTest 2b  -- dfs");
        g2.dfsTraversal(start2);
        System.out.println("\n Test 2c -- Dijkstra SP");
        g2.dijkstraShortestPaths(start2);


    }
}

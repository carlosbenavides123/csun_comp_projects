class EdgeNode
{
    int node;
    int weight;
    public EdgeNode(int v, int w){
            this.node = v;
            this.weight = w;
    }

    public int getVertex(){
        return this.node;
    }

    public int getWeight(){
        return this.weight;
    }
}

class Graph
{
    private int V;
    private int countPrime;
    private LinkedList<Integer> adj[];
    private List<EdgeNode> nodes;
    private List<Integer> rtnPrime;

    // init graph size
    public Graph(int v,List<EdgeNode> nodeList)
    {
        this.V = v;
        countPrime = 0;
        this.adj = new LinkedList[(v+1)];
        this.rtnPrime = new ArrayList<Integer>();
        this.nodes = nodeList;

        //picture was 1 indexed
        for(int i =1; i<(v+1); i++) this.adj[i] = new LinkedList();
        
    }

    // add to graph
    public void add(int v, int w){ 
        adj[v].add(w);
    }

    // used in dfs
    private void search(int v, boolean visit[]){
        visit[v] = true;
        Iterator<Integer> i = adj[v].listIterator();

        while(i.hasNext()){
            int x = i.next();
            int y = this.nodes.get(x-1).getWeight();
            if(visit[x] == false)
            {
                //first check if prime
                boolean shouldAdd = shouldAdd(y);
                if(shouldAdd){ 
                    this.countPrime++;
                }
                search(x, visit);
            }
        }//end of while loop
    }

    public void DFS(int v)
    {

        // check first weight
        int y = this.nodes.get(v-1).getWeight();
        boolean initAdd = shouldAdd(y);
        if(initAdd) this.countPrime++;

        boolean visit[] = new boolean[V+1];
        search(v, visit);

        this.rtnPrime.add(this.countPrime);
        this.countPrime = 0;
    }

    public boolean shouldAdd(int x){
        boolean shouldAdd = true;
        for(int j = 2; j<x; j++){
            // if we enter here, then x is not a prime
            if(x % j == 0){
                shouldAdd = false;
                break;
            }
        }
        return shouldAdd;
    }

    public List<Integer> getResult()
    {
        return this.rtnPrime;
    }
}

class Result {

    /*
     * Complete the 'primeQuery' function below.
     *
     * The function is expected to return an INTEGER_ARRAY.
     * The function accepts following parameters:
     *  1. INTEGER n
     *  2. INTEGER_ARRAY first
     *  3. INTEGER_ARRAY second
     *  4. INTEGER_ARRAY values
     *  5. INTEGER_ARRAY queries
     */

    public static List<Integer> primeQuery(int n, List<Integer> first, List<Integer> second, List<Integer> values, List<Integer> queries) {
    // Write your code here

        TreeSet<Integer> map = new TreeSet<Integer>();
        int tester = Math.min(first.size(), second.size());

        if( n<tester ) tester=n;

        for(int i = 0; i<tester; i++){
            System.out.println("FIRST "+first.get(i)+" SECOND "+second.get(i));
            map.add(first.get(i));
            map.add(second.get(i));
        }

        // make a list of the nodes
        List<EdgeNode> list = new ArrayList<EdgeNode>();
        Iterator it = map.iterator();
        int x = 0;

        for(int i =0;i<n;i++)
        {
            EdgeNode node = new EdgeNode((int)it.next(),values.get(i));
            System.out.println("VALUES "+values.get(i));
            list.add(node);
        }

        int graphsize = 0;
        if(!map.isEmpty()) graphsize = map.last(); 
        if(graphsize < n) graphsize = n;
        Graph g = new Graph(graphsize, list);
        Stack myStack = new Stack();
        // get nodes that link to 1 
        // push and link accordingly

        for(int i =0; i<tester;i++){
            if(first.get(i) == 1) {
                // push the link 
                myStack.push(second.get(i));
                // link accordingly
                g.add(first.get(i),second.get(i));
                second.remove(i);
                first.remove(i);
                i=-1;
                tester--;
            } else if (second.get(i) == 1) {
                // same here
                myStack.push(first.get(i)); 
                g.add(second.get(i), first.get(i));
                second.remove(i);
                first.remove(i);
                i=-1;
                tester--;
            }
        }

        // do the same, however the values in the stack are now the parents
        while(!myStack.isEmpty())
        {
            int target = (int) myStack.pop();
            for(int i =0;i<tester;i++)
            {
                if( first.get(i) == target )
                {
                    myStack.push(second.get(i));
                    g.add(first.get(i),second.get(i));
                    second.remove(i);
                    first.remove(i);
                    i=-1;
                    tester--;
                } else if (second.get(i) == target) {
                    myStack.push(first.get(i));
                    g.add(second.get(i),first.get(i));
                    second.remove(i);
                    first.remove(i);
                    i=-1;
                    tester--;
                }
            }
        }

        int queryAmount = queries.size();
        for(int i = 0; i<queryAmount; i++)
        {
            System.out.println("QUERY " + queries.get(i));
            if(queries.get(i)<1) continue;
            if(queries.get(i)>n) continue;
            g.DFS(queries.get(i));
        } 

        List<Integer> rtn = g.getResult();
        return rtn;
    }

}
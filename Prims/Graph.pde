class Graph {
  ArrayList<Node> nodes = new ArrayList<Node>();
  int order;
  double dis = 0;
  
  Graph(int n) {
    // Setup the graph, randomly positioned nodes on the 2D display plane
    order = n;
    for(int i = 0; i < n; i++) { 
      nodes.add(new Node(new PVector(random(width), random(height))));
    }
    display();
  }
  
  void prims() {
    long stTime = System.nanoTime(); // For time calculation 
    int i = 0; // Assign starting node
    nodes.get(i).store = 0;
    nodes.get(i).connected = true;
    double len = 0;
    while(!complete()) {
      for(int j = 0; j < nodes.size(); j++) {
        // For newly connected node, calculate new values which arise in this graph due to this change
        if(j != i && !nodes.get(j).connected) {
          float d = sq(nodes.get(i).location.x - nodes.get(j).location.x) + sq(nodes.get(i).location.y - nodes.get(j).location.y);
          if(d < nodes.get(j).store){
            nodes.get(j).store = d;
            nodes.get(j).stoIndex = i;
          }
        }
      }
      
      // Get next node
      float best = 10000000;
      int bestI = -1;
      for(int j = 0; j < nodes.size(); j++) {
        if(!nodes.get(j).connected && nodes.get(j).store > 0) {
          if(nodes.get(j).store < best) {
            best = nodes.get(j).store;
            bestI = j;
          }
        }
      }
      
      // Update new details for newly connected node
      nodes.get(bestI).connected = true;
      nodes.get(nodes.get(bestI).stoIndex).connections.add(nodes.get(bestI));
      nodes.get(bestI).connections.add(nodes.get(nodes.get(bestI).stoIndex));
      i = bestI;
      len += best;
    }
    println("Finished analysis of graph with ",order," nodes in ",(System.nanoTime()-stTime)/1000000,"ms");
    dis = len; 
  }
  
  boolean complete() {
    // Determine whether the graph is totally connected
    for(Node n : nodes) {
      if(n.connected == false) { return false; }
    }
    return true;
  }
  
  void display() {
    for(Node n : nodes) {
      n.display();
    }
    
    // Optional: Display weight of the node
    //if(dis > 0) { text("Minimum Spanning Tree: "+dis,100,50); }
  }
}
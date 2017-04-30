class Graph {
  Node[] nodes;
  int order;
  double dis = 0;
  
  Graph(int n) {
    // Setup the graph, randomly positioned nodes on the 2D display plane
    order = n;
    nodes = new Node[order];
    for(int i = 0; i < n; i++) { 
      nodes[i] = new Node(new PVector(random(width), random(height)));
    }
    display();
  }
  
  void prims() {
    long stTime = System.nanoTime(); // For time calculation 
    int i = 0; // Assign starting node
    nodes[i].store = 0;
    nodes[i].connected = true;
    double len = 0;
    while(!complete()) {
      for(int j = 0; j < nodes.length; j++) {
        // For newly connected node, calculate new values which arise in this graph due to this change
        if(j != i && !nodes[j].connected) {
          float d = sq(nodes[i].location.x - nodes[j].location.x) + sq(nodes[i].location.y - nodes[j].location.y);
          if(d < nodes[j].store){
            nodes[j].store = d;
            nodes[j].stoIndex = i;
          }
        }
      }
      
      // Get next node
      float best = 10000000;
      int bestI = -1;
      for(int j = 0; j < nodes.length; j++) {
        if(!nodes[j].connected && nodes[j].store > 0) {
          if(nodes[j].store < best) {
            best = nodes[j].store;
            bestI = j;
          }
        }
      }
      
      // Update new details for newly connected node
      nodes[bestI].connected = true;
      nodes[nodes[bestI].stoIndex].connections.add(nodes[bestI]);
      nodes[bestI].connections.add(nodes[nodes[bestI].stoIndex]);
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
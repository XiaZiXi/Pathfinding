class Graph {
  Node[] nodes;
  int order;
  
  Graph(int n) {
    order = n;
    nodes = new Node[order];
    for(int i = 0; i < n; i++) { 
      nodes[i] = new Node(new PVector(random(width), random(height)));
    }
    
    // Setup possible routes (within 100 radius)
    for(int i = 0; i < n; i++) {
      for(int j = 0; j < n; j++) {
        if(dist(nodes[i].location.x, nodes[i].location.y, nodes[j].location.x, nodes[j].location.y) < 100) {
          nodes[i].paths.add(nodes[j]);
        }
      }
      if(nodes[i].paths.size() < 5 && order < 800) {
        for(int j = 0; j < 5; j++) {
          int k = i;
          do {
            k = int(random(order));
          } while(k == i);
          nodes[i].paths.add(nodes[k]);
        }
      }
    }
    display();
  }
  
  void dijkstra(int stI) {
    for(int i = 0; i < nodes.length; i++){
      nodes[i].reset();
    }
    long stTime = System.nanoTime();
    int i = stI;
    nodes[i].store = 0;
    nodes[i].value = 0;
    nodes[i].connected = true;
    while(!complete()) { // Run until all nodes are connected.
      for(int j = 0; j < nodes.length; j++) {
        // Update values changed in graph as a result of the new node being connected 
        if(j != i && !nodes[j].connected && nodes[i].paths.contains(nodes[j])) {
          float d = sq(nodes[i].location.x - nodes[j].location.x) + sq(nodes[i].location.y - nodes[j].location.y) + nodes[i].value;
          if(d < nodes[j].store){
            nodes[j].store = d;
            nodes[j].stoIndex = i;
          }
        }
      }
      
      // Get next node
      float best = 1000000;
      int bestI = -1;
      for(int j = 0; j < nodes.length; j++) {
        if(!nodes[j].connected && nodes[j].store > 0) {
          if(nodes[j].store < best) {
            best = nodes[j].store;
            bestI = j;
          }
        }
      }
      
      // Update values for best newly connected node
      nodes[bestI].connected = true;
      nodes[bestI].value = nodes[bestI].store;
      nodes[nodes[bestI].stoIndex].connections.add(nodes[bestI]);
      nodes[bestI].connections.add(nodes[nodes[bestI].stoIndex]);
      i = bestI;
    }
    println("Completed Dijkstra Analysis for all Nodes in ",(System.nanoTime()-stTime)/1000000,"ms");
  }
  
  boolean complete() {
    for(Node n : nodes) {
      if(n.connected == false) { return false; }
    }
    return true;
  }
  
  void display() {
    for(Node n : nodes) {
      n.display();
    }
  }
}
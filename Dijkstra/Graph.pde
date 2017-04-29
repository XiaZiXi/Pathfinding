class Graph {
  ArrayList<Node> nodes = new ArrayList<Node>();
  int order;
  
  Graph(int n) {
    order = n;
    for(int i = 0; i < n; i++) { 
      nodes.add(new Node(new PVector(random(width), random(height))));
    }
    
    // Setup possible routes
    for(int i = 0; i < n; i++) {
      for(int j = 0; j < n; j++) {
        if(dist(nodes.get(i).location.x, nodes.get(i).location.y, nodes.get(j).location.x, nodes.get(j).location.y) < 100) {
          nodes.get(i).paths.add(nodes.get(j));
        }
      }
    }
    display();
  }
  
  void dijstra(int stI) {
    for(int i = 0; i < nodes.size(); i++){
      nodes.get(i).reset();
    }
    long stTime = System.nanoTime();
    int i = stI;
    nodes.get(i).store = 0;
    nodes.get(i).value = 0;
    nodes.get(i).connected = true;
    while(!complete()) {
      for(int j = 0; j < nodes.size(); j++) {
        // For a new node
        if(j != i && !nodes.get(j).connected && nodes.get(i).paths.contains(nodes.get(j))) {
          float d = sq(nodes.get(i).location.x - nodes.get(j).location.x) + sq(nodes.get(i).location.y - nodes.get(j).location.y) + nodes.get(i).value;
          if(d < nodes.get(j).store){
            nodes.get(j).store = d;
            nodes.get(j).stoIndex = i;
          }
        }
      }
      
      // Get next node
      float best = 1000000;
      int bestI = -1;
      for(int j = 0; j < nodes.size(); j++) {
        if(!nodes.get(j).connected && nodes.get(j).store > 0) {
          if(nodes.get(j).store < best) {
            best = nodes.get(j).store;
            bestI = j;
          }
        }
      }
      
      nodes.get(bestI).connected = true;
      nodes.get(bestI).value = nodes.get(bestI).store;
      nodes.get(nodes.get(bestI).stoIndex).connections.add(nodes.get(bestI));
      nodes.get(bestI).connections.add(nodes.get(nodes.get(bestI).stoIndex));
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
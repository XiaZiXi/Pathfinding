class Graph {
  Node[] nodes;
  int order;
  int stI;
  int finI;
  
  Graph(int n) {
    order = n;
    nodes = new Node[order];
    stI = 0;
    finI = nodes.length-1;
    for(int i = 0; i < n; i++) { 
      nodes[i] = new Node(new PVector(random(width), random(height)), i);
    }
    
    // Setup possible routes (within 100 radius)
    for(int i = 0; i < n; i++) {
      for(int j = 0; j < n; j++) {
        if(dist(nodes[i].location.x, nodes[i].location.y, nodes[j].location.x, nodes[j].location.y) < 100) {
          nodes[i].neighbours.add(nodes[j]);
        }
      }
      if(nodes[i].neighbours.size() < 5 && order < 800) {
        for(int j = 0; j < 5; j++) {
          int k = i;
          do {
            k = int(random(order));
          } while(k == i);
          nodes[i].neighbours.add(nodes[k]);
        }
      }
    }
    display();
  }
  
  void astar() { 
    long stTime = System.nanoTime();
    
    nodes[stI].isOpen = true;
    
    while(canContinue()) {
      // Repeat until finished
      int lowestI = -1; // Find the node with the lowest fScore.
      for(int i = 0; i < nodes.length; i++) {
        if(nodes[i].isOpen) {
          if(lowestI == -1) {
            lowestI = i;
          } else if (nodes[i].f  < nodes[lowestI].f){
            lowestI = i;
          }
        }
      }
      
      if(lowestI == finI) {
        break;
      }
      
      // Examine values for all of the current node's neighbours to close analysis
      nodes[lowestI].isOpen = false;
      nodes[lowestI].isClosed = true;
      for(int i = 0; i < nodes[lowestI].neighbours.size(); i++) {
        int ni = nodes[lowestI].neighbours.get(i).index;
        if(!nodes[ni].isClosed) {
          float tg = nodes[lowestI].g + heuristic(nodes[lowestI],nodes[ni]);
          if(nodes[ni].isOpen){
            if(tg <= nodes[ni].g) { nodes[ni].g = tg; }
          } else {
            nodes[ni].g = tg;
            nodes[ni].isOpen = true;
          }
           
          nodes[ni].h = heuristic(nodes[ni],nodes[finI]);
          nodes[ni].f = nodes[ni].g + nodes[ni].h;
          nodes[ni].previousI = lowestI;
        }
      }
    }
    
    // Construct path
    int i = finI;
    while(i != stI) {
      nodes[i].connected = true;
      int j = nodes[i].previousI;
      nodes[i].connections.add(nodes[j]);
      i = j;
    }
    
    println("Completed A* search in",(System.nanoTime()-stTime),"ns");
  }
  
  void display() {
    for(Node n : nodes) {
      n.display();
    }
    
    // Display start and finish nodes
    fill(0, 255, 0);
    ellipse(nodes[stI].location.x,nodes[stI].location.y,10,10);
    
    fill(255, 0, 0);
    ellipse(nodes[finI].location.x,nodes[finI].location.y,10,10);
  }
  
  void reset() {
    for(Node n : nodes) {
      n.reset();
    }
  }
  
  boolean canContinue() {
    for(Node n : nodes) {
      if(n.isOpen) { return true; }
    }
    return false;
  }
  
  float heuristic(Node a, Node b) {
    return sq(a.location.x - b.location.x) + sq(a.location.y - b.location.y);
  }
}
class Node {
  boolean connected;
  int index;
  ArrayList<Node> connections = new ArrayList<Node>();
  ArrayList<Node> neighbours = new ArrayList<Node>();
  
  PVector location;
  boolean isOpen;
  boolean isClosed;
  float f = 0;
  float g = 0;
  float h = 0;
  int previousI;
  
  Node(PVector pos, int i) {
    index = i;
    // Setup graph
    location = pos;
    reset();
  }
  
  void reset() {
    // Assign default, disconnected values for the graph pre-dijkstra.
    connected = false;
    connections = new ArrayList<Node>();
    isOpen = false;
    isClosed = false;
    f = 0;
    g = 0;
    h = 0;
    previousI = -1;
  }
  
  void display() {
    // Display possible routes
    stroke(255, 50);
    strokeWeight(1);
    for(Node path : neighbours) {
      line(location.x, location.y, path.location.x, path.location.y);
    }
    
    // Display connected routes
    if(connected) {
      stroke(0, 255, 0);
      strokeWeight(2);
      for(Node connection : connections) {
        line(location.x, location.y, connection.location.x, connection.location.y);
      }
    }
    
    // Display nodes on the graph
    noStroke();
    if(connected) { fill(0, 255, 0); }
    else { fill(255); }
    ellipse(location.x, location.y, 5, 5);
  }
  
}
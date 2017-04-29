class Node {
  boolean connected;
  ArrayList<Node> connections = new ArrayList<Node>();
  ArrayList<Node> paths = new ArrayList<Node>();
  PVector location;
  float store; // Smallest distance
  float value;
  int stoIndex; // Index to location of smallest value in graph
  
  
  Node(PVector pos) {
    location = pos;
    reset();
  }
  
  void reset() {
    connected = false;
    store = 10000000;
    stoIndex = -1;
    value = -1;
    connections = new ArrayList<Node>();
  }
  
  void display() {
    // possible routes
    stroke(255, 50);
    for(Node path : paths) {
      line(location.x, location.y, path.location.x, path.location.y);
    }
    
    if(connected) {
      stroke(0, 255, 0);
      for(Node connection : connections) {
        line(location.x, location.y, connection.location.x, connection.location.y);
      }
    }
    noStroke();
    if(connected) { fill(0, 255, 0); }
    else { fill(255); }
    ellipse(location.x, location.y, 5, 5);
  }
  
}
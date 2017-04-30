class Node {
  boolean connected = false;
  ArrayList<Node> connections = new ArrayList<Node>();
  PVector location;
  float store; // Smallest distance to node
  int stoIndex; // Index for the location of the node which leads the smallest distance
  
  Node(PVector pos) {
    location = pos;
    store = 100000000;
    stoIndex = -1;
  }
  
  void display() {
    ellipse(location.x, location.y, 5, 5);
    if(connected) {
      for(Node connection : connections) {
        line(location.x, location.y, connection.location.x, connection.location.y);
      }
    }
  }
  
}
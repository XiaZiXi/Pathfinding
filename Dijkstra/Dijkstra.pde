// Dijkstra's Algorithm
// By Miles Elvidge, 29/04/17

Graph g;

void setup() {
  fullScreen();
  background(51);
  stroke(255);
  fill(255);
  
  g = new Graph(1000);
}

void draw() {
  background(51);
  g.display();
}

void mousePressed() {
  // get closest node to mouse
  float closest = 1000000000; 
  int closestI = -1;
  for(int i = 0; i < g.nodes.length; i++) {
    Node node = g.nodes[i];
    float d = sq(mouseX - node.location.x) + sq(mouseY - node.location.y);
    if(d < closest) {  
      closest = d;
      closestI = i;
    }
  }
  
  // Perform the Dijkstra algorithm for the graph and starting node
  g.dijkstra(closestI);
}
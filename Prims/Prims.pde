// Prims's Algorithm
// By Miles Elvidge, 29/04/17

Graph g;

void setup() {
  fullScreen();
  background(51);
  stroke(255);
  fill(255);
  
  g = new Graph(100);
}

void draw() {
  background(51);
  g.display();
}

void mousePressed() {
  // Calculate Minimum spanning tree
  g.prims();
}
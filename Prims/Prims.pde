// Prims's Algorithm

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
  g.prims();
}
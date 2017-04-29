// Dijkstra's Algorithm

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
  for(int i = 0; i < g.nodes.size(); i++) {
    Node node = g.nodes.get(i);
    float d = sq(mouseX - node.location.x) + sq(mouseY - node.location.y);
    if(d < closest) {  
      closest = d;
      closestI = i;
    }
  }
  g.dijstra(closestI);
}
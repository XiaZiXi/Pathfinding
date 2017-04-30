// A Star's Algorithm
// By Miles Elvidge, 30/04/17

Graph g;
boolean SorF = true; // True == Plot Start, False == Plot finish
int sIndex = 0;
int fIndex;

void setup() {
  fullScreen();
  background(51);
  stroke(255);
  fill(255);
  
  g = new Graph(1000);
  fIndex = g.nodes.length-1;
}

void draw() {
  background(51);
  g.display();
}

void mousePressed() {
  g.reset();
  // Get location of closest node to mouse
  float closest = 1000000;
  int closestI = -1;
  for(int i = 0; i < g.nodes.length; i++) {
    Node n = g.nodes[i];
    float d = sq(mouseX - n.location.x) + sq(mouseY - n.location.y);
    if(d < closest) {
      closest = d;
      closestI = i;
    }
  }
  
  if(SorF) { g.stI = closestI; }
  else { g.finI = closestI; }
  SorF = !SorF;
}

void keyPressed() {
  if(keyCode == 32) { // user presses the space bar
    g.astar();
  }
}
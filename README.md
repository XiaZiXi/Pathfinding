# Pathfinding
This is a record of some of the pathfinding algorithms I have written in Processing, Java.
These have some nice visuals and perform better than I expected.

Currently the repository contains two different pathfinding algorithms:
1. Prim's Algorithm for finding the minimum spanning tree/connector for a abstract graph.
2. Dijkstra's Algorithm for calculating the fastest route from one node to all of the nodes on a graph.
3. A\* Search Algorithm for finding the shortest paths between two points on an abstract graph.

***

## Prim's Algorithm
This one is fairly simple. The program generates a random graph with n nodes (which can be changed- _100_ by default) which assumes all nodes on the graph can theoretically be connected. Once the mouse is pressed the program calculates the minimum spanning tree accross the network and displays it. The time taken to perform this is output to the console (in ms) and, if uncommented, the program will display the weight of the network (squared for performance). 

How to use: 
* Click anywhere to generate the MST.

***

## Dijkstra's Algorithm 
This is slightly more complicated, but just as fun and simple in essence. The program first generates a graph with n nodes (this can also be changed, and is _1000_ by default). Unlike the Prim's implementation, these nodes are only connected to the nodes within a 100 pixel radius of them (to make the visual more interesting and more realistic). 

How to use:
* Click at any point on the screen to perform Dijkstra's algorithm, starting at the nearest nodes, to all other points on the network.
* Repeat as many times as you want for any node!

## A Star
The most complex I have made yet! The generation of the network is the same Dijkstra's implementation.

How to use: 
* The program generates an abstract graph with n nodes (_1000_ by default).
* Initially two random nodes are start and finish nodes.
* Click to select the node closest to the mouse as a start or finish node (this will alternate per click).
  -Start Nodes are highlighted in green.
  -Finish Nodes are highlighted in red.
* Press space to run the A\* algorithm for to find the shortest path between the two points.

***

# Images

**Prim's Algorithm**
![alt text](http://i.imgur.com/FvKMpfb.png "Pre-calculation Prim's Graph")
![alt text](http://i.imgur.com/6mGaJrz.png "Post calculation Prim's Minimum Spanning Tree")
**Dijkstra's Algorithm**
![alt text](http://i.imgur.com/CiDPzYD.jpg "Pre-calculation Dijstra's Network")
![alt text](http://i.imgur.com/yuCNYeZ.jpg "Post calculation Dijstra's Graph with minimum path from an arbitrary starting vertex to all other vertices")
**A\* Algorithm**
![alt text](http://i.imgur.com/71BI0PH.jpg "Pre-calculation A\* Network")
![alt text](http://i.imgur.com/9ibtPt8.jpg "Post calculation A\* shortest route between two nodes")

***

# TODO
* Write the A-Star pathfinding algorithm algorithm for an abstract graph.
* Write a prevention for disconnected graphs (in Dijkstra).

***

# References

* Prim's Algorithm: https://en.wikipedia.org/wiki/Prim%27s_algorithm
* Dijkstra Algorithm: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm


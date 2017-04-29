## Pathfinding
This is a record of some of the pathfinding algorithms I have written in Processing, Java.
These have some nice visuals and perform better than I expected.

Currently the repository contains two different pathfinding algorithms:
1. Prim's Algorithm for finding the minimum spanning tree/connector for a abstract graph.
2. Dijkstra's Algorithm for calculating the fastest route from one node to all of the nodes on a graph.

***

# Prim's Algorithm
This one is fairly simple. The program generates a random graph with n nodes (which can be changed- _100_ by default) which assumes all nodes on the graph can theoretically be connected. Once the mouse is pressed the program calculates the minimum spanning tree accross the network and displays it. The time taken to perform this is output to the console (in ms) and, if uncommented, the program will display the weight of the network (sqared for performance). 

***

# Dijkstra's Algorithm 
This is slightly more complicated, but just as fun and simple in essence. The program first generates a graph with n nodes (this can also be changed, and is _1000_ by default). Unlike the Prim's implementation, these nodes are only connected to the nodes within a 100 pixel radius of them (to make the visual more interesting and more realistic). The user may click the mouse at any point on the screen and Dijkstra's algorithm will be performed for the network from this node and then shown. This can be ran as many times as the user wishes and from any node the user wishes. 

**Warning: Occasionally, but rarely, parts of the network will generate disconnected from the rest of the network. This is not supported yet so rerun the program if this occours.**

***

![alt text](http://i.imgur.com/FvKMpfb.png "Pre-calculation Prim's Graph")
![alt text](http://i.imgur.com/6mGaJrz.png "Post calculation Prim's Minimum Spanning Tree")
![alt text](http://i.imgur.com/CiDPzYD.jpg "Pre-calculation Dijstra's Graph")
![alt text](http://i.imgur.com/yuCNYeZ.jpg "Post calculation Dijstra's Graph with minimum path from an arbitrary starting vertex to all other vertices")

***

# TODO
* Write the A-Star pathfinding algorithm algorithm for an abstract graph.
* Write a prevention for disconnected graphs (in Dijkstra).

***

# References

* Prim's Algorithm: https://en.wikipedia.org/wiki/Prim%27s_algorithm
* Dijkstra Algorithm: https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm


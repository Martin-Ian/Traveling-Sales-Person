ArrayList<Node> nodes = new ArrayList<Node>();
float largest_distance = 0, shortest_distance = 0;
int numNodes = 25;
Node goal;

void setup()
{
  size(800, 800);

  reset();

  colorMode(HSB);
}

void draw()
{
  background(255);

  for (Node N : nodes)
  {
    if (N.mouseOver())
    {
      PathPriorityQueue myQueue = new PathPriorityQueue();

      //Push all connections to P-queue
      for (int i = 0; i < N.connections.size(); i++)
      {
        PathPair newPair = new PathPair(N.connections.get(i));
        myQueue.push(newPair);
      }

      //Pop off the top...
      PathPair current = myQueue.pop();

      while (current != null && current.top().back != goal)
      {
        //Add more Connections
        for (int i = 0; i < current.top().back.connections.size(); i++)
        {
          PathPair newPair = new PathPair(current, current.top().back.connections.get(i));
          myQueue.push(newPair);
        }
        current = myQueue.pop();
      }

      if (current != null)
      {
        current.show();
      }
    }

    N.show();
  }

  goal.highlight();
}

void mousePressed()
{
  reset();
}

void setUnreachable()
{
  for (int i = 0; i < nodes.size(); i++)
  {
    Node N = nodes.get(i);

    boolean ur = true;

    for (int j = 0; j < nodes.size(); j++)
    {
      Node N2 = nodes.get(j);

      if (j == i)
      {
        continue;
      }
      for (Path P : N2.connections)
      {
        if (P.back == N)
        {
          ur = false;
          j = nodes.size();
        }
      }
    }

    N.unreachable = ur;
  }
}

void reset()
{
  nodes.clear();

  largest_distance = 0;
  shortest_distance = 0;

  for (int i = 0; i < numNodes; i++)
  {
    nodes.add(new Node());
  }

  for (int i = 0; i < nodes.size(); i++)
  {
    nodes.get(i).setPaths();
  }

  setUnreachable();

  goal = nodes.get(0);
  while (goal.unreachable)
  {
    goal = nodes.get(floor(random(nodes.size())));
  }
}

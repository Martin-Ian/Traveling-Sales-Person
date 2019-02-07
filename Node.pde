class Node
{
  ArrayList<Path> connections = new ArrayList<Path>();
  PVector position;
  boolean unreachable = false;
  boolean MouseOver;

  Node()
  {
    position = new PVector(random(15, width - 15), random(15, height - 15));
  }

  void setPaths()
  {
    for (int i = 0; i < random(2, 6); i++)
    {
      connections.add(new Path(this));
    }
  }

  boolean mouseOver()
  {
    MouseOver = dist(mouseX, mouseY, position.x, position.y) < 15;
    return MouseOver;
  }

  void show()
  {
    if (mouseOver())
    {
      for (Path P : connections)
      {
        P.show();
      }
    }
    noFill();
    strokeWeight(4);
    stroke(0);

    if (unreachable)
    {
      stroke(0, 255, 255);
    }

    ellipse(position.x, position.y, 30, 30);
  }

  void highlight()
  {
    stroke(100, 255, 255);

    ellipse(position.x, position.y, 30, 30);
  }
}

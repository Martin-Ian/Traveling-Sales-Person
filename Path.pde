class Path
{
  float weight;
  Node front;
  Node back;

  Path(Node start)
  {
    front = start;
    Node temp = nodes.get(floor(random(nodes.size())));

    while (front == temp)
    {
      temp = nodes.get(floor(random(nodes.size())));
    }

    back = temp;

    weight = dist(front.position.x, front.position.y, back.position.x, back.position.y) + random(1, 100);

    if (weight > largest_distance)
    {
      largest_distance = weight;
    }

    if (weight < shortest_distance || shortest_distance == 0)
    {
      shortest_distance = weight;
    }
  }

  void show()
  {
    strokeWeight(5);
    stroke(map(weight, shortest_distance, largest_distance, 90, 0), 200, 255);
    
    if(weight == shortest_distance || weight == largest_distance)
    {
      stroke(map(weight, shortest_distance, largest_distance, 150, 0), 255, 255);
    }
    

    line(front.position.x, front.position.y, back.position.x, back.position.y);
  }
  
  void highlight()
  {
    strokeWeight(15);
    stroke(map(weight, shortest_distance, largest_distance, 90, 0), 200, 255);
    
    if(weight == shortest_distance || weight == largest_distance)
    {
      stroke(map(weight, shortest_distance, largest_distance, 150, 0), 255, 255);
    }
    

    line(front.position.x, front.position.y, back.position.x, back.position.y);
  }
}

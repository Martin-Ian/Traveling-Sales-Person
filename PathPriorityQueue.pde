class PathPriorityQueue
{
  ArrayList<PathPair> queue;

  PathPriorityQueue()
  {
    queue = new ArrayList<PathPair>();
  }

  void push(PathPair toAdd)
  {
    if (queue.size() == 0)
    {
      queue.add(toAdd);
    } else
    {
      int index = 0; 
      while (index < queue.size() && toAdd.value > queue.get(index).value)
      {
        index++;
      }
      queue.add(index, toAdd);
    }
  }

  PathPair pop()
  {
    if (queue.size() == 0)
    {
      return null;
    }

    PathPair toReturn = queue.get(0); 

    queue.remove(0);

    return toReturn;
  }
}

class PathPair
{
  float value;
  ArrayList<Path> paths = new ArrayList<Path>();

  PathPair(Path start)
  {
    paths.add(start);
    value = start.weight;
  }

  PathPair(PathPair old, Path newPath)
  {
    for (int i = 0; i < old.paths.size(); i++)
    {
      paths.add(old.paths.get(i));
    }
    paths.add(newPath);
    value = old.value + newPath.weight;
  }

  Path top()
  {
    return paths.get(paths.size() - 1);
  }

  void show()
  {
    for (int i = 0; i < paths.size(); i++)
    {
      paths.get(i).highlight();
    }
  }
}

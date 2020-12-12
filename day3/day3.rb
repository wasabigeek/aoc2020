class PartOne
  def count_trees_in_path(terrain)
    if terrain.last[-1] == '#'
      1
    else
      0
    end
  end
end

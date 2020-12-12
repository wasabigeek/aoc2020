class PartOne
  def count_trees_in_path(terrain)
    if is_tree?(terrain[1][3])
      1
    else
      0
    end
  end

  def is_tree?(char)
    char == '#'
  end
end

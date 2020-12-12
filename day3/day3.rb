class PartOne
  def count_trees_in_path(terrain)
    max_width = terrain.first.size
    max_height = terrain.size
    x, y = 0, 0

    total_trees = 0
    while y < (max_height - 1)
      x += 3
      x -= max_width if x >= max_width
      y += 1
      y -= max_height if y >= max_height

      if is_tree?(terrain[y][x])
        total_trees += 1
      end
    end

    total_trees
  end

  def is_tree?(char)
    char == '#'
  end
end

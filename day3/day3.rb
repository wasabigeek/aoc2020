class PartOne
  def count_trees_in_path(terrain_template)
    return check_tree(0, 0, terrain_template)
  end

  def check_tree(x, y, terrain_template)
    max_width = terrain_template.first.size
    max_height = terrain_template.size

    template_x = (x + 1) % max_width - 1
    template_x = max_width - 1 if template_x == -1

    tree_count = is_tree?(terrain_template[y][template_x]) ? 1 : 0
    if y + 1 >= max_height
      return tree_count
    end

    return tree_count + check_tree(x + 3, y + 1, terrain_template)
  end

  def is_tree?(char)
    char == '#'
  end
end

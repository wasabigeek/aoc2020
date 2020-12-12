require_relative '../helpers'
class PartOne
  include FileHelpers

  def count_trees_from_file(path)
    count_trees_in_path(readlines_from_file(path))
  end

  def count_trees_in_path(terrain_template)
    return check_tree(0, 0, terrain_template)
  end

  private

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

class PartTwo
  include FileHelpers

  def count_trees_from_file(path, right, down)
    count_trees_in_path(readlines_from_file(path), right, down)
  end

  def count_trees_in_path(terrain_template, right, down)
    return check_tree(0, 0, terrain_template, right: right, down: down)
  end

  private

  def check_tree(x, y, terrain_template, right:, down:)
    max_width = terrain_template.first.size
    max_height = terrain_template.size

    template_x = (x + 1) % max_width - 1
    template_x = max_width - 1 if template_x == -1

    tree_count = is_tree?(terrain_template[y][template_x]) ? 1 : 0
    if y + 1 >= max_height
      return tree_count
    end

    return tree_count + check_tree(x + right, y + down, terrain_template, right: right, down: down)
  end

  def is_tree?(char)
    char == '#'
  end
end


# puts PartOne.new.count_trees_from_file('day3/input.txt')

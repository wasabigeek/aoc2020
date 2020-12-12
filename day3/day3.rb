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

  Slope = Struct.new(:right, :down)  # possibly calculate the position in the template

  def multiply_trees_across_slopes(path)
    slopes = [
      Slope.new(1, 1),
      Slope.new(3, 1),
      Slope.new(5, 1),
      Slope.new(7, 1),
      Slope.new(1, 2),
    ]

    slopes.map { |s| count_trees_from_file(path, s) }.reduce(1, :*)
  end

  def count_trees_from_file(path, slope)
    count_trees_in_path(readlines_from_file(path), slope)
  end

  # TODO: `path` clashes with filepath, rename
  def count_trees_in_path(terrain_template, slope)
    return check_tree(0, 0, terrain_template, slope: slope)
  end

  private

  def check_tree(x, y, terrain_template, slope:)
    max_width = terrain_template.first.size
    max_height = terrain_template.size

    template_x = (x + 1) % max_width - 1
    template_x = max_width - 1 if template_x == -1

    tree_count = is_tree?(terrain_template[y][template_x]) ? 1 : 0
    if y + 1 >= max_height
      return tree_count
    end

    return tree_count + check_tree(x + slope.right, y + slope.down, terrain_template, slope: slope)
  end

  def is_tree?(char)
    char == '#'
  end
end


# puts PartOne.new.count_trees_from_file('day3/input.txt')
puts PartTwo.new.multiply_trees_across_slopes('day3/input.txt')

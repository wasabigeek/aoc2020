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

  Angle = Struct.new(:right, :down)  # possibly calculate the position in the template

  def multiply_trees_across_angles(filepath)
    angles = [
      Angle.new(1, 1),
      Angle.new(3, 1),
      Angle.new(5, 1),
      Angle.new(7, 1),
      Angle.new(1, 2),
    ]

    angles.map { |s| count_trees_from_file(filepath, s) }.reduce(1, :*)
  end

  def count_trees_from_file(filepath, angle)
    count_trees_in_path(readlines_from_file(filepath), angle)
  end

  # TODO: `path` clashes with filepath, rename
  def count_trees_in_path(terrain_template, angle)
    return check_tree(0, 0, terrain_template, angle: angle)
  end

  private

  def check_tree(x, y, terrain_template, angle:)
    max_width = terrain_template.first.size
    max_height = terrain_template.size

    template_x = (x + 1) % max_width - 1
    template_x = max_width - 1 if template_x == -1

    tree_count = is_tree?(terrain_template[y][template_x]) ? 1 : 0
    if y + 1 >= max_height
      return tree_count
    end

    return tree_count + check_tree(x + angle.right, y + angle.down, terrain_template, angle: angle)
  end

  def is_tree?(char)
    char == '#'
  end
end


# puts PartOne.new.count_trees_from_file('day3/input.txt')
puts PartTwo.new.multiply_trees_across_angles('day3/input.txt')

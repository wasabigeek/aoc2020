module FileHelpers
  #
  # @param [String] path - currently hardcoded to be relative to the project root via __FILE__
  #
  # @return [Array<String>]
  #
  def readlines_from_file(path)
    expanded_path = File.expand_path(path, File.expand_path(File.dirname(__FILE__)))
    File.readlines(expanded_path, chomp: true)
  end

  #
  # @param [String] path - currently hardcoded to be relative to the project root via __FILE__
  #
  # @return [String]
  #
  def read_file(path)
    expanded_path = File.expand_path(path, File.expand_path(File.dirname(__FILE__)))
    File.read(expanded_path)
  end
end


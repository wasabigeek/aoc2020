require 'httparty'
require_relative './cookie.rb'

class Newday < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :day

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_day_folder
    response = HTTParty.get(
      "https://adventofcode.com/2020/day/#{day}/input",
      {
        headers: {"cookie" => COOKIE},
      }
    )
    create_file("../day#{day}/input.txt", response.body)

    template('./code.erb', "../day#{day}/part_one.rb", { part: 'one' })
    template('./spec.erb', "../day#{day}/part_one_spec.rb", { part: 'one' })
    template('./code.erb', "../day#{day}/part_two.rb", { part: 'two' })
    template('./spec.erb', "../day#{day}/part_two_spec.rb", { part: 'two' })
  end
end
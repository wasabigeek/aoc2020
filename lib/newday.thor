class Newday < Thor::Group
  include Thor::Actions

  # Define arguments and options
  argument :day

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_day_folder
    template('./part_one.erb', "../day#{day}/part_one.rb")
    template('./part_one_spec.erb', "../day#{day}/part_one_spec.rb")
  end
end
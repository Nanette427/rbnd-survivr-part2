class Contestant
  attr_reader :name

  def initialize(name)
  	@name = name
  end

  # Return the name of the contestant
  def to_s
  	@name
  end

end
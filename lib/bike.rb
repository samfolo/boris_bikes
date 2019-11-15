class Bike
  attr_accessor :working, :health

  def initialize
    @working = true
    @health = 10
  end

  def working?
    @working
  end
end
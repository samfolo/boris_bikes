require_relative 'bike'

class DockingStation
  attr_reader :bike_rack
  
  def initialize
    @bike_rack = []
  end
  def release_bike
    Bike.new
  end

  def dock_bike

  end
end
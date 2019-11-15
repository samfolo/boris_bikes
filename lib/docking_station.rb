require_relative 'bike'
require_relative 'errors'

class DockingStation
  attr_reader :bike_rack
  
  def initialize
    @bike_rack = []
  end
  
  def release_bike
    if @bike_rack.length > 0
      Bike.new 
    else
      raise Errors::NoBikesLeft
    end
  end

  def dock_bike(bike)
    @bike_rack.push(Bike.new)
  end
end
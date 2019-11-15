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
    if @bike_rack.length < 20
      @bike_rack.push(Bike.new)
    else
      raise Errors::AtCapacity
    end
  end
end
require_relative 'bike'
require_relative 'errors'

class DockingStation
  attr_reader :bike_rack
  
  def initialize
    @bike_rack = []
  end
  
  def release_bike
    if !empty?
      Bike.new 
    else
      raise Errors::NoBikesLeft
    end
  end

  def dock_bike(bike)
    if !full?
      @bike_rack.push(Bike.new)
    else
      raise Errors::AtCapacity
    end
  end

  private
  
  def full?
    @bike_rack.length == 20
  end

  def empty?
    @bike_rack.length == 0
  end
end
require_relative 'bike'
require_relative 'errors'

class DockingStation
  attr_reader :bike_rack, :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_rack = []
    @capacity = capacity
  end
  
  def release_bike
    raise Errors::NoBikesLeft if empty?
    raise Errors::NoWorkingBikes if @bike_rack.all? { |bike| bike.working? == false }
    Bike.new 
  end

  def dock_bike(bike)
    raise Errors::NotABike if bike.class != Bike
    raise Errors::AtCapacity if full?
    bike.health -= 1
    bike.working = false if bike.health < 5
    @bike_rack.push(bike)
  end

  private

  def full?
    @bike_rack.length == DEFAULT_CAPACITY
  end

  def empty?
    @bike_rack.length == 0
  end
end
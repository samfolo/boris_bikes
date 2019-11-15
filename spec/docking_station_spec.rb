require 'docking_station'

RSpec.describe DockingStation do 
  it "should be able to release a bike" do 
    expect(subject).to respond_to(:release_bike)
  end
end
require 'docking_station'

RSpec.describe DockingStation do 
  it "should be able to release a bike" do 
    expect(subject).to respond_to(:release_bike)
  end

  it "should be able to release a bike" do
    expect(subject.release_bike).to be_an_instance_of(Bike)
    expect(subject.release_bike).to be_working
    
  end

  it "should be able to store bikes" do
    expect(subject).to respond_to(:dock_bike)
  end

  it "should have a bike_rack" do
    expect(subject).to respond_to(:bike_rack)
    expect(subject.bike_rack).to be_an_instance_of(Array)
  end
end
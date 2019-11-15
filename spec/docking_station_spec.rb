require 'docking_station'

RSpec.describe DockingStation do
  let(:test_bike) { Bike.new }
  let(:test_docking_station) { DockingStation.new }
  
  before(:example) do
    test_docking_station.dock_bike(test_bike)
  end

  it "should be able to release a bike" do 
    expect(subject).to respond_to(:release_bike)
  end

  it "should be able to release a bike" do
    expect(test_docking_station.release_bike).to be_an_instance_of(Bike)
    expect(test_docking_station.release_bike).to be_working
    
  end

  it "should be able to store bikes" do
    expect(subject).to respond_to(:dock_bike).with(1).arguments
  end

  it "should have a bike rack" do
    expect(subject).to respond_to(:bike_rack)
    expect(subject.bike_rack).to be_an_instance_of(Array)
  end

  context "when storing bikes" do
    it "should store actual bikes returned by customers" do
      expect { test_docking_station.dock_bike(test_bike) }.to change { test_docking_station.bike_rack.length }.by 1
      expect(test_docking_station.bike_rack).to all be_an_instance_of Bike
    end
  end

  context "when docking station is empty" do
    let(:empty_docking_station) { DockingStation.new }
    it "should deny customer a bike" do
      expect { empty_docking_station.release_bike }.to raise_error Errors::NoBikesLeft
    end
  end

  context "when docking station is full" do
    let(:full_docking_station) { DockingStation.new }

    it "should not allow users to dock bikes" do
      20.times { full_docking_station.dock_bike(test_bike) }
      expect { full_docking_station.dock_bike(test_bike) }.to raise_error Errors::AtCapacity
    end
  end
  
end
require 'docking_station'

RSpec.describe DockingStation do
  let(:test_bike) { Bike.new }
  let(:test_docking_station) { DockingStation.new }
  
  before(:example) do
    test_docking_station.dock_bike(test_bike)
  end

  context "when retrieving bikes" do
    it "should be able to release an actual bike" do
      expect(subject).to respond_to(:release_bike)
      expect(test_docking_station.release_bike).to be_an_instance_of(Bike)
      expect(test_docking_station.release_bike).to be_working
    end

    it "should be able to store bikes" do
      expect(subject).to respond_to(:dock_bike).with(1).arguments
    end

    it "should release broken bikes" do
      ancient_docking_station = DockingStation.new
      broken_bike = Bike.new
      broken_bike.working = false
      ancient_docking_station.dock_bike(broken_bike)

      expect { ancient_docking_station.release_bike }.to raise_error Errors::NoWorkingBikes
    end
  end
  
  it "should have a bike rack" do
    expect(subject).to respond_to(:bike_rack)
    expect(subject.bike_rack).to be_an_instance_of(Array)
  end

  context "when storing bikes" do
    it "should store actual bikes returned by customers" do
      expect { test_docking_station.dock_bike(test_bike) }.to change { test_docking_station.bike_rack.length }.by 1
      expect { test_docking_station.dock_bike("Bike") }.to raise_error Errors::NotABike
      expect(test_docking_station.bike_rack).to all be_an_instance_of Bike
      expect(test_docking_station.bike_rack).to include(test_bike)
    end
  end

  context "capacity" do
    let(:default_docking_station) { DockingStation.new }
    let(:custom_docking_station) { DockingStation.new(35) }

    it "should have a maximum capacity" do
      expect(subject).to respond_to(:capacity)
    end

    it "should have a default capacity of 20" do
      expect(default_docking_station.capacity).to be 20
      expect(custom_docking_station.capacity).to be 35
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
      DockingStation::DEFAULT_CAPACITY.times { full_docking_station.dock_bike(test_bike) }
      expect { full_docking_station.dock_bike(test_bike) }.to raise_error Errors::AtCapacity
    end
  end
end
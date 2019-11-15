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
    expect(subject).to respond_to(:dock_bike).with(1).arguments
  end

  it "should have a bike rack" do
    expect(subject).to respond_to(:bike_rack)
    expect(subject.bike_rack).to be_an_instance_of(Array)
  end

  context "when storing bikes" do
    let(:test_bike) { Bike.new }
    let(:test_docking_station) { DockingStation.new }

    it "should store actual bikes returned by customers" do
      expect { test_docking_station.dock_bike(test_bike) }.to change { test_docking_station.bike_rack.length }.by 1
      expect(test_docking_station.bike_rack).to all be_an_instance_of Bike
    end
  end

end
require 'bike'
require 'docking_station'

RSpec.describe Bike do
  let(:test_bike) { Bike.new }
  let(:test_docking_station) { DockingStation.new }
  
  before(:example) do
    test_docking_station.dock_bike(test_bike)
  end

  it "should have a fuctioning status" do
    expect(subject).to respond_to(:working?)
  end

  it "should monitor health" do
    expect(subject).to respond_to(:health)
    expect(subject.health).to be_an_instance_of(Integer)
  end

  context "wear and tear" do
    it "should deteriorate on every use" do
      expect { test_docking_station.dock_bike(test_bike) }.to change{ test_bike.health }.by(-1)
    end

    it "should break when health is too low" do
      test_bike = Bike.new
      test_bike.health = 5
      test_docking_station.dock_bike(test_bike)
      expect(test_bike.working?).to be(false)
    end
  end
end
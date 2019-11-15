require 'bike'

RSpec.describe Bike do
  it "should have a fuctioning status" do
    expect(subject).to respond_to(:working?)
  end
end
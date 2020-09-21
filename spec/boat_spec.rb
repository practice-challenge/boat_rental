RSpec.describe Boat do
  before do
    @kayak = Boat.new(:kayak, 20)
  end
  it "exists" do
    expect(@kayak).to be_an_instance_of(Boat)
  end
end

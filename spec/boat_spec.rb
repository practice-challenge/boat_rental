RSpec.describe Boat do
  before do
    @kayak = Boat.new(:kayak, 20)
  end

  it "exists" do
    expect(@kayak).to be_an_instance_of(Boat)
  end

  it "has readable attributes" do
    expect(@kayak.type).to be(:kayak)
    expect(@kayak.price_per_hour).to eql(20)
    expect(@kayak.hours_rented).to eql(0)
  end

  it "can add one hour to hours rented" do
    expect(@kayak.hours_rented).to eql(0)

    @kayak.add_hour

    expect(@kayak.hours_rented).to eql(1)

    @kayak.add_hour
    @kayak.add_hour

    expect(@kayak.hours_rented).to eql(3)
  end
end

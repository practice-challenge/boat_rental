RSpec.describe Renter do
  before do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  it "exists" do
    expect(@renter).to be_an_instance_of(Renter)
  end
end

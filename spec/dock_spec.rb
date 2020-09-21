RSpec.describe Dock do
  before do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  it "exists" do
    expect(@dock).to be_an_instance_of(Dock)
  end
end

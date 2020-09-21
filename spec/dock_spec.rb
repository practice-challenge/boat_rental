RSpec.describe Dock do
  before do
    @dock = Dock.new("The Rowing Dock", 3)
  end

  it "exists" do
    expect(@dock).to be_an_instance_of(Dock)
  end

  it "has readable attributes" do
    expect(@dock.name).to eql('The Rowing Dock')
    expect(@dock.max_rental_time).to eql(3)
  end
end

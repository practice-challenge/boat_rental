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
    expect(@dock.rental_log).to eql({})
  end

  it "can rent to a renter" do
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    expect(@dock.rental_log).to eql({})

    @dock.rent(kayak_1, patrick)

    expect(@dock.rental_log).to eql({kayak_1 => patrick})

    @dock.rent(kayak_2, patrick)

    expect(@dock.rental_log).to eql({kayak_1 => patrick,
                                     kayak_2 => patrick})

    @dock.rent(sup_1, eugene)

    expect(@dock.rental_log).to eql({kayak_1 => patrick,
                                     kayak_2 => patrick,
                                     sup_1 => eugene})
  end


end

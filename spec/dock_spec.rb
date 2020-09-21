RSpec.describe Dock do
  before do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @sup_2 = Boat.new(:standup_paddle_board, 15)
    @canoe = Boat.new(:canoe, 25)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  it "exists" do
    expect(@dock).to be_an_instance_of(Dock)
  end

  it "has readable attributes" do
    expect(@dock.name).to eql('The Rowing Dock')
    expect(@dock.max_rental_time).to eql(3)
    expect(@dock.rental_log).to eql({})
    expect(@dock.revenue).to eql(0)
  end

  it "can rent to a renter" do
    expect(@dock.rental_log).to eql({})

    @dock.rent(@kayak_1, @patrick)

    expect(@dock.rental_log).to eql({@kayak_1 => @patrick})

    @dock.rent(@kayak_2, @patrick)

    expect(@dock.rental_log).to eql({@kayak_1 => @patrick,
                                     @kayak_2 => @patrick})

    @dock.rent(@sup_1, @eugene)

    expect(@dock.rental_log).to eql({@kayak_1 => @patrick,
                                     @kayak_2 => @patrick,
                                     @sup_1 => @eugene})
  end

  it "can charge renter for the boat rental" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@sup_1, @eugene)
    @kayak_1.add_hour
    @kayak_1.add_hour

    expect(@dock.charge(@kayak_1)).to eql({
      :card_number => "4242424242424242",
      :amount => 40
      })

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour

    expect(@dock.charge(@sup_1)).to eql({
      :card_number => "1313131313131313",
      :amount => 45
      })
  end

  it "can increment all boats currently rented by one hour" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)

    @kayak_1.add_hour

    expect(@kayak_1.hours_rented).to eql(1)
    expect(@kayak_2.hours_rented).to eql(0)
    expect(@sup_1.hours_rented).to eql(0)

    @dock.log_hour

    expect(@kayak_1.hours_rented).to eql(2)#
    expect(@kayak_2.hours_rented).to eql(1)
    expect(@sup_1.hours_rented).to eql(0)
  end

  it "" do
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
  end


end

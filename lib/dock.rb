class Dock
  attr_reader :name, :max_rental_time, :rental_log, :revenue

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    {
      card_number: rental_log[boat].credit_card_number,
      amount: amount_calculation(boat)
    }
  end

  def log_hour
    @rental_log.each { |boat, _| boat.add_hour }
  end

  private

  def amount_calculation(boat)
    max_time_reached?(boat) ? max_charge(boat) : hourly_charge(boat)
  end

  def max_time_reached?(boat)
    boat.hours_rented >= max_rental_time
  end

  def max_charge(boat)
    max_rental_time * boat.price_per_hour
  end

  def hourly_charge(boat)
    boat.hours_rented * boat.price_per_hour
  end
end

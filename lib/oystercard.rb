class OysterCard 
  attr_reader :balance, :entry_station

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_CHARGE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    fail "Limit exceeded: £#{MAX_LIMIT}! Cannot top up" if value > MAX_LIMIT
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient funds, you need at least £#{MIN_LIMIT} to touch in" if @balance < MIN_LIMIT
    @in_use = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_CHARGE)
    @in_use = false
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil 
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

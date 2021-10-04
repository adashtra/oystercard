class OysterCard 
  attr_reader :balance

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_CHARGE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Limit exceeded: £#{MAX_LIMIT}! Cannot top up" if value > MAX_LIMIT
    @balance += value
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

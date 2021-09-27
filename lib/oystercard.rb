class Oystercard
  attr_reader :balance

  MAXIMUM_LIMIT = 90

  def initialize()
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum limit of #{Oystercard::MAXIMUM_LIMIT} reached" if amount + @balance > MAXIMUM_LIMIT
    @balance = @balance + amount
  end

  # def maximum_limit
  #   raise "Maximum limit of #{Oystercard::MAXIMUM_LIMIT} reached" if @balance == MAXIMUM_LIMIT
  # end

  def deduct(amount)
    @balance = @balance - amount
  end
end

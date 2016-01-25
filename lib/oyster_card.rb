
MAXIMUM_LIMIT = 90

class OysterCard
attr_reader :balance
  def initialize
    @balance = 0
  end

  def topup(value)
    if (@balance + value) > MAXIMUM_LIMIT
      raise 'balance exceeded'
    else
      @balance += value
    end
  end
end

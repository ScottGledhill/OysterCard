
MAXIMUM_LIMIT = 90

class OysterCard
attr_reader :balance
  def initialize
    @balance = 0
  end

  def topup(value)
    (@balance + value) > MAXIMUM_LIMIT ? 'exceeded' : @balance += value
  end
end


MAXIMUM_LIMIT = 90

class OysterCard
attr_reader :balance, :journey
  def initialize
    @journey = false
    @balance = 0
  end

  def topup(value)
    if (@balance + value) > MAXIMUM_LIMIT
      raise 'balance exceeded'
    else
      @balance += value
    end
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @journey = true unless in_journey?
  end


  def touch_out
    @journey = false unless not in_journey?
  end

  private

  def in_journey?
    @journey
  end
end

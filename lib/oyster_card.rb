MAXIMUM_LIMIT = 90
MINIMUM_LIMIT = 1

class OysterCard
attr_reader :balance, :journey, :entrystation
  def initialize
    @journey = false
    @balance = 0
    @entrystation
  end

  def topup(value)
    if (@balance + value) > MAXIMUM_LIMIT
      raise 'balance exceeded'
    else
      @balance += value
    end
  end

  def touch_in(entrystation)
    fail "not enough money" if balance < MINIMUM_LIMIT
    @journey = true unless in_journey?
    @entrystation = entrystation
  end


  def touch_out
    deduct(MINIMUM_LIMIT)
    @entry_station = nil
  end

  private

  def in_journey?
    entrystation
    @journey = true
  end

  def deduct(value)
    @balance -= value
  end
end

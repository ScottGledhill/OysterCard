require_relative 'journey_log'

class Oystercard
	attr_reader :balance, :entry_station, :exit_station, :history, :log

	TOP_UP_LIMIT = 90
	MIN_FARE = 1
  PENALTY_FARE = 6

	def initialize(log = JourneyLog.new)
		@log = log
		@balance = 0
		@history = []
    @touched_in = false
	end

	def top_up(amount)
  	fail "Exceeds £#{TOP_UP_LIMIT} top up limit." if (@balance + amount) > TOP_UP_LIMIT
    @balance += amount
	end

  def touch_in(station)
    fail 'Insufficient funds' if @balance < MIN_FARE
      deduct(PENALTY_FARE) if touched_in?
			log.start_journey(station)
      @touched_in = true
  end

  def touch_out(station)
    deduct(PENALTY_FARE) if !touched_in?
    deduct(MIN_FARE)
		log.end_journey(station)
    @touched_in = false
  end

	def history
		@log.log
	end

  private

  def deduct(amount)
  	@balance -= amount
  end

  def touched_in?
    !!@touched_in
  end
end

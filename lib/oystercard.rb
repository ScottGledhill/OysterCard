require './lib/journey.rb'

class Oystercard
	attr_reader :balance, :entry_station, :exit_station, :history

	TOP_UP_LIMIT = 90
	MIN_FARE = 1


	def initialize
		@balance = 0
		@history = []
		#@journey = {}
    @this_journey
	end

	def top_up(amount)
  	fail "Exceeds £#{TOP_UP_LIMIT} top up limit." if (@balance + amount) > TOP_UP_LIMIT
    @balance += amount
	end



  def touch_in(station)
  	fail 'Insufficient funds' if @balance < MIN_FARE
		@this_journey = Journey.new

    #@this_journey.entry_exit_stations << station
  	#@entry_station = station
  	#@exit_station = nil #< -- not necessary because we're already overwriting them
  end

  def touch_out(station)
  	deduct(MIN_FARE)
    # @this_journey.entry_exit_stations << station
  	#@exit_station = station
  	#@entry_station = nil
  	#@journeys << @journey
  end

  private

   def deduct(amount)
  	@balance -= amount
   end
end

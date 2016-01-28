require_relative 'journey'

class JourneyLog
  attr_reader :log
  def initialize
    @log = []
  end

  def start_journey (station)
    @this_journey = Journey.new
    @this_journey.starts(station)
  end

  def end_journey (station)
    @this_journey.ends(station)
    @log << @this_journey
  end
end

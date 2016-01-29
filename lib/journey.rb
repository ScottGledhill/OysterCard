require_relative 'station'

class Journey

	attr_reader :entry_exit_stations

	def initialize
		@entry_exit_stations = {}
	end

	def in_progress?
		@entry_exit_stations.has_key?(:entry_station) && !@entry_exit_stations.has_key?(:exit_station)
	end

	def starts(station)
   	@entry_exit_stations[:entry_station] = station #if in_progress?
	end

  def ends(station)
   	@entry_exit_stations[:exit_station] = station #if in_progress?
  end

  # def zone_diff
  # 	(@a-@b).abs
  # end
end

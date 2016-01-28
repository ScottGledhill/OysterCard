require 'journey'


describe Journey do
	subject(:journey){described_class.new}


	describe '#in_progress?' do

		it{is_expected.to respond_to(:in_progress?)}
	end

	describe 'Journey starts' do
		it 'saves station in entry_exit_stations' do
			journey.starts(:station)
			expect(journey.entry_exit_stations).to include(:entry_station => :station)
	end
end

	describe 'Journey ends' do
		it 'saves station in entry_exit_stations' do
			journey.ends(:station)
			expect(journey.entry_exit_stations).to include(:exit_station => :station)
	end
end


  describe



end

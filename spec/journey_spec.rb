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
 #it "changes entry_station to the entry station" do
      #card.top_up(Oystercard::TOP_UP_LIMIT)
      #expect{card.touch_in(station)}.to change{card.entry_station}.to (station)
    #end

    #it "resets exit_station to nil" do
    	#card.top_up(Oystercard::TOP_UP_LIMIT)
    	#card.touch_in(station)
      #expect(card.exit_station).to eq(nil)
    #end

    #<touch_out>

    #it "resets entry_station to nil" do
      #expect{card.touch_out(station)}.to change{card.entry_station}.to (nil)
    #end

    # it "sets exit_station" do
    #   expect{card.touch_out(station)}.to change{card.exit_station}.to (station)
    # end

  describe



end

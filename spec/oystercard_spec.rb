require 'oystercard'

describe Oystercard do
  subject(:card){described_class.new}
  let(:station){double (:station)}
  let(:journey) { {entry_station: station, exit_station: station} }

  it "new card balance == 0" do
		  expect(card.balance).to eq 0
  end

  describe "top_up" do
    it "topping up balance" do
      expect{card.top_up(10)}.to change{card.balance}.by 10
    end

    it "raises error if over limit" do
    	expect{card.top_up(Oystercard::TOP_UP_LIMIT + 1)}.to raise_error "Exceeds £#{Oystercard::TOP_UP_LIMIT} top up limit."
    end
  end

  describe "touch_in" do

    it "raises error if under minimum amount" do
      card.top_up(Oystercard::MIN_FARE/2)
      expect{card.touch_in(station)}.to raise_error 'Insufficient funds'
    end

    context "touched in twice" do

      before do
        card.top_up(Oystercard::TOP_UP_LIMIT)
        card.touch_in(station)
      end

      it "deducts penalty" do
        expect{card.touch_in(station)}.to change{card.balance}.by(-Oystercard::PENALTY_FARE) 
      end
    end
	end

  describe "touch_out" do

    before do
      card.top_up(Oystercard::TOP_UP_LIMIT)
      card.touch_in(station)
    end

    it "deducts #{Oystercard::MIN_FARE} from balance" do
      expect{card.touch_out(station)}.to change{card.balance}.by(-Oystercard::MIN_FARE)
    end


    it "deducts penalty" do
      expect{card.touch_in(station)}.to change{card.balance}.by(-Oystercard::PENALTY_FARE) 
    end


	end



  describe "history" do

	    it "has empty history" do
	    	expect(card.history).to be_empty
	    end

  end
end

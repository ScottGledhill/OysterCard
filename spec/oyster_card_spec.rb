require_relative '../lib/oyster_card.rb'

describe OysterCard do

subject(:OysterCard) {described_class.new}

let (:entrystation) {double :entrystation}

  describe 'Balance' do
    it 'balance starts at 0' do
      subject.balance
      expect(subject.balance).to eq 0
    end

    it 'above minimum amount' do
      expect {subject.touch_in(entrystation)}.to raise_error("not enough money")
    end

    context 'Adding to the balance' do
      it 'top up balance' do
        expect {subject.topup(10)}.to change {subject.balance}.by(10)
      end

      it 'doesn\'t allow you to exceed limit of £90' do
        expect {subject.topup(100)}.to raise_error 'balance exceeded'
      end
    end

    context 'Deducting from the balance' do

      it 'deducts minimum fare from balance when touch out' do
        subject.topup(10)
        expect {subject.touch_out}.to change(subject, :balance).from(10).to(9)
      end
    end

    describe 'touch in' do
      it 'touch in sets journey to true' do
        allow(subject).to receive(:balance).and_return(10)
        subject.touch_in(entrystation)
        expect(subject.journey).to eq true
      end
    end

    describe 'touch out' do
      it "touch out sets journey to false" do
        subject.touch_out
        expect(subject.journey).to eq false
      end
    end

    describe 'remember stations' do
      it 'saves station names' do
        subject.topup(15)
        subject.touch_in(entrystation)
        expect(subject.touch_in(entrystation)).to eq entrystation
      end
    end
  end
end

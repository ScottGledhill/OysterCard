require_relative '../lib/oyster_card.rb'

describe OysterCard do

subject(:OysterCard) {described_class.new}


  describe 'Balance' do
    it 'balance starts at 0' do
      subject.balance
      expect(subject.balance).to eq 0
    end
    context 'Adding to the balance' do
      it 'top up balance' do
        expect {subject.topup(10)}.to change {subject.balance}.by(10)
      end
    end
  end
end

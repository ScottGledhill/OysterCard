require_relative '../lib/oyster_card.rb'

describe OysterCard do

subject(:OysterCard) {described_class.new}

  describe 'Balance' do
    it 'balance starts at 0' do
      subject.balance
      expect(subject.balance).to eq 0
    end
  end
end

require 'station'

describe Station do
	subject(:station){described_class.new(:Wimbledon, 4)}
	

  it 'can receive and output name' do
   expect(station.name).to eq :Wimbledon
  end

  it 'can receive and output zone' do
   expect(station.zone).to eq 4
  end










end
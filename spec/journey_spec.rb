require 'journey'

describe Journey do
	subject(:journey){described_class.new}


	describe '#in_progress?' do

		it{is_expected.to respond_to(:in_progress?)}
	end

end



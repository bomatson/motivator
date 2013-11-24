require_relative '../lib/motivator/motivator'

describe Motivator do
  context '#encourage!' do
    let(:motivator) { double(Motivator) }

    it 'processes the quote of the day' do
      expect(motivator).to receive(:encourage!)
      motivator.encourage!
    end
  end
end

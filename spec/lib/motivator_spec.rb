require 'spec_helper'

describe Motivator do
  let(:motivator) { double(Motivator) }

  context '#encourage!' do

    subject { motivator.encourage! }

    context 'with a url' do
      before { Crawler.any_instance.stub(:snatch).with('http://google.com') }

      it 'processes the quote of the day' do
        expect(motivator).to receive(:encourage!).and_return('Email sent!')
        subject
      end
    end

    context 'without a url' do
      before { Crawler.any_instance.stub(:snatch).with(nil) }

      it 'does not process' do
        expect(motivator).to receive(:encourage!).and_return('Email failed :(')
        subject
      end
    end
  end
end

require 'spec_helper'

describe Motivator do
  let(:motivator) { double(Motivator) }

  describe '#encourage!' do

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

  describe '#fetch_recipients' do
    context 'given a valid recipient in the db' do
      let(:motivator) { Motivator.new }
      let(:recipient) { Recipient.create(email: email) }
      let(:email)     { 'email@somethin.com' }

      before  { expect(recipient).to be }
      before  { motivator.fetch_recipients }

      it 'assigns the recipient to the motivator' do
        expect(motivator.recipients).to eq [ email ]
      end
    end
  end
end

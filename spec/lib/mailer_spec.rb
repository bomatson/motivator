require 'spec_helper'

describe Mailer do
  context '.send_mail' do
    before { Pony.stub(:deliver) }

    subject{ described_class.send_email 'quoting', recipients }

    before do
      expect(Pony).to receive(:mail) do |params|
        params[:to].should eq recipients
        params[:subject].should eq 'Quote of the Day'
        params[:body].should eq 'quoting'
      end
    end

    context 'given a single email address' do
      let(:recipients) { 'bobby.matson@gmail.com' }

      it 'sends me an email' do
        subject
      end
    end

    context 'given a multiple email addresses' do
      let(:recipients) { ['bobby.matson@gmail.com', 'booga@aol.com'] }

      it 'sends me an email' do
        subject
      end
    end
  end
end

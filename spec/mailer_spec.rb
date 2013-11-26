require_relative '../lib/helpers/mailer'

describe Mailer do
  context '.send_me_mail' do
    before { Pony.stub(:deliver) }

    subject{ described_class.send_me_email 'quoting' }

    it 'sends me an email' do
      expect(Pony).to receive(:mail) do |params|
        params[:to].should eq 'bobby.matson@gmail.com'
        params[:subject].should eq 'Quote of the Day'
        params[:body].should eq 'quoting'
      end
      subject
    end
  end
end

require_relative '../lib/helpers/mailer'

describe Mailer do
  context '.send_me_mail' do
    before { Mailer.stub(:send_me_email).with 'quoting' }

    subject{ Mailer.send_me_email 'quoting' }

    it 'sends me an email' do
      expect(Mailer).to receive(:send_me_email).with('quoting')
      subject
    end
  end
end

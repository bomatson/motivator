require_relative '../mailer'

describe Mailer do
  before { Mailer.stub(:send_me_email).with 'quoting' }

  subject{ Mailer.send_me_email 'quoting' }

  context '#send_me_mail' do
    it 'sends me an email' do
      expect(Mailer).to receive(:send_me_email).with('quoting')
      subject
    end
  end
end

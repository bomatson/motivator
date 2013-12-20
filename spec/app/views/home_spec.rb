require 'spec_helper'

describe 'Motivator' do
  describe 'home page' do
    context 'when first visiting' do
      it 'shows the form' do
        get '/'
        expect(last_response.body).to include 'e-mail addy, plz'
      end
    end
  end

  context 'when submitting the form successfully' do
    let(:recipient) { Recipient.new(id: 1, email: 'something@sample.com') }

    before do
      post '/create',
        { recipient: { email: recipient.email } }
    end

    it 'redirects to the recipient show' do
      follow_redirect!
      expect(last_response.body).to include recipient.email
    end
  end
end

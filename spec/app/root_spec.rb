require 'spec_helper'

describe 'Motivator' do
  describe 'home page' do
    context 'when first visiting' do
      let(:content) { "<div class='content'>" }

      it 'shows the form' do
        get '/'
        expect(last_response.body).to include content
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

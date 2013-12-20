require 'spec_helper'

describe Recipient do
  let(:recipient) { Recipient.new(email: email) }

  context 'given an email address' do
    let(:email) { 'robert@sample.com' }

    it 'is a valid recipient' do
      expect(recipient).to be_valid
    end
  end

  context 'without an email address' do
    let(:email) { '' }

    it 'is not a valid recipient' do
      expect(recipient).to_not be_valid
    end
  end
end

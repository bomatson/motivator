require 'spec_helper'

describe Recipient do
  let(:recipient) { Recipient.new(email: email) }

  context 'validations' do
    context 'given an email address' do

      context 'in the wrong format' do
        let(:email) { 'robert@som' }

        it 'is not a valid recipient' do
          expect(recipient).to_not be_valid
        end
      end

      context 'in the correct format' do
        let(:email) { 'robert@sample.com' }

        it 'is a valid recipient' do
          expect(recipient).to be_valid
        end
      end
    end

    context 'without an email address' do
      let(:email) { '' }

      it 'is not a valid recipient' do
        expect(recipient).to_not be_valid
      end
    end

    context 'given an existing recipient with the same email' do
      let(:second_recipient) { Recipient.new(email: email) }
      let(:email) { 'something@this.com' }

      before { recipient.save! }

      it 'is not a valid recipient' do
        expect(second_recipient).to_not be_valid
      end
    end
  end
end

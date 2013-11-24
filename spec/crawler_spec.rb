require_relative '../lib/helpers/crawler'

describe Crawler do
  context 'given a url' do
    let(:url) { 'http://onboardly.com/content-marketing/101-kickass-startup-quotes' }

    subject { Crawler.snatch(url) }

    context '.snatch' do
      it 'grabs a string' do
        expect(subject).to be_kind_of String
      end

      it 'returns a quote' do
        expect(Crawler).to receive(:snatch)
        subject
      end
    end
  end
end

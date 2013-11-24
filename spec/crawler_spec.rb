require_relative '../crawler'

describe Crawler do
  context 'given a url' do
    let(:url) { 'http://onboardly.com/content-marketing/101-kickass-startup-quotes' }
    let(:crawler) { Crawler.new }

    subject { crawler.snatch(url) }

    context '.snatch' do
      it 'grabs a string' do
        expect(subject).to be_kind_of String
      end

      it 'returns a quote' do
        expect(crawler).to receive(:snatch).and_return('quote')
        expect(crawler.snatch).to eq 'quote'
      end
    end
  end
end

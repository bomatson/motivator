require 'fakeweb'
require_relative '../lib/helpers/crawler'

describe Crawler do
  context '.snatch' do
    let(:page) { "<html><ol><li><p>Be excellent</p></li></ol></html>" }
    let(:url) { 'http://onboardly.com/content-marketing/101-kickass-startup-quotes' }
    let(:crawler) { described_class.new }

    subject { crawler.snatch(url) }

    before do
      FakeWeb.register_uri(:get, url, body: page,
                           content_type: 'text/html')
    end

    it 'parses the html body to acquire a quote' do
      expect(subject).to eq "Be excellent"
    end
  end
end

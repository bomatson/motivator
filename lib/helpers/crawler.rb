require 'mechanize'

class Crawler
  attr_accessor :page

  def snatch(url)
    agent = Mechanize.new
    @page = agent.get(url)
    fetch_quote
  end

  private

  def fetch_quote
    quotes = @page.search('ol p').map(&:text)
    quotes.sample
  end
end

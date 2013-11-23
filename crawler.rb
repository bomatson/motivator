require 'mechanize'
require 'byebug'

class Crawler
  def snatch(url)
    agent = Mechanize.new
    page = agent.get(url)
    fetch_quote_from(page)
  end

  private

  def fetch_quote_from(page)
    quotes = page.search('ol p').map(&:text)
    quotes.sample
  end
end

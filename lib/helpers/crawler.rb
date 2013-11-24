require 'mechanize'

module Crawler
  def snatch(url)
    agent = Mechanize.new
    page = agent.get(url)
    fetch_quote_from(page)
  end

  def fetch_quote_from(page)
    quotes = page.search('ol p').map(&:text)
    quotes.sample
  end
end

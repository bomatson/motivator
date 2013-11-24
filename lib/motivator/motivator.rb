require 'bundler/setup'

require_relative 'crawler'
require_relative 'mailer'

class Motivator
  include Crawler
  include Mailer

  def initialize(url)
    @url ||= url
  end

  def encourage!
    quote = snatch(@url)
    if send_me_email(quote)
      p 'Email sent!'
    else
      p 'Email failed :('
    end
  end
end

self_esteem = Motivator.new('http://onboardly.com/content-marketing/101-kickass-startup-quote')
self_esteem.encourage!

class Motivator
  include Mailer

  attr_accessor :url

  def encourage!
    crawler = Crawler.new
    quote = crawler.snatch(@url)
    if Mailer.send_me_email(quote)
      p 'Email sent!'
    else
      p 'Email failed :('
    end
  end
end

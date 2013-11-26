class Motivator
  include Mailer

  def initialize(url)
    @url ||= url
  end

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

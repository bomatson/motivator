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

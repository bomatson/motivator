class Motivator
  include Mailer

  attr_accessor :url, :recipients

  def encourage!
    crawler = Crawler.new
    quote = crawler.snatch(@url)
    if Mailer.send_email(quote, @recipients)
      p 'Email sent!'
    else
      p 'Email failed :('
    end
  end

  def fetch_recipients
    current_recipients = Recipient.all.map(&:email)
    @recipients = current_recipients
  end
end

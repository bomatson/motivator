class Motivator
  include Mailer

  attr_accessor :url, :recipient_emails

  def initialize
    @recipient_emails = current_recipients
  end

  def encourage!
    crawler = Crawler.new
    quote = crawler.snatch(@url)
    if Mailer.send_email(quote, @recipient_emails)
      p 'Email sent!'
    else
      p 'Email failed :('
    end
  end

  private

  def current_recipients
    Recipient.all.map(&:email)
  end
end

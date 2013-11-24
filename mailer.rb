require 'pony'

module Mailer
  def send_me_email(quote)
    Pony.mail(to: 'bobby.matson@gmail.com',
              subject: 'Quote of the Day',
              body: quote,
              via: :smtp,
              via_options: options)
  end

  private

  def options
    { address: 'smtp.gmail.com', port: '587', user_name: 'bobby.matson@gmail.com',
      password: ENV['PASSWORD'], authentication: :login }
  end
end

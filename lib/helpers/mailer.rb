require 'pony'

module Mailer
  class << self
    def send_email(quote, recipients)
      Pony.mail(to: recipients,
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
end

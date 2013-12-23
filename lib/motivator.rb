require 'bundler/setup'

require_relative '../lib/helpers/crawler'
require_relative '../lib/helpers/mailer'
require_relative '../lib/motivator/motivator.rb'

if __FILE__ == $0
  self_esteem = Motivator.new
  self_esteem.url = 'http://onboardly.com/content-marketing/101-kickass-startup-quote'
  self_esteem.encourage!
end

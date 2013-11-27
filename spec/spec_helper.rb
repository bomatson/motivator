require_relative '../app.rb'
require_relative '../lib/motivator'

ENV['RACK_ENV'] = 'test'

require 'fakeweb'
require 'sinatra'
require 'rack/test'

set :run, false
set :raise_errors, true

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) { DataMapper.auto_migrate! }
end

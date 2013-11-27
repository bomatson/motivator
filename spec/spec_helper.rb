require_relative '../app/app.rb'
require_relative '../lib/motivator'

require 'fakeweb'
require 'sinatra'
require 'rack/test'

set :enviornment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

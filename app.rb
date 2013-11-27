require 'sinatra'

configure do
  DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/app.db")
end

class Recipient
  include DataMapper::Resource

  property :email
end

configure :development do
  DataMapper.auto_upgrade!
end

before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

get '/' do
  'Testing'
end

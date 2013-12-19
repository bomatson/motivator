require 'sinatra'
require 'sqlite3'
require 'pg'
require 'dm-core'
require 'dm-timestamps'
require 'dm-migrations'
require './lib/motivator'

configure do
  DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/app.db")
end

class Recipient
  include DataMapper::Resource

  property :id,    Serial
  property :email, String
end

configure :development do
  DataMapper.auto_upgrade!
end

before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

get '/' do
  haml :home
end

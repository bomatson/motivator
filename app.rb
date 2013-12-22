require 'sinatra'
require 'haml'
require 'sqlite3'
require 'pg'
require 'dm-core'
require 'dm-timestamps'
require 'dm-migrations'
require 'dm-validations'
require './lib/motivator'

configure do
  DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/app.db")
end

class Recipient
  include DataMapper::Resource

  property :id,    Serial
  property :email, String, required: true, unique: true, format: :email_address
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

post '/create' do
  @recipient = Recipient.new(params[:recipient])
  if @recipient.save
    redirect "/show/#{@recipient.id}"
  else
    redirect('/')
  end
end

get '/show/:id' do
  @recipient = Recipient.get(params[:id])
  haml :show
end

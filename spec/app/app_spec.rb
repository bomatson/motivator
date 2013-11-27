require 'spec_helper'

describe 'Sinatra App' do
  it 'repsonds to root get' do
    get '/'
    expect(last_response.body).to match(/Testing/)
  end
end

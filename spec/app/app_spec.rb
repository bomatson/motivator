require 'spec_helper'

describe 'Sinatra App' do
  context 'home page' do
    it 'display a form' do
      get '/'
      expect(last_response.body).to match(/Testing/)
    end
  end
end

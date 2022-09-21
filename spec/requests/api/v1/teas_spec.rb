require 'rails_helper'

RSpec.describe '/teas', type: :request do
  describe 'happy paths' do
    it '#create' do
      info = { "title": 'black tea',
               "description": 'super hype goodness',
               "brew_details": 'Steep in 45 ml of medium high temp water for 15 minutes' }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/teas', headers: headers, params: JSON.generate(info)

      expect(response).to be_successful

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a Hash

      tea = parsed_body[:data]

      expect(tea).to have_key :id
      expect(tea[:id]).to be_a String
      expect(tea).to have_key :type
      expect(tea[:type]).to eq('tea')

      expect(tea).to have_key :attributes

      expect(tea[:attributes]).to have_key :title
      expect(tea[:attributes][:title]).to be_a String
      expect(tea[:attributes]).to have_key :description
      expect(tea[:attributes][:description]).to be_a String
      expect(tea[:attributes]).to have_key :brew_details
      expect(tea[:attributes][:brew_details]).to be_a String
    end
    it '#index' do
      tea1 = Tea.create!(title: 'Black Tea', description: 'super hype goodness', brew_details: 'Do the thing')
      tea2 = Tea.create!(title: 'Green Tea', description: 'sorta hype goodness', brew_details: 'Do the other thing')

      get '/api/v1/teas'

      expect(response).to be_successful

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a Array
      expect(parsed_body[:data].length).to eq 2

      tea = parsed_body[:data][0]

      expect(tea).to have_key :attributes

      expect(tea[:attributes]).to have_key :title
      expect(tea[:attributes][:title]).to be_a String
      expect(tea[:attributes]).to have_key :description
      expect(tea[:attributes][:description]).to be_a String
      expect(tea[:attributes]).to have_key :brew_details
      expect(tea[:attributes][:brew_details]).to be_a String
    end
  end
end

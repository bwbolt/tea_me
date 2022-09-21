require 'rails_helper'

RSpec.describe '/customers', type: :request do
  describe 'happy paths' do
    it '#create' do
      info = {
        "first_name": 'Bryce',
        "last_name": 'Wein',
        "email": 'bryce.wein@gmail.com',
        "address": '816 Shetland Drive Chesapeake Va 23322'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/customers', headers: headers, params: JSON.generate(info)

      expect(response).to be_successful

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a Hash

      customer = parsed_body[:data]

      expect(customer).to have_key :id
      expect(customer[:id]).to be_a String
      expect(customer).to have_key :type
      expect(customer[:type]).to eq('customer')

      expect(customer).to have_key :relationships
      expect(customer[:relationships]).to be_a Hash

      expect(customer[:relationships]).to have_key :subscriptions
      expect(customer[:relationships][:subscriptions]).to be_a Hash

      expect(customer[:relationships][:subscriptions]).to have_key :data
      expect(customer[:relationships][:subscriptions][:data]).to be_a Array

      expect(customer).to have_key :attributes

      expect(customer[:attributes]).to have_key :first_name
      expect(customer[:attributes][:first_name]).to be_a String
      expect(customer[:attributes]).to have_key :last_name
      expect(customer[:attributes][:last_name]).to be_a String
      expect(customer[:attributes]).to have_key :email
      expect(customer[:attributes][:email]).to be_a String
      expect(customer[:attributes]).to have_key :address
      expect(customer[:attributes][:address]).to be_a String
    end
    it '#index' do
      customer1 = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                   address: '816 shetland drive')
      customer2 = Customer.create!(first_name: 'Tim', last_name: 'Brewer', email: 'Tim@gmail.com',
                                   address: '1234 somewhere else VA')

      get '/api/v1/customers'

      expect(response).to be_successful

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a Array
      expect(parsed_body[:data].length).to eq 2

      customer = parsed_body[:data][0]

      expect(customer).to have_key :attributes

      expect(customer[:attributes]).to have_key :first_name
      expect(customer[:attributes][:first_name]).to be_a String
      expect(customer[:attributes]).to have_key :last_name
      expect(customer[:attributes][:last_name]).to be_a String
      expect(customer[:attributes]).to have_key :email
      expect(customer[:attributes][:email]).to be_a String
      expect(customer[:attributes]).to have_key :address
      expect(customer[:attributes][:address]).to be_a String
    end
  end
end

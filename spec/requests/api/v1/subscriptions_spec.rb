require 'rails_helper'

RSpec.describe '/subscriptions', type: :request do
  describe 'happy paths' do
    it '#create' do
      customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                  address: '816 shetland drive')

      tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                        brew_details: 'Do the thing')
      info = { "frequency": '30',
               "customer_id": "#{customer.id}",
               "tea_id": "#{tea.id}" }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/subscribe', headers: headers, params: JSON.generate(info)

      expect(response).to be_successful

      parsed_body = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_body).to have_key(:data)
      expect(parsed_body[:data]).to be_a Hash

      subscription = parsed_body[:data]

      expect(subscription).to have_key :id
      expect(subscription[:id]).to be_a String
      expect(subscription).to have_key :type
      expect(subscription[:type]).to eq('subscription')

      expect(subscription).to have_key :attributes

      expect(subscription[:attributes]).to have_key :frequency
      expect(subscription[:attributes][:frequency]).to be_a Integer
      expect(subscription[:attributes]).to have_key :customer_id
      expect(subscription[:attributes][:customer_id]).to be_a Integer
      expect(subscription[:attributes]).to have_key :tea_id
      expect(subscription[:attributes][:tea_id]).to be_a Integer
    end

    it '#destroy' do
      customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                  address: '816 shetland drive')

      tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                        brew_details: 'Do the thing')

      subscription = Subscription.create!(frequency: 30, customer_id: customer.id, tea_id: tea.id)

      expect(Subscription.first[:active]).to eq('Active')

      info = { "id": "#{subscription.id}" }

      delete '/api/v1/unsubscribe', headers: headers, params: info

      expect(Subscription.first[:active]).to eq('Inactive')
    end
  end

  describe 'sad paths' do
    describe '#create' do
      it 'missing data (frequency)' do
        customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                    address: '816 shetland drive')

        tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                          brew_details: 'Do the thing')
        info = {
          "customer_id": "#{customer.id}",
          "tea_id": "#{tea.id}"
        }

        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/subscribe', headers: headers, params: JSON.generate(info)

        expect(response).to_not be_successful

        parsed_body = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_body).to eq({ frequency: ["can't be blank"] })
      end

      it 'missing data (customer_id)' do
        customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                    address: '816 shetland drive')

        tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                          brew_details: 'Do the thing')
        info = { "frequency": '30',
                 "tea_id": "#{tea.id}" }

        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/subscribe', headers: headers, params: JSON.generate(info)

        expect(response).to_not be_successful

        parsed_body = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_body).to eq({ customer_id: ["can't be blank"] })
      end

      it 'missing data (tea_id)' do
        customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                    address: '816 shetland drive')

        tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                          brew_details: 'Do the thing')
        info = { "frequency": '30',
                 "customer_id": "#{customer.id}" }

        headers = { 'CONTENT_TYPE' => 'application/json' }

        post '/api/v1/subscribe', headers: headers, params: JSON.generate(info)

        expect(response).to_not be_successful

        parsed_body = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_body).to eq({ tea: ['must exist'] })
      end
    end
    describe '#destroy' do
      it 'missing data (subscription id)' do
        customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                    address: '816 shetland drive')

        tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                          brew_details: 'Do the thing')

        subscription = Subscription.create!(frequency: 30, customer_id: customer.id, tea_id: tea.id)

        expect(Subscription.first[:active]).to eq('Active')

        info = { "useless_info": 'yep' }

        delete '/api/v1/unsubscribe', headers: headers, params: info

        expect(response).to_not be_successful

        parsed_body = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_body).to eq({ id: ["can't be blank"] })
      end
      it 'missing data (unknown id)' do
        customer = Customer.create!(first_name: 'Bryce', last_name: 'Wein', email: 'bryce.wein@gmail.com',
                                    address: '816 shetland drive')

        tea = Tea.create!(title: 'Black Tea', description: 'super hype goodness',
                          brew_details: 'Do the thing')

        subscription = Subscription.create!(frequency: 30, customer_id: customer.id, tea_id: tea.id)

        expect(Subscription.first[:active]).to eq('Active')

        info = { "id": "#{subscription.id + 1}" }

        delete '/api/v1/unsubscribe', headers: headers, params: info

        expect(response).to_not be_successful

        parsed_body = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_body).to eq({ id: ['does not exist'] })
      end
    end
  end
end

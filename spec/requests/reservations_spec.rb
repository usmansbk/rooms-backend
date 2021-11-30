require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      response(200, 'successful') do
        before { create_list(:reservations, 5) }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(5)
        end
      end
    end

    post('create reservation') do
      response(200, 'successful') do
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      response(200, 'successful') do
        let(:id) { '123' }

        run_test!
      end
    end
  end
end

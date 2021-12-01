require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  login_user
  path '/reservations' do
    get('list reservations') do
      tags 'Reservation'
      security [Bearer: []]
      response(200, 'successful') do
        let(:Authorization) { @token }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservation'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :form, in: :body, required: true, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: { nights: { type: :string }, check_in: { type: :string }, room_id: { type: :string } }
          }
        },
        required: %w[nights check_in room_id]
      }
      response(201, 'successful') do
        let(:Authorization) { @token }
        let(:form) { { reservation: attributes_for(:reservation, room_id: create(:room).id) } }
        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete reservation') do
      tags 'Reservation'
      security [Bearer: []]
      response(204, 'successful') do
        let(:Authorization) { @token }
        let(:id) { create(:reservation, user: @user).id }

        run_test!
      end
    end
  end
end

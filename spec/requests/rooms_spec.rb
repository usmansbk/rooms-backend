require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/rooms' do
    get('list rooms') do
      tags 'Room'
      response(200, 'successful') do
        run_test!
      end
    end

    post('create room') do
      tags 'Room'
      security [bearer_auth: []]
      consumes 'application/json'
      parameter name: :form, in: :body, required: true, schema: {
        type: :object,
        properties: {
          room: {
            type: :object,
            properties: {
              name: { type: :string },
              city: { type: :string },
              bed_type: { type: :string },
              facilities: { type: :string },
              picture: { type: :string },
              price: { type: :integer },
              size: { type: :integer }
            }
          }
        },
        required: %w[name city bed_type facilities picture price size]
      }

      response(201, 'successful') do
        login_user
        let(:form) { { room: attributes_for(:room) } }
        run_test!
      end
    end
  end

  path '/rooms/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('room details') do
      tags 'Room'
      response(200, 'successful') do
        let(:id) { create(:room).id }
        run_test!
      end
    end

    delete('delete room') do
      tags 'Room'
      security [bearer_auth: []]

      response(204, 'successful') do
        login_user
        let(:Authorization) { "Bearer #{@user.jti}" }
        let(:id) { create(:room, user: @user).id }
        run_test!
      end
    end
  end
end

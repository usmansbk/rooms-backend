require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  login_user
  path '/rooms' do
    get('list rooms') do
      tags 'Room'
      security [Bearer: []]
      response(200, 'successful') do
        let(:Authorization) { @token }
        run_test!
      end
    end

    post('create room') do
      tags 'Room'
      security [Bearer: []]
      consumes 'multipart/form-data'
      parameter name: :room, in: :formData, schema: {
        type: :object,
        properties: { name: { type: :string }, city: { type: :string },
                      bed_type: { type: :string }, facilities: { type: :string },
                      picture: { type: :file }, price: { type: :integer },
                      size: { type: :integer } },
        required: %w[name city bed_type facilities picture price size]
      }

      response(201, 'successful') do
        let(:Authorization) { @token }
        let(:room) { attributes_for(:room) }
        run_test!
      end
    end
  end

  path '/rooms/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('room details') do
      tags 'Room'
      security [Bearer: []]
      response(200, 'successful') do
        let(:Authorization) { @token }
        let(:id) { create(:room).id }
        run_test!
      end
    end

    delete('delete room') do
      tags 'Room'
      security [Bearer: []]
      response(204, 'successful') do
        let(:Authorization) { @token }
        let(:id) { create(:room, user: @user).id }
        run_test!
      end
    end
  end
end

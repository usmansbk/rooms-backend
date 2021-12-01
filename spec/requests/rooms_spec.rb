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
      consumes 'multipart/form-data'
      parameter name: :room, in: :formData, required: true, schema: {
        type: :object,
        properties: { name: { type: :string }, city: { type: :string },
                      bed_type: { type: :string }, facilities: { type: :string },
                      picture: { type: :file }, price: { type: :integer },
                      size: { type: :integer } },
        required: %w[name city bed_type facilities picture price size]
      }

      response(201, 'successful') do
        login_user
        let(:room) { attributes_for(:room) }
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
  end
end
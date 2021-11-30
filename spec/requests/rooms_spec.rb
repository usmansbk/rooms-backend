require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/rooms' do
    get('list rooms') do
      response(200, 'successful') do
        before { create_list(:room, 5) }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to eq(5)
        end
      end
    end

    post('create room') do
      security [bearer_auth: []]

      response(201, 'successful') do
        login_user
        run_test!
      end
    end
  end

  path '/rooms/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('room details') do
      response(200, 'successful') do
        let(:id) { create(:room).id }
        run_test!
      end
    end

    delete('delete room') do
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

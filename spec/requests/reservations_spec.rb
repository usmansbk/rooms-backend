require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/reservations' do
    get('list reservations') do
      tags 'Reservation'
      response(200, 'successful') do
        login_user
        run_test!
      end
    end
end
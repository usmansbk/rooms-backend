require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/rooms' do
    get('list rooms') do
      tags 'Room'
      response(200, 'successful') do
        run_test!
      end
    end
  end
end
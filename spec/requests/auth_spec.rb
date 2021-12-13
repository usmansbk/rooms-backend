require 'swagger_helper'

RSpec.describe 'Auth API', type: :request do
  path '/register' do
    post 'Creates a new account' do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :form, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: %w[name email password]
      }

      response '201', 'user created' do
        let(:form) { { user: attributes_for(:user) } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:form) { { user: attributes_for(:user, email: create(:user)) } }
        run_test!
      end
    end
  end

  path '/login' do
    post 'Authenticate user' do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :form, in: :body, required: true, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        },
        required: %w[name email password]
      }

      response '201', 'logged in' do
        let(:user) { create(:user) }
        let(:form) { { user: { email: user.email, password: user.password } } }
        run_test!
      end

      response '401', 'invalid request' do
        let(:form) { { user: attributes_for(:user) } }
        run_test!
      end
    end
  end

  path '/logout' do
    login_user
    delete 'Log out current user' do
      tags 'Auth'
      security [Bearer: []]
      consumes 'application/json'

      response '204', 'idempotent' do
        let(:Authorization) { @token }
        run_test!
      end
    end
  end
end

require 'devise/jwt/test_helpers'

module ControllerMacros
  def login_user
    before(:each) do
      @user = FactoryBot.create :user
      auth_headers = Devise::JWT::TestHelpers.auth_headers({}, @user)
      @token = auth_headers['Authorization']
    end
  end
end

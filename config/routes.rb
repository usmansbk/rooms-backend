Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: '',
            path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  resources :reservations, defaults: { format: :json }
  resources :rooms, defaults: { format: :json }
end

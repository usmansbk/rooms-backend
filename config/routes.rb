Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, path: '',
            path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'

  defaults format: :json do
    resources :reservations, only: [:index, :create, :destroy]
    resources :rooms, only: [:index, :show, :create, :destroy]
  end
end

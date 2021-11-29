Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    post 'login', to: 'devise/sessions#create', defaults: { format: :json }
    delete 'logout', to: 'devise/sessions#destroy', defaults: { format: :json }
    post 'register', to: 'devise/registrations#create', defaults: { format: :json }
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments
    resources :favos, only: [:index, :create]
  end
  resources :users, only: :show
end
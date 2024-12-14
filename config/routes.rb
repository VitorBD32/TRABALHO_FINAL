Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  get 'welcome/index'

  resources :reservas, only: [:index]

  
  #Usuário tem várias reservas
  #Uma reserva tem UM quarto


  namespace :administrativo do  
    resources :servicos
    resources :reservas
    resources :quartos
    resources :funcionarios
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"
end

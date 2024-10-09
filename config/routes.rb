Rails.application.routes.draw do
  resources :roles
  resources :clubs
  devise_for :users
  root "clubs#index"

  # delete user
  devise_scope :user do
    get '/users' => 'users#destroy'
  end

  #sign out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # config/routes.rb
  resources :clubs do
    post 'invite', on: :member   # Route for inviting users
  end

  resources :invitations, only: [:index] do
    member do
      get 'accept'
      post 'accept'   # Route for accepting an invite
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get "/clubs/:id/invite_form" => "clubs#invite_form", as: :club_invite_form
end

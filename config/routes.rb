Rails.application.routes.draw do
  devise_for :companies
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:show] do
    member do
      get '/players_count', to: 'game_sessions#players_count', as: :players_count
      get '/players_ordered', to: 'game_sessions#players_ordered', as: :players_ordered
    end
  end
  resources :players, only: [:show, :edit, :update] do
    resources :questions, only: [:show] do
      get '/countdown', to: 'questions#countdown', as: :countdown
      resources :answers, only: :create
    end
  end

  mount Attachinary::Engine => "/attachinary"
  Rails.application.routes.draw do
  # # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin } do
  mount Sidekiq::Web => '/sidekiq'
  end
end

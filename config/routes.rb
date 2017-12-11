Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'

  devise_for :companies
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:show] do
    member do
      get '/players_count', to: 'game_sessions#players_count', as: :players_count
    end
  end
  resources :players, only: [:show, :edit, :update] do
    resources :questions, only: :show do
      resources :answers, only: :create
    end
  end

  mount Attachinary::Engine => "/attachinary"

end

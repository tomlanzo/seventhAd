Rails.application.routes.draw do
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:show] do
    member do
      get '/players_count', to: 'game_sessions#players_count', as: :players_count
    end
  end

  mount Attachinary::Engine => "/attachinary"
end

Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:show] do
    member do
      resources :players, only: [:index]
    end
  end

  mount Attachinary::Engine => "/attachinary"
end

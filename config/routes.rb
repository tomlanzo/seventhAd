Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :game_sessions, only: [:show] do
    resources :questions, only: :show do
      resources :answers, only: :create
    end
  end
    resources :players, only: [:edit, :update]
  mount Attachinary::Engine => "/attachinary"
end

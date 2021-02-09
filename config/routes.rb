Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages do
    resources :buttons
  end
end

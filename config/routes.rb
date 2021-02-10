Rails.application.routes.draw do
  root to: 'pages#index'

  resources :pages do
    resources :buttons, controller: "content_elements/buttons"
    resources :headlines, controller: "content_elements/headlines"
  end
end

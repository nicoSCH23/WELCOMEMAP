Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services

  scope '(:locale)', locale: /fr/ do
    root to: 'pages#home'
    resources :services

    # MAYBE ADD LATER HERE SERVICES?
  end
end

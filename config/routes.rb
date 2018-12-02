Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /fr/ do
    root to: 'pages#home'
    # resources :restaurants
    # MAYBE ADD LATER HERE SERVICES?
  end


end

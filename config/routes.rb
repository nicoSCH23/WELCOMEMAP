Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :services do
    resources :activity_slots, only: [:create, :new]
  end
  resources :activity_slots, only: [:edit, :update, :destroy]

  scope '(:locale)', locale: /fr/ do
    root to: 'pages#home'
    resources :services do
      resources :activity_slots, only: [:create, :new]
    end
    resources :activity_slots, only: [:edit, :update, :destroy]  end
end

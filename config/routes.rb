Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :deals
  resources :items

  resources :deals do
    resources :deal_items
    resources :payments, only: [:new, :create]
  end

  resources :items do
    resources :deal_items
  end

end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  resources :items do
    resources :deals
  end

  resources :deals do
    resources :deal_items
  end

end

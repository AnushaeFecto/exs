Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :items

  resources :deals do
    post "accept_deal", to: "deals#accept_deal"
    post "reject_deal", to: "deals#reject_deal"
    resources :deal_items
    resources :payments, only: [:new, :create]
  end

  resources :items do
    resources :deal_items
  end

end

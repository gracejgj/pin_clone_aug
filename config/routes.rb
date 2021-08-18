Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#homepage'

  resources :users, only: [:show]
  resources :boards #check using rails routes -g boards  if not familiar

end

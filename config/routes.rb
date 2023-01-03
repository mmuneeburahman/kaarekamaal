Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  resources "cases"
  resources "members"
  get 'closes/:id', to: 'cases#close_case'
  get 'verify/:id', to: 'cases#verify_case'
end

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :update, :member, :makemember]
  # devise_scope :users do
  # get 'users/member/:id', to: 'users#member'
  get 'member/new/:id', to: 'users#member'
  patch  'member/become/:id', to: 'users#makemember'
  # end
  # get 'users/:id', to: 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  # resources "cases"
  resources :cases do
    resources :comments
  end

  resources "members"
  get 'closes/:id', to: 'cases#close_case'
  get 'verify/:id', to: 'cases#verify_case'
  get 'events', to: 'home#event'

end

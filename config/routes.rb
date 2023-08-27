Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
 # get 'articles/index'
  root 'articles#index'

  get 'download', to: 'users#download' 
  get 'preview', to: 'users#preview' 

  get 'user/pdf/:id', to: 'users#pdf', as: 'post_pdf'

 resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  resources :articles
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do

  get 'signup', to:'users#new'
  post 'users', to:'users#create'
  post 'users', to:'users#update'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy'
  post 'logout', to:'sessions#destroy'
  resources :articles
  resources :users


  # Define  your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

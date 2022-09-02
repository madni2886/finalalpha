Rails.application.routes.draw do
  root "articles#index"
  get "signup", to: "users#new"
  get "suggestion", to: "search#load_suggestions"
  get "search", to: "search#index"
  post "users", to: "users#create"
  post "users", to: "users#update"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  post "logout", to: "sessions#destroy"
  resources :users do
    resources :articles do
      resources :comments
    end
  end
  # Define  your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

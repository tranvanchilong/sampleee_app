Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get '/help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'signup', to: 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/comments/:id', to: 'comments#destroy'
  # resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy, :delete]
  resources :relationships, only: [:create, :destroy]
 
  resources :comments, only: [:create, :destroy]

  resources :statuses
    resources :status_comments
  resources :users, only: %i(index show new create update)
    resources :products, only: %i(index show new create)
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
end

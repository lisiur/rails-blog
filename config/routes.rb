Rails.application.routes.draw do


  namespace :index do
  get 'home/index'
  end

  root 'index/home#index'

  namespace :manage do
    resources :users
  end

  namespace :admin do
    get '/' => "index#index"
    get 'index/index'
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'login' => 'session#destroy'
    resources :authors
    resources :archives
    resources :categories
    resources :tags
    resources :articles
    resources :messages
  end

  namespace :index do
    resources :users
  end
end

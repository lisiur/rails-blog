Rails.application.routes.draw do

  namespace :index do
    get 'home/index'
    get 'article/:title' => 'home#show',title: /[^\/]+/,as: :article
    resources :users
  end

  root 'index/home#index'
  get '/u/:name' => "index/home#user"
  get '/tag/:name' => "index/home#tag"
  get '/category/:name' => 'index/home#category'
  get '/search/:keywords' => 'index/home#search'
  get '/article-type/:name' => 'index/home#article_type'
  namespace :manage do
    get '/' => "index#index"
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'login' => 'session#destroy'
    resources :users
    resources :authors
    resources :article_types
  end

  namespace :admin do
    get '/' => "index#index"
    get 'index/index'
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    delete 'logout' => 'session#destroy'
    resources :archives
    resources :categories
    resources :tags
    resources :articles
    resources :messages
    resources :authors,only:[:index,:edit,:update,:show]
    get 'repassword' => 'authors#repassword'
    post 'repassword' => 'authors#update_password'
  end

end

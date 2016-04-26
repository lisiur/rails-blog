Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  namespace :index do
    get 'home/index'
    get 'article/:title' => 'home#show',title: /[^\/]+/,as: :article
  end

  root 'index/home#index'
  get '/u/:user' => "index/users#index"
  get '/u/:user/tag/:name' => "index/users#tag"
  get '/u/:user/category/:name' => 'index/users#category'
  post '/search' => 'index/home#search'
  post '/search/:user' => 'index/users#search'
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
    get 'category/:name' => 'articles#category'
    get 'tag/:name' => 'articles#tag'
    get 'archive/:year/:month' => 'articles#archive'
    resources :archives
    resources :categories
    resources :tags
    resources :articles
    resources :messages
    resources :authors,only:[:index,:edit,:update,:show]
    get 'repassword' => 'authors#repassword'
    post 'repassword' => 'authors#update_password'
    post 'mdtools/preview' => 'mdtools#preview'
  end

end

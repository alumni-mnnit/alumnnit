Rails.application.routes.draw do


  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'pages#home'
  resources :searches
  resources :users, only: [:show]
  get '/about' => 'pages#about' 
  get '/fund'	=> 'pages#fund'
  get '/activate' => 'pages#activate'
  get '/coming_soon' => 'pages#coming_soon'
  get '/academics' => 'requests#academics'
  post '/send_activate' => 'requests#send_activate'
  	resources :requests 

  	resources :contacts
 
end

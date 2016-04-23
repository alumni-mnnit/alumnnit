Rails.application.routes.draw do

  
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'pages#home'
  get '/about' => 'pages#about' 
  get '/contact' => 'pages#contact' 
  get '/fund'	=> 'pages#fund'
  get '/activate' => 'pages#activate'
  
  	resources :requests 
 
end

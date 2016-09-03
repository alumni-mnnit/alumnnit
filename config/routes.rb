Rails.application.routes.draw do
  

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root 'pages#home'
  resources :searches
  resources :news
  resources :users, only: [:show]
  get '/about' => 'pages#about' 
  get '/fund'	=> 'pages#fund'
  get '/activate' => 'pages#activate'
  get '/coming_soon' => 'pages#coming_soon'
  get '/academics' => 'requests#academics'
  post '/send_activate' => 'requests#send_activate'
  get '/chapters' => 'pages#chapters'
  get '/downloads' => 'pages#downloads'
  get '/idcard' => 'id_card#index'
  get '/idcard/register' => 'id_card#register'
  get '/idcard/payment' => 'id_card#id_payment'
  get '/conventions/payment' => 'conventions#convention_payment'
  get '/create_payment_sj' => 'convention_requests#create_payment_sj'
  get '/create_payment_ot' => 'convention_requests#create_payment_ot'
  	resources :requests 

  	resources :contacts
    resources :feedbacks
    resources :conventions
    resources :convention_requests
    resources :jobs
    

end

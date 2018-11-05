
Rails.application.routes.draw do

  
  # resources :comments
  devise_for :users, :controllers => { registrations: 'registrations' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/residential' =>'home#residential'
  get '/commercial' =>'home#commercial'
  get '/quote' =>'quote#quote'
  get '/index-RocketElevators.html' =>'home#index'
  get '/index-rocketElevators-residential.html' => 'home#residential'
  get '/index-rocketElevators-commercial.html' => 'home#commercial'
  get '/index-Quote.html' => 'quote#quote'
  post '/new_quote' =>'quote#new_quote'
  post '/new_lead' =>'lead#new_lead'
  get '/chart' =>'charts#chart'

  post '/new_sms' => 'sms#new_sms'
  get '/new_sms' => 'sms#new_sms'
  get '/audio_info' => 'watson#index'

  get '/map' => 'google#google'

  get 'admin/audio_info' => 'watson#index'
 
  
  root 'home#index'

end


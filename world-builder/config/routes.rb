Rails.application.routes.draw do
  
  resources :campaigns
  resources :users
  resources :worlds
  resources :tags
  resources :locations
  root :to => redirect('/campaigns')
  
  
end

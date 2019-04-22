Rails.application.routes.draw do
  
  resources :campaigns
  resources :npcs
  resources :users
  resources :worlds
  resources :tags
  resources :locations
  root :to => redirect('/campaigns')
  
  
end

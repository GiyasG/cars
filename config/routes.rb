Rails.application.routes.draw do

  root 'companies#index'
  devise_for :users
  resources :users
  resources :companies
end

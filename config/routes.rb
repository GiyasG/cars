Rails.application.routes.draw do

  root 'companies#index'
  match 'show_company/:company_id' => 'logos#show_company', as: :show_company, via: [:get]
  devise_for :users
  resources :users
  resources :companies do
    resources :logos
  end
end

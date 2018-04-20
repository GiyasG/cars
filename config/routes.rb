Rails.application.routes.draw do

  root 'companies#index'
  match 'show_company/:company_id' => 'logos#show_company', as: :show_company, via: [:get]
  # match 'companies/:id/' => "companies#show_current_company", :as => :show_current_company, via: [:get]
  match 'show_car/:car_id' => 'photos#show_car', as: :show_car, via: [:get]
  match 'show_carpart/:carpart_id' => 'photos#show_carpart', as: :show_carpart, via: [:get]

  match 'add_detail/' => 'carparts#add_detail', as: :add_detail, via: [:get]

  devise_for :users
  resources :users
  resources :companies do
    resources :logos
    resources :cars do
      resources :carparts
    end
  end
end

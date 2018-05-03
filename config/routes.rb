Rails.application.routes.draw do

  root 'companies#index'
  match 'show_company/:company_id' => 'logos#show_company', as: :show_company, via: [:get]
  # match 'companies/:id/' => "companies#show_current_company", :as => :show_current_company, via: [:get]
  match 'show_car/:car_id' => 'photos#show_car', as: :show_car, via: [:get]
  match 'show_carpart/:carpart_id' => 'photos#show_carpart', as: :show_carpart, via: [:get]

  match 'add_detail/:company_id/:car_id' => 'carparts#add_detail', as: :add_detail, via: [:get]
  match 'search_make/' => 'cars#search_make', as: :search_make, via: [:get]
  match 'search_model/' => 'cars#search_model', as: :search_model, via: [:get]
  match 'search_part/' => 'carparts#search_part', as: :search_part, via: [:get]

  devise_for :users
  resources :users
  resources :companies do
    resources :logos
    resources :cars do
      resources :carparts
    end
  end
end

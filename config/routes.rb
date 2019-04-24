Rails.application.routes.draw do
  resources :tafs
  resources :taf_items
  resources :request_items
  resources :line_items
  resources :carts
  root 'company#index', as: 'company_index'
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

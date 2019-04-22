Rails.application.routes.draw do
  root 'company#index', as: 'company_index'
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

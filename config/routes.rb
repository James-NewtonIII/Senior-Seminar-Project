Rails.application.routes.draw do

  namespace :admin do
    resources :accounts
    resources :budget_approvers
    resources :carts
    resources :departments
    resources :employees
    resources :items
    resources :line_items
    resources :payment_managers
    resources :request_items
    resources :tafs
    resources :taf_items
    resources :taf_line_items
    resources :super_accounts
    root to: "accounts#index"
  end
 
  
  devise_for :account, :controllers => { :registrations => 'registrations' }

  resources :taf_items
  resources :taf_line_items
  resources :tafs
  
  resources :items
  resources :line_items
  resources :carts
  
  resources :departments
  resources :employees
  resources :budget_approvers
  resources :payment_managers
  root 'company#index', as: 'company_index'


  resources :taf_items do
    member do
        post :decision
    end
  end

  resources :taf_line_items do
    member do
        post :decision
    end
  end


  resources :items do
    member do
        post :decision
    end
  end

  resources :carts do
    member do
        post :decision
    end
  end

  resources :tafs do
    member do
        post :decision
    end
  end


 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

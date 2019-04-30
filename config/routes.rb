Rails.application.routes.draw do

  namespace :admin do
    resources :accounts
    resources :budget_approvers
    resources :carts
    resources :departments
    resources :employees
    resources :items
    resources :payment_managers
    resources :request_items
    resources :tafs
    resources :taf_items
    resources :super_accounts
    root to: "accounts#index"
  end
 
  devise_for :account, :controllers => { :registrations => 'registrations' }
  
  resources :taf_items
  resources :tafs
  
  resources :items
  resources :carts
  
  resources :departments
  resources :employees, only: [:edit, :update]
  resources :budget_approvers, only: [:edit, :update]
  resources :payment_managers, only: [:edit, :update]
  root 'company#index', as: 'company_index'


  resources :taf_items do
    member do
        post :decision
        get 'tafs', to: 'tafs#show'
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

  resources :employees do
    resources :taf_items                                          # a nested route: employee_taf_items_path
    resources :items                                              # a nested route: employee_items_path
    member do
        get 'tafs', to: 'taf_items#show_taf_items_for_employee'   # a nested route: orders_seller_path
        get 'carts', to: 'items#show_items_for_employee'          # a nested route: orders_seller_path
    end
  end


 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
 
  
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

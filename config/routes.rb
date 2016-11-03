Rails.application.routes.draw do
  get 'staffs/index'

  get 'staffs/show'

  get 'appointments/' => "appointments#index", as: :user_root

  devise_for :staffs, :path => 'accounts'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :schedules

  resources :clients do
    resources :schedules, only: [:index]
  end

  resources :appointments

  resources :clients do
    resources :appointments, only: [:index, :show, :new]
  end
  resources :staffs do
    resources :appointments, only: [:index, :show, :new]
  end
  get 'welcome/home'
  root 'welcome#home'

  get '/about', to: 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'appointments/edit'

  get 'appointments/index'

  get 'appointments/new'

  get 'appointments/show'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :appointments
  resources :clients do
    resources :appointments, only: [:index, :show, :new]
  end
  get 'welcome/home'
  root 'welcome#home'
  
  get '/about', to: 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

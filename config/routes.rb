Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: :create
  post 'alerts/create', to: 'alerts#create', as: :alert_create
  post 'alerts/delete/', to: 'alerts#delete', as: :alert_delete
  get '/alerts' , to: 'alerts#index', as: :alerts
end

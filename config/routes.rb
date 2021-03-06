Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'my_vacations', to: 'vacation_requests#my_vacations'
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  get 'users/remaining_days/:id', to: 'users#remaining_days'
  resources :users
  resource :user, only: [:show, :update]
  resources :vacation_requests
  resources :vacation_types
  resources :settings, only:[:index, :update]
  resources :documents, only:[:index, :create, :update, :destroy]
  mount Shrine.presign_endpoint(:cache) => "/presign"
end

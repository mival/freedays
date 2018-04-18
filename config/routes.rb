Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'my_vacations', to: 'vacation_requests#my_vacations'
  resources :users
  resource :user, only: [:show, :update]
  resources :vacation_requests
  resources :vacation_types
  resources :settings, only:[:index, :update]
  resources :documents, only:[:create, :update, :destroy]
end

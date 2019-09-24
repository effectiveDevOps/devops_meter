Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/api'
  root to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end

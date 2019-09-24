Rails.application.routes.draw do
  root to: 'users#new'
  get 'results', to: 'results#show'
  get 'dashboard/index'
  get 'dashboard/api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end

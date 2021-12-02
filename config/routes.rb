Rails.application.routes.draw do
  resources :tasks
  get 'app', to: 'tasks#index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

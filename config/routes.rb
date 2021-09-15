Rails.application.routes.draw do
  resources :orders do
    get :search, on: :collection
  end

  resources :users
  root to: 'orders#index', as: :root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

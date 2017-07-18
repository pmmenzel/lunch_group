Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ==== Removing/Adding back (do some ordering)
  root "users#index"

  resources :users
end

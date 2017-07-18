Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"

  resources :group, only: [:home] do
    collection do
      get :home
      get :generate_groups
    end
  end

  resources :users
end

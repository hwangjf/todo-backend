Rails.application.routes.draw do
  resources :items
  resources :user_lists
  resources :lists
  resources :users do
    resources :lists do
      resources :items
    end
  end
end

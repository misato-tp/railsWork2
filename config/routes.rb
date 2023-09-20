Rails.application.routes.draw do
  root 'top#index'
  resources :rooms
  devise_for :users
  resources :reservations do
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'reservations/comfirm'
  get 'rooms/new'
  get 'users/account'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rooms
end

Rails.application.routes.draw do
  root 'top#index'
  resources :rooms do
    collection do
      get 'own'
      get 'search'
    end
  end

  devise_for :users 

    get 'users/account'
    get 'users/profile'
    get 'users/profile/edit', to:'users#edit'
    patch 'users/profile', to:'users#update'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

    get 'reservations', to:'reservations#index'
    post 'reservations', to:'reservations#create'
    post 'reservations/confirm' => 'reservations#confirm'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

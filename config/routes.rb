Rails.application.routes.draw do
  root 'top#index'
  resources :rooms do
    collection do
      get 'own'
    end
  end

  devise_for :users 

  resources :users do
    collection do
      post :account
    end
    collection do
      post :profile do
        get :edit
      end
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :reservations do
    collection do
      post 'confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'categories#index', as: :authenticated_root
      get '/users/sign_out' => 'devise/sessions#destroy'
    end
    unauthenticated do
      root 'splash#home', as: :unauthenticated_root
    end
  end

  resources :categories, only: [:index, :show, :new, :create]
  resources :expenses, only: [:new, :create]
end

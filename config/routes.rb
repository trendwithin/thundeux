Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :memories do
    resources :comments, only: [:create, :update, :destroy]
  end
  root 'static_pages#home'
end

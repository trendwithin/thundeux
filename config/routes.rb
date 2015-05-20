Rails.application.routes.draw do
  devise_for :users
  resources :memories do
    resources :comments, only: [:create, :destroy]
  end
  root 'static_pages#home'
end

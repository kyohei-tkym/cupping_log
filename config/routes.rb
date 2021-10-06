Rails.application.routes.draw do
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

  devise_for :users

  resources :logs
end

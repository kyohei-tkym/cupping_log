Rails.application.routes.draw do
  get 'search/search'
  root to: 'homes#top'
  devise_for :users

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :logs do
    resources :log_comments, only: [:create, :destroy]
  end

  get '/search' => 'search#search'
end

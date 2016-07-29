Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
    devise_for :users
    resources :rooms, only: [:index, :show]
    resources :messages, only: :create
    root 'rooms#index'
end

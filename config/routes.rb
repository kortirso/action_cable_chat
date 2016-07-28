Rails.application.routes.draw do
    devise_for :users
    resources :rooms, only: [:index, :show]
    root 'rooms#index'
end

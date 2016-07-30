Rails.application.routes.draw do
    mount ActionCable.server => '/cable'
    devise_for :users
    resources :rooms, only: [:index, :show]
    resources :messages, only: :create
    scope path: '/invites', controller: :invites do
        post 'search' => :search
        post 'create' => :create
        post 'accept' => :accept
    end
    root 'rooms#index'
end

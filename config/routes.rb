Rails.application.routes.draw do
    devise_for :users
    resources :chat, only: :index
    root 'chat#index'
end

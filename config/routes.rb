require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts
  mount Sidekiq::Web => "/sidekiq"
end

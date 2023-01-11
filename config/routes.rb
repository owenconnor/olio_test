Rails.application.routes.draw do
  resources :olio_items, only: :index
  resources :likes, only: :create
end

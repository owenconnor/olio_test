Rails.application.routes.draw do
  get 'olio_items/index'
  resources :likes, only: :create
end

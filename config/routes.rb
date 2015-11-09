Rails.application.routes.draw do
  root to: 'search#index'

  namespace :search do
    post :query
    get :query, action: :index
  end

  resources :users, only: :show
  resources :tags, only: :show
end

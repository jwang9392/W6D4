Rails.application.routes.draw do
  resources :users, only: [:create, :index, :update, :show, :destroy] do
    resources :artwork_shares, :artworks, :comments, :likes, :collections, only: [:index]
  end

  resources :artworks, only: [:create, :update, :show, :destroy] do
    resources :artwork_shares, :comments, :likes, :collections, only: [:index]
    member do
      put 'favorite'
    end
  end

  resources :artwork_shares, only: [:create, :update, :show, :destroy] do
    member do
      put 'favorite'
    end
  end

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy]

  resources :collections, only: [:create, :update, :show, :destroy] 

  resources :collection_artworks, only: [:create, :update, :destroy] 
end
Rails.application.routes.draw do
  
  devise_for :users # this must come before the resources line to prevent routing issues
  
  resources :users, only: [:show, :index]
  
  resources :friendships, only: [:create, :destroy, :accept] do
    member do
      put :accept
    end
  end
  
  resources :posts, only: [:create, :update, :edit, :destroy]
  
  root 'welcome#index'
  
  resources :activities, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
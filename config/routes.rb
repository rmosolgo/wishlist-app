Rails.application.routes.draw do
  root to: "masters#new"

  resources :masters, only: [:new, :create, :show, :update, :destroy] do
    resources :items, only: [:create, :destroy, :update]
  end

  resources :previews, only: [:show]

  resources :shares, only: [:show] do
    resources :items, only: [] do
      resource :check, only: [:create, :destroy]
    end
  end
end

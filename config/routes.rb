Rails.application.routes.draw do
  root to: "masters#new"

  get "/master/:id/:title", to: "masters#show", as: :master_vanity
  get "/share/:id/:title", to: "shares#show", as: :share_vanity
  get "/preview/:id/:title", to: "previews#show", as: :preview_vanity

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

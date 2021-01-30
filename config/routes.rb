Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:show, :index, :create, :new, :edit, :update, :destroy] do
    resources :ingredients, only: [:create]
    resources :doses, only: [:create, :new, :update]
  end
end

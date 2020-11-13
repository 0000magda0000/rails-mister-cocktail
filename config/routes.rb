Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:show, :index, :create, :new, :edit, :update] do
    resources :ingredients, only: [:create]
    resources :doses, only: [:create, :new, :update]
  end
end


# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"

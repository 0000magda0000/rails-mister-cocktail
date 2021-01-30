Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails do
    resources :ingredients, only: [:create]
    resources :doses, only: [:create, :new, :update]
  end
end

Rails.application.routes.draw do
  get 'cocktail_tags/new'
  get 'cocktail_tags/create'
  get 'reviews/new'
  get 'reviews/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
    resources :cocktail_tags, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
  resources :cocktail_tags, only: [:destroy]

  root "cocktails#index"
end

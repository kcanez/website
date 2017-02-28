Rails.application.routes.draw do
  devise_for :users
  resources :beers do
	resources :reviews
  end
  root 'beers#index'
end

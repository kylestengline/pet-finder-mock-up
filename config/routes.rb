Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homepages#index'

  resources :dogs, only: [:index, :show]

  namespace :admin do
    resources :dogs
  end
end

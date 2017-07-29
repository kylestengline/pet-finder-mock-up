Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homepages#index'

  get "dogs/adoption", as: "adoption_info"
  get "dogs/home", as: "dog_home_info"
  get "dogs/training", as: "training_info"
  get "dogs/problems", as: "problems_info"
  get "dogs/grooming", as: "grooming_info"
  get "dogs/videos", as: "videos"
  get "dogs/involvement", as: "get_involved"
  resources :dogs, only: [:index, :show]

  get "searchs/index"

  namespace :admin do
    resources :dogs, only: [:edit, :create, :update, :new]
  end

  namespace :admin do
    resources :admins, only: [:index, :show]
  end

  resources :breeds, only: [:index, :show]

  devise_scope :admin do
    get "admins/sign_out" => "devise/sessions#destroy"
  end

end

Rails.application.routes.draw do
  resources :visits do
    member do
      get 'track_visitor'
      get 'release_locker'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "visits#index"

  resources :members
  resources :lockers
  resources :tenant_lockers
end

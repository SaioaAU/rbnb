Rails.application.routes.draw do
  devise_for :users
  root to: 'dogs#index'
  resources :dogs, except: :index do
    resources :rentals, only: [ :new, :create ]
  end
  resources :rentals, only: [ :destroy, :index, :show ] do
    member  do
      post 'confirm', to: "rentals#confirm"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

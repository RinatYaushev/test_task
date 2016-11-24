Rails.application.routes.draw do
  root 'home#index'

  resources :sliders do
    resources :slides, except: :index
    resources :posts, only: [:new, :create]
  end
end

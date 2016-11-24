Rails.application.routes.draw do
  root 'home#index'

  resources :sliders, except: :index do
    resources :slides, except: :index
    resources :posts, only: [:new, :create]
  end
end

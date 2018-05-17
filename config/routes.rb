Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:new, :create] do
    resources :reviews, only: [:new, :create]
    resources :doses, only: [:new, :create]
  end
end

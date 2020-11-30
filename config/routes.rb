Rails.application.routes.draw do

  resources :campaigns do
    resources :parties
  end

  resources :parties do
    resources :characters, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

 #resources :characters, only: [:edit, :update]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'welcome#home'
end

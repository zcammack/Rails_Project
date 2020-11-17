Rails.application.routes.draw do

  resources :dungeonmasters do
    resources :campaigns do
      resources :characters
    end
  end
  resources :players

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'
end

Rails.application.routes.draw do

  resources :campaigns do
    resources :parties
  end

  resources :characters

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'welcome#home'
end

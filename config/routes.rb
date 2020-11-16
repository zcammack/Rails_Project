Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, shallow: true do
    resources :characters
    resources :campaigns
  end 
#This puts the index, new, and create actions under users.

  root 'welcome#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

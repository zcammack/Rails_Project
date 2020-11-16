Rails.application.routes.draw do
  devise_for :dungeonmasters#, path: 'dungeonmasters', :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :users#, path: 'users', :controllers => { :omniauth_callbacks => "callbacks" }

  devise_scope :user do
    get "/users/auth/facebook/callback" => "users/omniauth_callbacks#facebook"
  end

  devise_scope :dungeonmasters do
    get "/dungeonmasters/auth/facebook/callback" => "dungeonmasters/omniauth_callbacks#facebook"
  end

  resources :users, shallow: true do
    resources :characters
    resources :campaigns
  end 
#This puts the index, new, and create actions under users.

  root 'welcome#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

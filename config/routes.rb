Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users do
    resources :characters, shallow: true
  end

  resources :campaigns 


  root 'welcome#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

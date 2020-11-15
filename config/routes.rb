Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :campaigns do
    resources :characters, shallow: true
  end


  root 'welcome#welcome'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

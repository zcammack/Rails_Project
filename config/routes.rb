Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'
  devise_for :users

  resources :campaigns do
    resources :characters, shallow: true
  end

  get 'profile/new'

  get 'profile/edit'

  get 'profile/show'

  get 'profile/welcome'

  root 'profile#welcome'

  get '/auth/facebook/callback' => 'sessions#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

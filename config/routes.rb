Rails.application.routes.draw do

  get 'dungeonmasters/:id/parties_with_for_or_more', :to => 'dungeonmasters#parties_with_4_or_more', :as => :parties_with_4_or_more
  post 'dungeonmasters/:id/campaigns/new', :to => 'campaigns#create'

  resources :dungeonmasters do
    resources :campaigns do
      resources :partys, only: [:parties_with_4_or_more]
    end
  end
  resources :players

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'welcome#home'
end

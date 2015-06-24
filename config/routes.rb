Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'welcome#index'

  # This will create all CRUD opts for tweets 
  resources :tweets

end

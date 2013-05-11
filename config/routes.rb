CoffeeFlopper::Application.routes.draw do
  root :to => 'shops#index'
  get "/oauth/connect" => 'shops#connect', :as => 'oauth_connect'

  get "/oauth/callback" => 'shops#callback', :as => 'oauth_callback'
  resources :shops 
end

CoffeeFlopper::Application.routes.draw do
  root :to => 'shops#index'
  resources :shops
  resources :addresses
end

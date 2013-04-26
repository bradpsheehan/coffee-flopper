CoffeeFlopper::Application.routes.draw do
  root :to => 'shops#index'
  resources :shops do 
    resources :addresses
  end
end

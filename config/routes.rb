CoreSample::Application.routes.draw do

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  match 'signup' => 'users#new'
  match 'buy_tshirt' => 'tshirts#buy_tshirt'
  match 'transparent_redirect_complete' => 'tshirts#transparent_redirect_complete'
  match 'successful_purchase' => 'tshirts#successful_purchase'

  resources :users
  resources :sessions

  root :to => "home#index"

end

Rails.application.routes.draw do
  root 'pages#home'
  resources :suitcases
  resources :items
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
end

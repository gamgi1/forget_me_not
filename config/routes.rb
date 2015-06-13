Rails.application.routes.draw do
  root 'pages#home'
  resources :items
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users do
    resources :suitcases
  end
end

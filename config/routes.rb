Rails.application.routes.draw do
  resources :genres
  root "movies#index"

  resources :users
  resource :session

  get 'register' => 'users#new'
  get "signin" => "sessions#new"  
  
  get "movies/filter/:scope" => "movies#index", as: :filtered_movies
  resources :movies do
    resources :reviews
    resources :favorites    
  end
end

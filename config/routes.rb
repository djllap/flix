Rails.application.routes.draw do
<<<<<<< HEAD
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
=======
  root "movies#index"
  resources :movies do
    resources :reviews
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
  end
end

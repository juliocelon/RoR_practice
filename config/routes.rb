Rails.application.routes.draw do

  resources :tweets
  resources :photos
  
  # get "photos/index"

  get "about/display"

  root to: "main#hello"
  post "hi", to: "main#greetings"

  get "companies", to: "companies#show"

  get "users/show"
  get "users", to: "users#show"

end
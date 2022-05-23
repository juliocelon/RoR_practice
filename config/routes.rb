Rails.application.routes.draw do

  resources :tweets
  # resources :photos
  resources :fotos , as: :photos, controller: :photos, path_names: { new: 'nuevo', edit: 'editar'}

  get "test/", to: "photos#test"

  get "about/display"

  root to: "main#hello"
  post "hi", to: "main#greetings"

  get "companies", to: "companies#show"

  get "users/show"
  # get "users", to: "users#show"
  get "usuarios", to: "users#show", as: :users

end
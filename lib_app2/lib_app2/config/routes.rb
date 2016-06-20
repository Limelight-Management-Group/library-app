Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root to: "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"

  get "/sign_in", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"
  delete "/sessions/logout", to: "sessions#destroy", as: "logout"


  get "libraries", to: "libraries#index"
  get "libraries/new", to: "libraries#new", as: "new_library"
  post "libraries", to: "libraries#create"

  get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"
  post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"



end

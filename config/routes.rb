Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/cars/:id", to: "pages#show", as: :show_cars
  get "/cars/:user_id/:car_id/bookings/new", to: "bookings#new"
  post "/cars/:user_id/:car_id/bookings", to: "bookings#create"
  delete "/cars/:user_id/:car_id/bookings/:id", to: "bookings#destroy"
  get "/cars/:user_id/bookings", to: "bookings#index", as: :display_bookings
  patch "/cars/:user_id/bookings/accept", to: "bookings#accept"
  patch "/cars/:user_id/bookings/decline", to: "bookings#decline"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

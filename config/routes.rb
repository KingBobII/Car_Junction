Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index_all"
  get '/my_cars', to: "cars#index"

  patch "/cars/:car_id/bookings/:id/accept(.:format) ", to: "bookings#accept", as: :accept_booking
  patch "/cars/:car_id/bookings/:id/reject(.:format)", to: "bookings#reject", as: :reject_booking

  resources :cars do
    resources :bookings, only: [:new, :create]
    # member do
    #   patch 'accept'
    #   patch 'reject'
    # end
    # member do
    #   patch 'accept'
    #   patch 'reject'
    # end
  end

  resources :bookings, only: [:index, :destroy, :show]
  # get "/cars/new", to: "pages#new"
  # get "/cars/:id", to: "pages#show", as: :show_cars
  # get "/cars", to: "pages#index"
  # post "/cars", to: "pages#create"

  # get "/cars/:user_id/:car_id/bookings/new", to: "bookings#new", as: :car_bookings
  # post "/cars/:user_id/:car_id/bookings", to: "bookings#create"
  # delete "/cars/:user_id/:car_id/bookings/:id", to: "bookings#destroy", as: :bookings
  # get "/cars/:user_id/:car_id/bookings/:id", to: "bookings#show", as: :show_booking
  # get "/cars/:user_id/bookings", to: "bookings#index", as: :display_bookings
  # patch "/cars/:user_id/bookings/:id/accept", to: "bookings#accept", as: :accept_booking
  # patch "/cars/:user_id/bookings/:id/decline", to: "bookings#decline", as: :decline_booking

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

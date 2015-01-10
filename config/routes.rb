MorganFloors::Application.routes.draw do
  get "testimonial/index"
  devise_for :admins

  root 'home#index'
  get "/contact", to: "contact#index"
  get "/resource", to: "resource#index"
  get "/gallery", to: "gallery#index"
  get "/home", to: "home#index"
  get "/testimonial", to: "testimonial#index"

  post "/update_about", to: "home#update_about"
end

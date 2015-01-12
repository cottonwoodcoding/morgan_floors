MorganFloors::Application.routes.draw do
  get "testimonial/index"
  devise_for :admins

  root 'home#index'
  get "/contact", to: "contact#index"
  get "/resource", to: "resource#index"
  get "/gallery", to: "gallery#index"
  get "/home", to: "home#index"
  get "/testimonial", to: "testimonial#index"
  get "/video_description", to: 'resource#video_description'
  get "/testimonial_list_view", to: 'testimonial#testimonial_list'

  post "/update_about", to: "home#update_about"
  post "/add_video", to: 'resource#add_video'
  post "/main_video", to: 'resource#main_video'
  post "/add_link", to: 'resource#add_link'
  post "/link_up", to: 'resource#link_up'
  post "/link_down", to: 'resource#link_down'
  post "/add_testimonial", to: 'testimonial#new'
  post "/approve_comment", to: 'testimonial#approve'

  delete "/delete_video", to: 'resource#delete_video'
  delete "/delete_link", to: 'resource#delete_link'
  delete "/delete_comment", to: 'testimonial#delete'
end

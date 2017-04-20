Rails.application.routes.draw do

  get 'users/new'

  match '/', to: 'static_pages#home', via: 'get'
  #get 'home/index' => 'static_pages/home'
  get 'static_pages/home'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "static_pages/about"
  get "static_pages/contact"
end

Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  root 'application#home'

  resources :sessions, only: [:create]
  resources :venues
  resources :users
  resources :caterers 
  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  patch "/events/:id/addguest", to: "events#addguest", as: "addguest"
  delete "/events/:id/removeguest", to: "events#removeguest", as: "removeguest"
end


#new_session_path(resource_name)
Rails.application.routes.draw do

  resources :users
  resources :photos

  # Nest routes for users and their photos
=begin
  resources :users do
    collection do
      resources :photos
    end
  end
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :photos
end

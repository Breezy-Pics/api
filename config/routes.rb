Rails.application.routes.draw do

  # Nest routes for users and their photos
  resources :users do
    collection do
      resources :photos
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

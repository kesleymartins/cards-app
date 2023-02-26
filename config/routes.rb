Rails.application.routes.draw do
  root "collections#index"

  resources :collections, except: %i[ show ]
end

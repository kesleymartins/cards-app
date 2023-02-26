Rails.application.routes.draw do
  root "collections#index"

  resources :collections, except: %i[ show ] do
    resources :cards, except: %i[ show ]
  end
end

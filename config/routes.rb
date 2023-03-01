Rails.application.routes.draw do
  root "collections#index"

  resources :collections, except: %i[ show ] do
    resources :cards, except: %i[ show ]

    resources :cycles, only: %i[ new create show ] do
      resources :cycle_cards, only: %i[ show ], shallow: true
    end
  end
end

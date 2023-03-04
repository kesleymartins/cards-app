Rails.application.routes.draw do
  root "pages#home"

  resources :collections, except: %i[ show ] do
    resources :cards, except: %i[ show ]

    resources :cycles, only: %i[ new create show ], shallow: true do
      resources :cycle_cards, only: %i[ update ], shallow: true
    end
  end

  get 'cycles/:id/next-card', to: 'cycles#next_card', as: :cycle_next_card

  devise_for :users
end

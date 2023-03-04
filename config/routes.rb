Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'collections#index'
    end
  
    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end

  resources :collections, except: %i[ show ] do
    resources :cards, except: %i[ show ]

    resources :cycles, only: %i[ new create show ], shallow: true do
      resources :cycle_cards, only: %i[ update ], shallow: true
    end
  end

  get 'cycles/:id/next-card', to: 'cycles#next_card', as: :cycle_next_card
end

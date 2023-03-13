Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'collections#owned'
    end
  
    unauthenticated do
      root 'pages#home', as: :unauthenticated_root
    end
  end

  resources :collections, except: %i[ index show ] do
    resources :cards, except: %i[ show ]
    resources :executions, shallow: true, only: %i[ new create show ]
    resources :favorites, only: %i[ create destroy ]
  end

  scope :collections do
    get '/public', to: 'collections#public', as: :public_collections
    get '/favorites', to: 'collections#favorites', as: :favorite_collections
    get '/owned', to: 'collections#owned', as: :owned_collections
  end

  resources :cycles, only: %i[ show update ]
end

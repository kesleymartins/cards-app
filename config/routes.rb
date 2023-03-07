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
    resources :executions, shallow: true, only: %i[ new create show ]
    
  end

  resources :cycles, only: %i[ show update ]
end

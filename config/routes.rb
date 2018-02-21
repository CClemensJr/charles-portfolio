Rails.application.routes.draw do
  # We are able to remove this resource because the websockets from ActionCable allows for sending and receiving of data
  #resources :comments

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  resources :portfolios, except: [:show] #except allows the resources to be collected for all portfolio actions except show
  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' #assign a new path to the show action and rename the prefix

  # Allows websocket connection to be created
  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end

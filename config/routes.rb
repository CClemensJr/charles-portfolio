Rails.application.routes.draw do
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs
  resources :portfolios, except: [:show] #except allows the resources to be collected for all portfolio actions except show
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show' #assign a new path to the show action and rename the prefix

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

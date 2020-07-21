Rails.application.routes.draw do
  resources :endorsements
  resources :affiliates
  resources :pages
  mount ActionCable.server => '/cable'

  devise_for :users

  ActiveAdmin.routes(self)
  
  get 'welcome', to: "welcome#show"
  get 'confirm_age', to: "welcome#confirm_age"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#show'

  get '/schedule.json', to: 'schedule#json'

  get "user/:username", to: 'user#show'
  get 'user/:username/edit', to: 'user#edit'
  post 'user/:username/update', to: 'user#update'
  patch 'user/:username/update', to: 'user#update'
  get 'user/:username/update', to: 'user#update'
  
  get '/:slug', to: "pages#show"

end

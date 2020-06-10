Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  devise_for :users
  get 'welcome', to: "welcome#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#show'
end

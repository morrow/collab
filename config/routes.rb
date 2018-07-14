Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: :restricted_registrations}

  get '/editor', :to => 'editor#show'
  get '/editor/:lang', :to => 'editor#show'
  get '/projects/:id/:lang', :to => 'projects#show'

  resources :rooms
  resources :projects

  root to: 'home#index'

  mount ActionCable.server => '/cable'

end

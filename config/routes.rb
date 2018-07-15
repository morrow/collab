Rails.application.routes.draw do

  # devise_for :users, :controllers => {registrations: :restricted_registrations}
  devise_for :users

  get '/editor', :to => 'editor#show'
  get '/editor/:lang', :to => 'editor#show'
  get '/projects/:id/html', :to => 'projects#show'
  get '/projects/:id/css', :to => 'projects#show'
  get '/projects/:id/javascript', :to => 'projects#show'

  resources :rooms
  resources :projects
  resources :users

  root to: 'home#index'

  mount ActionCable.server => '/cable'

end

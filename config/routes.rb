Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get 'home/sample'
  get '/scrum', to: 'scrums#show', as: 'scrum'
  get '/scrum/new', to: 'scrums#new', as: 'new_scrum'
  post '/scrum/create', to: 'scrums#create', as: 'scrums'
  patch '/scrum/:id', to: 'scrums#update'
end
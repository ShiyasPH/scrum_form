Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  root to: 'home#login'
  get 'scrum', to: 'scrums#show', as: 'scrum'
  get 'scrum/new', to: 'scrums#new', as: 'new_scrum'
  post 'scrum/create', to: 'scrums#create', as: 'create_scrum'
  get 'scrum/:id/edit', to: 'scrums#edit', as: 'edit_scrum'
  patch 'scrum/:id', to: 'scrums#update', as: 'update_scrum'
end
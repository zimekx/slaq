Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, skip: [:sessions]
  root 'rooms#show'

  get 'rooms/show'
  mount ActionCable.server => '/cable'

  post 'auth_user' => 'authentication#authenticate_user'
end

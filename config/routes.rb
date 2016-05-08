Rails.application.routes.draw do
  root 'rooms#show'

  get 'rooms/show'
  mount ActionCable.server => '/cable'
end

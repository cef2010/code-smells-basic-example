Rails.application.routes.draw do
  resources :owners
  resources :cats

  get 'owners/index'

  get 'owners/show'

  get 'cats/index'

  get 'cats/show'

  root 'owners#index'
end

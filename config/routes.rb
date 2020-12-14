Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  devise_for :users, path: 'u'

  root to: 'marketing/landing#index'

  # mount ActionCable.server => '/cable'
end

Rails.application.routes.draw do

  root 'welcome#dashboard'

  get 'welcome/dashboard'

  resources :calls

  devise_for :users

end

Rails.application.routes.draw do

  root 'welcome#index'

  resources :calls

  devise_for :users

end

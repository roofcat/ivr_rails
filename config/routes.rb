Rails.application.routes.draw do

  root 'welcome#dashboard'

  get 'welcome/dashboard'

  get '/export', to: 'welcome#export', as: 'welcome_export'

  resources :calls

  devise_for :users

end

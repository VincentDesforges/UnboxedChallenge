Rails.application.routes.draw do

  resources :git_users, only: [ :index, :new, :create, :show ]

  root to: 'pages#home'
end

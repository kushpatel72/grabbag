Grabbag::Application.routes.draw do

  resources :users, :only => [:show]

  resources :UserTransactions

  resources :CompanyTransactions
  
  devise_for :users, :path => 'accounts'

  root :to => 'pages#home'
  
end

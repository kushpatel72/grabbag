Grabbag::Application.routes.draw do

  resources :UserTransactions

  resources :CompanyTransactions
  
  devise_for :users

 root :to => 'pages#home'
end

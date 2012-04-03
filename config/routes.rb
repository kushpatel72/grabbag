Grabbag::Application.routes.draw do
  get "profiles/create"

  get "profiles/edit"

  get "profiles/update"

  get "profiles/show"

  get "profiles/destroy"

  devise_for :users

 root :to => 'pages#home'
end

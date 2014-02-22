Tuggler::Application.routes.draw do
  get "projects/create"

  get "projects/show"

  resources :users
  
  # root :to => 'welcome#index'

end

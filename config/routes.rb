Tuggler::Application.routes.draw do
  get "screenshots/create"

  get "screenshots/index"

  get "screenshots/show"

  get "comments/create"

  get "comments/show"

  get "comments/index"

  get "tasks/index"

  get "tasks/create"

  get "tasks/show"

  get "bug/index"

  get "bug/create"

  get "bug/show"

  get "pages/create"

  get "pages/show"

  get "projects/create"

  get "projects/show"

  resources :users
  
  # root :to => 'welcome#index'

end

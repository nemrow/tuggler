Tuggler::Application.routes.draw do
  get "test_views/bugs"

  get "test_views/tasks"

  get "sessions/create"

  get "sessions/destroy"

  match "screenshots/create"

  get "screenshots/index"

  get "screenshots/show"

  get "comments/create"

  get "comments/show"

  get "comments/index"

  get "tasks/index"

  match "tasks/create"

  get "tasks/show"

  get "bug/index"

  match "bug/create"

  get "bug/show"

  get "pages/create"

  get "pages/show"

  get "projects/create"

  get "projects/show"

  get "loaders/new"

  get "loaders/load_css"
  get "loaders/load_fancybox_css"

  resources :users
  
  root :to => 'users#new'

end

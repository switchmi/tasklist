Rails.application.routes.draw do
  get 'lists/new'

  get 'lists/create'

  get 'lists/update'

  get 'lists/edit'

  get 'lists/destroy'

  get 'lists/index'

  get 'lists/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :lists do
    resources :tasks
  end
end

Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/show'

  get 'users/index'

  get 'users/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

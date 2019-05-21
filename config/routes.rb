Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'tasks', to: '/tasks'
  resources :tasks
  get 'tasks/:id', to: 'tasks#id'
  get 'tasks/new', to: 'tasks#new'
  post 'tasks', to: 'tasks#create'
end

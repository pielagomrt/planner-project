Rails.application.routes.draw do
 
  devise_for :users

  root to: "categories#index"

  # for due today
  post '/tasks/show_due', to: 'tasks#index'

  # for assigning complete and incomplete
  match 'users/:user_id/categories/:category_id/tasks/:id/complete' => 'tasks#completed', as: 'complete_task', via: :put
  match 'users/:user_id/categories/:category_id/tasks/:id/complete' => 'tasks#incomplete', as: 'incomplete_task', via: :delete
  
  resources :users do
    resources :categories do
      resources :tasks
    end
  end

   # get 'categories/' => 'categories#index', as: 'categories'
  # get 'categories/new' => 'categories#new', as: 'new_category'
  # post 'categories/' => 'categories#create', as: 'create_category'
  # get '/categories/:id/show' => 'categories#show', as: 'show_category'
  # get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  # put '/categories/:id/update' => 'categories#update', as: 'update_category'
  # delete '/categories/:id' => 'categories#delete', as: 'delete_category'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

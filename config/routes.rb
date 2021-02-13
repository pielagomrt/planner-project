Rails.application.routes.draw do

  root 'categories#index'

  resources :categories do
    resources :tasks
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

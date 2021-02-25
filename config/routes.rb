Rails.application.routes.draw do
  devise_for :users

  root to: "categories#index"

  # for due today
  post '/tasks/show_due', to: 'tasks#index'

  # for assigning complete and pending
  match 'users/:user_id/categories/:category_id/tasks/:id/completed' => 'tasks#completed', as: 'completed_task', via: :put
  match 'users/:user_id/categories/:category_id/tasks/:id/pending' => 'tasks#pending', as: 'pending_task', via: :put
  
  resources :users do
    resources :categories do
      resources :tasks
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

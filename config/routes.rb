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
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

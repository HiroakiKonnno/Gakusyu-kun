Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete '/lessons/id/edit/task/id', to: 'lessons#destroy_task'
  delete '/userlessons/id', to: 'lessons#destroy_user'
  get 'users/user_id/lessons/id', to: 'users#user_lesson'
  get 'users/user_id/lessons/id/index', to: 'users#user_lesson_index'
  get 'users/user_id/lessons/lesson_id/tasks/id', to: 'users#user_task'
  patch 'users/user_id/lessons/lesson_id/tasks/id', to: 'users#user_task_update'

  resources :users do
    member do
      get 'edit_learner_info'
      patch 'update_learner_info'
    end
  end
  resources :lessons
end

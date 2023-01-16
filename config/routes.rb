Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  root to: 'questions#index'
  post '/questions', to: 'questions#create'
  patch '/questions/:id', to: 'questions#update'
  delete '/questions/:id', to: 'questions#destroy'
  resources :questions
end

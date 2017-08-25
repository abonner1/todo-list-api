Rails.application.routes.draw do

  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :users, only: [:create]
    resources :todo_lists, only: [:index, :create, :destroy], shallow: true do
      resources :todos, only: [:index, :create, :update, :destroy]
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    resources :users, except: [:index, :new, :edit] do
      resources :todo_lists, shallow: true do
        resources :todos, only: [:create, :update, :destroy]
      end
    end
  end
end

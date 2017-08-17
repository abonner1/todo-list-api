Rails.application.routes.draw do

  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :todo_lists, shallow: true do
      resources :todos, only: [:index, :create, :update, :destroy]
    end
  end
end

# resources :users, except: [:index, :new, :edit] do
# end

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: [:create, :show, :update, :destroy] do
      resources :todo_lists, shallow: true do
        resources :todos, only: [:create, :update, :destroy]
      end
    end
  end
end

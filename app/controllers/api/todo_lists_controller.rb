class Api::TodoListsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_todo_list, only: [:show, :update, :destroy]

  def index
    render json: @todo_lists
  end

  def create
    @user.todo_lists.build(todo_list_params)
    if @user.save
      render json: @user.todo_lists.last
    else
      render json: {message: @user.todo_lists.last.errors}, status: 400
    end
  end

  def show
    render json: @todo_list
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: @todo_list
    else
      render json: {message: @todo_list.errors}, status: 400
    end
  end

  def destroy
    todos = @todo_list.todos
    if @todo_list.destroy
      todos.each do |todo|
        todo.destroy
      end
      render json: {message: 'Success'}, status: 204
    else
      render json: {message: @todo_list.errors}, status: 400
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def set_users_todo_lists
      @todo_lists = @user.todo_lists
    end

    def set_todo_list
      @todo_list = TodoList.find_by(id: params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:name, :user_id, :date, :is_favorited)
    end

end

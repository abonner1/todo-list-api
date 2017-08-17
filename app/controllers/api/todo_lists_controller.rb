class Api::TodoListsController < ApplicationController
  before_action :authenticate_user
  before_action :set_todo_list, only: [:show, :update, :destroy]

  def index
    render json: current_user.todo_lists
  end

  def create
    current_user.todo_lists.build(todo_list_params)
    if current_user.save
      render json: current_user.todo_lists.last
    else
      render json: {message: todo_list.errors.full_messages}, status: 400
    end
  end

  def show
    if @todo_list
      render json: @todo_list
    else
      render json: {message: "Not Found"}, status: 404
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: @todo_list
    else
      render json: {message: @todo_list.errors.full_messages}, status: 400
    end
  end

  def destroy
    todos = @todo_list.todos
    if @todo_list.destroy
      todos.each do |todo|
        todo.destroy
      end
      render json: {message: 'Deleted Successfully'}, status: 204
    else
      render json: {message: @todo_list.errors.full_messages}, status: 400
    end
  end

  private

    def set_todo_list
      @todo_list = TodoList.find_by(id: params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end

end

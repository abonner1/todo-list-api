class Api::TodosController < ApplicationController
  before_action :set_todo_list, only: [:index, :create]
  before_action :set_todo, except: [:create]

  def index
    if @todo_list && @todo_list.todos
      render json: @todo_list.todos
    else
      render json: {message: "Not Found"}, status: 400
    end
  end

  def create
    @todo_list.todos.build(todo_params)
    if @todo_list.save
      render json: @todo_list.todos.last
    else
      render json: {message: todo_list.errors.full_messags}, status: 400
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: {message: todo_list.errors.full_messags}, status: 400
    end
  end

  def destroy
    if @todo.destroy
      render json: {message: 'Deleted Successfully'}, status: 204
    else
      render json: {message: @todo.errors.full_messags}, status: 400
    end
  end

  private

    def set_todo_list
      @todo_list = TodoList.find_by(id: params[:todo_list_id])
    end

    def set_todo
      @todo = Todo.find_by(id: params[:id])
    end

    def todo_params
      params.require(:todo).permit(:description, :todo_list_id, :is_completed)
    end

end

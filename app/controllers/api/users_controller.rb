class Api::UsersController < ApplicationController
  before_action :set_user, except: [:create]

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {message: user.errors}, status: 400
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: {message: @user.errors}, status: 400
    end
  end

  def destroy
    todo_lists = @user.todo_lists
    if @user.destroy
      todo_lists.each do |todo_list|
        todo_list.todos.each do |todo|
          todo.destroy
        end
        todo_list.destroy
      end
      render json: {message: 'Success'}, status: 204
    else
      render json:{message: @user.erros}, status: 400
    end
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :username)
    end

end

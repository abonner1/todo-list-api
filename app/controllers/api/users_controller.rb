class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { head: :success}
    else
      render json: {message: user.errors.full_messages.join}
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :username)
    end

end

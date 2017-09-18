class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { head: :success, body: user}
    else
      render json: {message: user.errors.full_messages.join}, status: 403
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

end

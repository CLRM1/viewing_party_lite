class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      message = user.errors.full_messages.to_sentence
      redirect_to '/register'
      flash[:alert] = "Error: #{message}"
    end
  end

  def discover
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

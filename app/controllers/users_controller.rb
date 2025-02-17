class UsersController < ApplicationController
  def new
  end

  def show
    user_id = session[:user_id]
    if user_id == nil
      flash[:alert] = "Error: you must be logged in or registered to access the dashboard."
      redirect_to root_path
    else
      @user = User.find(user_id)
    end
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    if user.save
      redirect_to "/dashboard"
    else
      message = user.errors.full_messages.to_sentence
      redirect_to '/register'
      flash[:alert] = "Error: #{message}"
    end
  end

  def login_form
  end

  def login_user
    user = User.where(email: params[:email]).first
    session[:user_id] = user.id
    if user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}"
      redirect_to "/dashboard"
    else
      redirect_to "/login"
      flash[:error] = "Incorrect password"
    end
  end

  def logout_user
    session.destroy
    redirect_to root_path
  end

  def discover
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

class UsersController < ApplicationController
  before_action :user_loggedin?, only: %i[index show update]
  before_action :find_user, only: %i[show update]

  def new
    @user = User.new
  end

  def index; end

  def show; end

  def update; end

  def logout
    reset_session
    redirect_to login_path
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user] = @user
      redirect_to user_path(@user), notice: 'User successfully created'
    else
      render new_user_path, notice: 'User was not created'
    end
  end

  def signin
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      session[:current_user] = @user
      redirect_to root_path
    else
      redirect_to login_path, notice: 'Username not found'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end

  def find_user
    if params[:id].nil?
      flash[:notice] = 'Invalid user'
    else
      @user = User.find(params[:id])
    end
  end

  def user_loggedin?
    redirect_to login_path if session[:current_user].nil?
  end

  def signin_params
    params.require(:user).permit(:username)
  end
end

class UsersController < ApplicationController
    # before_action :check_for_logout

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def update
      @current_user.avatar.purge
      @current_user.update_attributes :avatar => user_params[:avatar]
      redirect_to users_path
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to feeds_path
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end
  

  private
  def user_params
    params.required(:user).permit(:email, :name, :password, :password_confirmation, :avatar)
  end
end

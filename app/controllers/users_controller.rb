class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def update
      if params[:file].present?
        req = Cloudinary::Uploader.upload params[:file]
        @current_user.image = req["public_id"]
        @current_user.save
      end
      redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if params[:file].present?
      req = Cloudinary::Uploader.upload params[:file]
      @user.image = req["public_id"]
      @user.save
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to feeds_path
    else
      render :new
    end
  end



  private
  def user_params
    params.required(:user).permit(:email, :name, :password, :password_confirmation)
  end
end

class SessionController < ApplicationController
  # before_action :check_for_logout

  def new
  end
  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to feeds_path
    else
      flash[:error] = "Incorrect Email or Password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
 
end
